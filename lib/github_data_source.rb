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
      @tree_file ||= Base64.decode64(octokit.contents('empirical-org/Documentation', path: 'documents.json', ref: 'config').content)
    end

    def tree
      @tree ||= octokit.tree('empirical-org/Documentation', 'master', recursive: true).tree
    end

    def sitemap
      return @sitemap if defined? @sitemap
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
          extension: 'md',
          github: true
        }

        if file.type == 'tree'
          attrs[:id]  = attrs[:filename]
          attrs[:dir] = true

          begin
            blob = octokit.contents('empirical-org/Documentation', path: file.path + '/README.md')
            item = Nanoc::Item.new(Base64.decode64(blob.content), file.attrs.merge(attrs), attrs[:id], binary: false)
          rescue Octokit::NotFound => e
            item = Nanoc::Item.new('', file.attrs.merge(attrs), attrs[:id], binary: false)
          end

          loc[item[:id]] ||= {}
          loc[item[:id]][:item] = item
        else
          attrs[:id]  = file_identifier(file)
          attrs[:dir] = false

          blob = octokit.blob('empirical-org/Documentation', file.sha)
          item = Nanoc::Item.new(Base64.decode64(blob.content), file.attrs.merge(attrs), attrs[:id], binary: false)

          loc[:files] ||= []
          loc[:files] << attrs.dup.merge(item: item)
        end

        @items << item
      end

      blob = octokit.contents('empirical-org/Documentation', path: 'README.md')
      item = Nanoc::Item.new(Base64.decode64(blob.content), {extension: 'md', parents: [], dir: true, root: true, id: 'Docs', github: true}, '/', binary: false)
      @items.unshift(res['Docs'][:item] = item)

      @sitemap = res
    end

    def files_for item
      return [] unless item[:github]
      nav_for(item)[:files] || []
    end

    def folders_for item
      return [] unless item[:github]
      nav_for(item).except(:files, :item)
    end

    def nav_for item
      dir = item[:parents].inject(sitemap){|c,p| c[p] }
      if item[:dir] then dir[item[:id]] else dir end
    end

    def octokit
      Octokit::Client.new \
        client_id:     '99fea561063c2e1ceddd',
        client_secret: 'cd3e0c5725e431bed3ee54826d09df85e97d3f8a'
    end
  end

  extend Tree
end
