class User < ApplicationRecord
  has_many :email_addresses, dependent: :destroy

  before_validation :normalize_attributes, on: %i[create update]

  validates :linkedin_username, uniqueness: { allow_nil: true }

  private

  def normalize_attributes
    %w[first_name last_name linkedin_username].each do |name|
      send("#{name}=", send(name).strip.downcase) if send(name).respond_to?(:strip, :downcase)
    end
  end
end
