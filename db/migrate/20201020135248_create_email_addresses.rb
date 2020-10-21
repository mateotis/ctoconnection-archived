class CreateEmailAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :email_addresses do |t|
      t.string :email_address
      t.boolean :primary
      t.boolean :home
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
