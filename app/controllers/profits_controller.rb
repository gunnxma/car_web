class ProfitsController < ApplicationController
  before_filter :check_power
  def index
    @cars = CarInfo.where(:status => 3)
    respond_to do |format|
      format.html
      format.xls
    end
  end
end
