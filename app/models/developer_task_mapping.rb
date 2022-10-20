class DeveloperTaskMapping < ApplicationRecord
    has_many :tasks
    has_many :users, class_name:"User"
end
