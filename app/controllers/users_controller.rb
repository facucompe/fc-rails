class UsersController < ApplicationController
  def repositories
    user = User.find(params[:id])
    job = Job.create
    GithubWorker.perform_async(user.github_username, job.id)
    @job_id = job.id
  end
end
