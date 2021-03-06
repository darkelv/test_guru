module FooterHelper
  def current_year
    Time.current.year
  end

  def github_url(title, repo_url)
    link_to(title, repo_url, target: "_blank")
  end
end
