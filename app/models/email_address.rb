class EmailAddress < ApplicationRecord
  belongs_to :user

  before_validation :normalize_email_address, on: %i[create update]

  validates :email_address, presence: true, uniqueness: { case_sensitive: false }

  private

  def normalize_email_address
    self.email_address = email_address.strip.downcase
  end
end
