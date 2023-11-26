# frozen_string_literal: true

# Sidekiq job to remove inactive users
class RemoveInactiveUsersSidekiqJob
  include Sidekiq::Job

  def perform(*_args)
    RemoveInactiveUsersService.remove_inactive_users
  end
end
