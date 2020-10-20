class User < ApplicationRecord
  validates :linkedin_username, uniqueness: { allow_nil: true }
end
