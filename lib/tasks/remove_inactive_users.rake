# frozen_string_literal: true

task :remove_inactive_users do
  RemoveInactiveUsersJob.set(wait: 1.week).perform_later
end
