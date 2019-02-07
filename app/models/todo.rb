class Todo < ApplicationRecord
  has_many :todo_users, dependent: :destroy
  has_many :users, through: :todo_users
end
