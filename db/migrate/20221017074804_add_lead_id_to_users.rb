class AddLeadIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lead_id, :integer
    add_index :users, :lead_id
  end
end
