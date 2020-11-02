class Presentation < ApplicationRecord
  belongs_to :activity
  belongs_to :session
  belongs_to :event
  belongs_to :company
  belongs_to :presented_by, class_name: 'User', required: false

  validates :title, presence: true
end
