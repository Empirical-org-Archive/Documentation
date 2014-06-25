module NanocRoot
  def root
    @root = loop do
      break(Dir.pwd) if Dir.glob('Rules').length == 1
      break(nil) if Dir.pwd == '/'
      Dir.chdir('..')
    end

    raise 'Not inside a Nanoc project' if @root.nil?
    Pathname.new(@root)
  end

  extend self
end

class GithubFileCache
  def initialize
    @base = NanocRoot.root.join('tmp', 'cache')
    FileUtils.mkdir_p(@base)
  end

  def read(key)
    File.read(@base.join(key))
  rescue Errno::ENOENT
    nil
  end

  def write(key, value)
    File.open(@base.join(key), 'w') {|f| f.write(value) }
  end
end

Octokit.middleware = Faraday::Builder.new do |builder|
  builder.use Faraday::HttpCache, shared_cache: false, store: GithubFileCache.new
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end

class GithubDataSource < Nanoc::DataSource
  identifier :github

  # See {Nanoc::DataSource#up}.
  # def up
  # end

  # See {Nanoc::DataSource#down}.
  # def down
  # end

  # See {Nanoc::DataSource#setup}.
  # def setup
  # end

  # See {Nanoc::DataSource#items}.
  def items
    self.class.load_objects
  end

  module Tree
    def load_objects
      @items || sitemap
      @items
    end

    def file_identifier file
      file.path.sub(/.md$/, '')
    end

    def tree_file
      @tree_file ||= Base64.decode64(Octokit.contents('empirical-org/Documentation', path: 'documents.json', ref: 'config').content)
    end

    def tree
      @tree ||= Octokit.tree('empirical-org/Documentation', 'master', recursive: true).tree
    end

    def sitemap
      res = loc = {}
      @items = []

      tree.each do |file|
        loc = res
        paths = file.path.split('/').unshift('Docs')
        filename = paths.pop

        paths.each do |seg|
          loc = loc[seg] ||= {}
        end

        attrs = {
          filename: filename,
          parents: paths,
        }

        if file.type == 'tree'
          attrs[:extension] = 'html'
          attrs[:id]        = attrs[:filename]

          @items << item = Nanoc::Item.new(File.read(NanocRoot.root.join('layouts', 'folder.html')), file.attrs.merge(attrs), attrs[:id], binary: false)

          loc[item[:id]] ||= {}
          loc[item[:id]][:item] = item
        else
          attrs[:extension] = 'md'
          attrs[:id]        = file_identifier(file)

          blob = Octokit.blob('empirical-org/Documentation', file.sha)
          @items << item = Nanoc::Item.new(Base64.decode64(blob.content), file.attrs.merge(attrs), attrs[:id], binary: false)

          loc[:files] ||= []
          loc[:files] << attrs.dup.merge(item: item)
        end
      end

      res
    end

    def files_for item
      nav_for(item)[:files] || []
    end

    def folders_for item
      nav_for(item).except(:files, :item)
    end

    def nav_for item
      dir = item[:parents].inject(sitemap){|c,p| c[p] }
      if item[:extension] == 'html' then dir[item[:id]] else dir end
    end
  end

  extend Tree
end
