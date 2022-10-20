class CreateDeveloperTaskMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :developer_task_mappings do |t|
      t.integer :developer
      t.integer :task

      t.timestamps
    end
    add_index :developer_task_mappings, :developer
    add_index :developer_task_mappings, :task
  end
end
