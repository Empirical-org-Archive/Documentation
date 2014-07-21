class ApiDataSource < Nanoc::DataSource
  identifier :api

  def items
    [item]
  end

  def item
    attrs = {
      extension: 'slim',
      filename: 'API Reference',
      api: true,
      github_link: 'https://github.com/empirical-org/Compass-API/blob/master/lib/quill/api.yml'
    }

    Nanoc::Item.new(File.read(NanocRoot.root.join('lib', 'api_reference.slim')), attrs, '/api-reference', binary: false)
  end
end
