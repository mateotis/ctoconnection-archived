class AddReviewedToApplicant < ActiveRecord::Migration[6.0]
  def change
    add_column :applicants, :reviewed, :boolean
  end
end
