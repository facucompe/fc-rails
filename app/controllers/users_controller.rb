class UsersController < ApplicationController
  def repositories
    user = User.find(params[:id])
    github = GithubService.new
    @repositories = github.repositories(user.github_username)
  end
end
