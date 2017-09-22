class GithubService
  include HTTParty
  base_uri 'api.github.com'

  def repositories(username)
    response = self.class.get("/users/#{username}/repos", type: 'all').parsed_response
    response.collect do |repo|
      { name: repo['name'], url: repo['url'] }
    end
  end
end
