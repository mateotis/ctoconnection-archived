class CreateTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :talks do |t|
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
