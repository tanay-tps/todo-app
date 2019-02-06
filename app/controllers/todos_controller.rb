class TodosController < ApplicationController

  before_action :get_todo, only: [:update,:destroy]
  
  def create
    todo = current_resource_owner.todos.create(todo_params)
    if todo.save!
      render json: { success: "true", message: "todo create  successfully", data: {todo: todo} }, status: 201
    else
      render json: { success: "false", message: "There was an error" }, status: 422
    end 
  end

  def update
    if @todo
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
    params.require(:todo).permit(:title, :description, :user_id)
  end

  def get_todo
    @todo = current_resource_owner.todos.find_by(id: params[:id])
  end
end
