class CreatePresentations < ActiveRecord::Migration[6.0]
  def change
    create_table :presentations do |t|
      t.string :title
      t.string :presenter_firstname
      t.string :presenter_lastname
      t.string :presenter_linkedin_username
      t.string :presenter_email
      t.string :presenter_title
      t.string :presenter_company
      t.references :activity, foreign_key: true
      t.references :session, foreign_key: true
      t.references :event, foreign_key: true
      t.references :company, foreign_key: true
      t.references :presented_by, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
