module NavigationHelper
  def navigation_title
    item[:parents].last
  end

  def navigation_files
    files_for(@item)
  end

  def navigation_folders
    folders_for(@item)
  end

  def files_for item
    GithubDataSource.files_for(item)
  end

  def folders_for item
    GithubDataSource.folders_for(item)
  end

  def github_link item
    return nil if item[:extension] != 'md'

    "https://www.github.com/empirical-org/Documentation/blob/master/#{(item[:parents] - ['Docs']).join('/')}/#{item[:filename]}"
  end
end
