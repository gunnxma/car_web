class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    if !cookies[:user_id]
      nil
    else
      User.find(cookies[:user_id])
    end
  end
  
  def check_power
    if !current_user
      redirect_to :action => :login
    else
      check_action unless current_user.id == 1
    end
  end
  
  def check_action
    # todo check current_user has current_action power
  end
end
