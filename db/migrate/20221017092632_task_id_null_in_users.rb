class TaskIdNullInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :lead_id, :integer , null: true
  end
end
