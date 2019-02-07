class RemoveForeignKeyFromTodo < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :todos, :users
  end
end
