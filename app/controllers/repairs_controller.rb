class RepairsController < ApplicationController
  def index
  end

  def new
    @repair = Repair.new
    @repair.style = 0
  end

  def edit
  end
end
