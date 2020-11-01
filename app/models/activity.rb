class Activity < ApplicationRecord
  belongs_to :session

  enum activity_type: { presentation: 0, panel_discussion: 1, interview: 2 }
end
