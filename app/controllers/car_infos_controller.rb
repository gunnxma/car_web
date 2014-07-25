class CarInfosController < ApplicationController
  before_filter :check_power
  def show
    @car = CarInfo.find(params[:id])
  end
end
