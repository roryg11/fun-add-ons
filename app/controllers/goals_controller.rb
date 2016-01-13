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
