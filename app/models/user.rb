class User < ApplicationRecord
  has_many :email_addresses, dependent: :destroy

  before_validation :normalize_attributes, on: %i[create update]

  validates :linkedin_username, uniqueness: { allow_nil: true }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  private

  def normalize_attributes
    %w[first_name last_name linkedin_username email].each do |name|
      send("#{name}=", send(name).strip.downcase) if send(name).respond_to?(:strip, :downcase)
    end
  end
end
