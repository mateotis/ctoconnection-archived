class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :title
      t.datetime :starts
      t.datetime :ends
      t.integer :duration
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
