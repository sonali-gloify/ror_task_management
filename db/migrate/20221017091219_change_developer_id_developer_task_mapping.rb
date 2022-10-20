class ChangeDeveloperIdDeveloperTaskMapping < ActiveRecord::Migration[5.0]
  def change
    remove_column :developer_task_mappings, :developer
    add_reference :developer_task_mappings, :user
  end
end
