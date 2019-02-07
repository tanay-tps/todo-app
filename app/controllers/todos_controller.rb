class TodosController < ApplicationController

  before_action :get_todo, only: [:update,:destroy, :check_collaborative_user, :show]
  before_action :check_collaborative_user, only: [:update, :destroy]
  
  def create
    todo = current_resource_owner.todos.create(todo_params)
    if todo.save!
      todo.todo_users.find_by(todo: todo, user: current_resource_owner).update(is_creator: true)
      todo.update(user_id: current_resource_owner.id)
      render json: { success: "true", message: "todo create  successfully", data: {todo: todo} }, status: 201
    else
      render json: { success: "false", message: "There was an error" }, status: 422
    end 
  end

  def show
    if @todo
      render json: {data: {todo: @todo, todo_users: @todo.users} }
    else
      render json: { success: "false", message: "There was an error" }, status: 422
    end
  end

  def index
    @todos = current_resource_owner.todos
    if @todos.present?
      render json: {data: {todos: @todos} }
    else
      render json: { success: "false", message: "There was an error No todos found !" }, status: 422
    end
  end

  def update
    if @todo && @todo_user
      @todo.update_attributes(todo_params)
      if @todo.save!
        render json: {data: {todo: @todo} }
      else
        render json: { success: "false", message: "There was an error" }, status: 422
      end
    else
      render json: { message: "You are not authorized" }
    end
  end

  def destroy
    if @todo
      @todo.destroy!
      head 200
    else
      render json: { message: "You are not authorized" }
    end
  end
  
  private

  def todo_params
    params.require(:todo).permit(:title, :description, :user_id, :user_ids => [])
  end

  def get_todo
    @todo = Todo.find_by(id: params[:id])
  end

  def check_collaborative_user
    @todo_user = TodoUser.find_by(todo: @todo, user: current_resource_owner) if @todo
    @todo_user = @todo_user.present? ? @todo_user :  @todo.user_id == current_resource_owner.id 
  end
end
