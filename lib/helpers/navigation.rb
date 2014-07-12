module NavigationHelper
  def navigation_title
    return item[:id] if item[:dir]
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
    filename = if item[:dir]
      Pathname.new('/').join(*(item[:parents] - ['Docs']), item[:filename] || '/', 'README.md').to_s
    else
      "#{(item[:parents] - ['Docs']).join('/')}/#{item[:filename]}"
    end 

    "https://www.github.com/empirical-org/Documentation/blob/master/#{filename}"
  end
end
