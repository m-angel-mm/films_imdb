# frozen_string_literal: true

require 'sidekiq-scheduler'
# Sidekiq job to remove inactive users
class ScheduleRemoveInactiveUsersJob
  include Sidekiq::Worker

  def perform
    RemoveInactiveUsersService.remove_inactive_users
  end
end
