class GithubService
  include HTTParty
  base_uri 'api.github.com'

  def repositories(username)
    self.class.get("/users/#{username}/repos", {type: 'all'}).parsed_response
  end
end
