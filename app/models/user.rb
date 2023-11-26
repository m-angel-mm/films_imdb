# frozen_string_literal: true

# Users
class User < ApplicationRecord
  has_secure_password

  # Validations
  validates_presence_of :name, :email, :password_digest
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: 'Invalid email format' }
end
