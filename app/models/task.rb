class Task < ApplicationRecord
    belongs_to :reporter, class_name:"User"
    has_many :users, through:"developer_task_mapping"

    enum status: {
        assigned: 0,
        inprogress: 1,
        complete: 2
    }

    TASK_STATUS = ['assigned', 'inprogress', 'complete']
    
end
