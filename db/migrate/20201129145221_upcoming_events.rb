class UpcomingEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :new_events do |t|
      t.datetime :cfp_start_time
      t.datetime :cfp_end_time

      t.timestamps
    end
  end
end
