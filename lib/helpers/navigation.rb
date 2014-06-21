module NavigationHelper
  def navigation_items folder = GithubDataSource.sitemap
    folder.each do |name, docs|
      if folder == :files
        yield()
      end
    end
  end

  def files_for item
    GithubDataSource.files_for(item)
  end
end
