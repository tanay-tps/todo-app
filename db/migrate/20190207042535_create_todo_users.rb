class CreateTodoUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_users do |t|
      t.references :user, foreign_key: true
      t.references :todo, foreign_key: true
      t.boolean :is_creator, default: false

      t.timestamps
    end
  end
end
