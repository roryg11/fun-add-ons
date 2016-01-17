class TodosController < ApplicationController
  def new
    @goal = Goal.new
  end

end
