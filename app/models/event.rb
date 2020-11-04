class Event < ApplicationRecord
  has_many :sessions, dependent: :destroy

  validates :title, presence: true
end
