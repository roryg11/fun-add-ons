class GoalsController < ApplicationController

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to root_path
      flash[:notice] = "Goal Successfully Created"
    else
      render :new
      flash[:notice] = "There was an error saving your goal"
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    if @goal.save
      flash[:notice] = "goal successfully saved"
      redirect_to goals_path
    else
      render :edit
      flash[:notice] = "There was an error saving your goal"
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_path
    flash[:notice] = "delete successful"
  end

  private
  def goal_params
    params.require(:goal).permit(
      :name,
      :description,
      :due_date,
      :completed
    )
  end
end
