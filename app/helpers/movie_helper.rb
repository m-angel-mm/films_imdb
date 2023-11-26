# frozen_string_literal: true

# Movie helper
module MovieHelper
  ADMIN_ROLE = 'admin'

  def user_is_admin?(user)
    user.role == ADMIN_ROLE
  end
end
