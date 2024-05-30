# frozen_string_literal: true

require 'octokit'

class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    repository_id = args.first

    record = Repository.find repository_id
    record.start_fetch

    client = Octokit::Client.new
    repo = client.repo Octokit::Repository.from_url(record.link)

    params = {
      owner_name: repo.owner.login,
      repo_name: repo.name,
      description: repo.description,
      default_branch: repo.default_branch,
      watchers_count: repo.watchers_count,
      language: repo.language,
      repo_created_at: repo.created_at,
      repo_updated_at: repo.updated_at
    }

    record.success_fetch
    record.fail! unless record.update(params)
  end
end
