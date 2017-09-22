class GithubWorker
  include Sidekiq::Worker
  def perform(username, job_id)
    job = Job.find(job_id)
    github = GithubService.new
    repositories = github.repositories(username)
    job.update(finished: true, response: repositories)
  end
end
