class DeleteAssigneeFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :assignee
    remove_column :tasks, :reporter
    add_reference :tasks, :reporter
  end
end
