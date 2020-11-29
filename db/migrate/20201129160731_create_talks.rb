class CreateTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :talks do |t|

      t.datetime :cfp_start_time
      t.datetime :cfp_end_time
      t.timestamps
    end
  end
end
