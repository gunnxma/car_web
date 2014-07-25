class PhotosController < ApplicationController
  before_filter :check_power
  layout "nohead"
  
  def index
    @photo = CarPhoto.new(:photo_style => params[:photo_style], :car_info_id => params[:car_info_id])
    car = CarInfo.find(@photo.car_info_id)
    @photos = car.car_photos
  end
  
  def create
    @photo = CarPhoto.new(photo_params)
    if @photo.save
      redirect_to photos_url(:photo_style => @photo.photo_style, :car_info_id => @photo.car_info_id)
    else
      render "index"
    end
  end
  
  private
  
  def photo_params
    params.require(:car_photo).permit(:car_info_id, :photo_style, :photo)
  end
end
