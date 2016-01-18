class TodosController < ApplicationController
  before_action :set_goal

  def new
    @todo = @goal.todos.new
  end

  def create
    @todo = @goal.todos.create(todo_params)
    if @todo.save
      redirect_to goal_path(@goal)
      flash[:notice] = "todo saved!"
    else
      flash[:notice] = "there was an error saving your todo"
    end
  end

  def edit
    @todo = @goal.todos.find(params[:id])
  end

  def update
    @todo = @goal.todos.find(params[:id])
    @todo.update(todo_params)
    if @todo.save
      flash[:notice] = "todo successfully saved!"
      redirect_to goal_path(@goal)
    else
      flash[:notice] = "todo could not be saved"
      render :edit
    end
  end

  def destroy
    @todo = @goal.todos.find(params[:id])
    @todo.destroy
    redirect_to goal_path(@goal)
  end

  private

  def todo_params
    params.require(:todo).permit(
    :title,
    :description
    )
  end

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

end
