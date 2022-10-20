class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :assigned_date
      t.date :completion_date
      t.date :submission_date
      t.string :assignee
      t.string :reporter

      t.timestamps
    end
  end
end
