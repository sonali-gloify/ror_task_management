class ChangeAssigneeReporterTask < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :assignee, :string
    add_column :tasks, :assignee, :integer, references: :users
    remove_column :tasks, :reporter, :string
    add_column :tasks, :reporter, :integer, references: :users
  end
end
