# frozen_string_literal: true

# Job to remove all inactive users
class RemoveInactiveUsersJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    RemoveInactiveUsersService.remove_inactive_users
  end
end
