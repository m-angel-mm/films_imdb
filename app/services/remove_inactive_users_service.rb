# frozen_string_literal: true

# Service class to remove all inactive users
class RemoveInactiveUsersService
  def self.remove_inactive_users
    User.destroy_by(active: false)
  end
end
