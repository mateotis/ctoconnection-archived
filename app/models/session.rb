class Session < ApplicationRecord
  has_many :activities, dependent: :destroy
  belongs_to :event

  before_validation :set_duration, on: %i[create update]
  after_commit :set_event_time_period, on: %i[create update]

  validates :title, :starts, :ends, presence: true
  validates :duration, numericality: { greater_than: 0, allow_nil: true }

  private

  def set_duration
    return if starts.nil? || ends.nil?

    self.duration = ((ends - starts) / 1.minutes).to_i
  end

  def set_event_time_period
    event.update(starts: event.sessions.minimum(:starts), ends: event.sessions.maximum(:ends))
  end
end
