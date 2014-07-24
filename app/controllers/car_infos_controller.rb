class CarInfosController < ApplicationController
  def show
    @car = CarInfo.find(params[:id])
  end
end
