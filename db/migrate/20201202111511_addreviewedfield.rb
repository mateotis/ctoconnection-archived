class Addreviewedfield < ActiveRecord::Migration[6.0]
  def change
    add_column :applicants, :reviewed, :boolean, default: false
  end
end
