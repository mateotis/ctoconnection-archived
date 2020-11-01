class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.integer :activity_type
      t.datetime :starts
      t.datetime :ends
      t.references :session, foreign_key: true

      t.timestamps
    end
  end
end
