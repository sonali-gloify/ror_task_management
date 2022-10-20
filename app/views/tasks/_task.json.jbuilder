json.extract! task, :id, :name, :assigned_date, :completion_date, :submission_date, :assignee, :reporter, :created_at, :updated_at
json.url task_url(task, format: :json)
