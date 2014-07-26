class IndexController < ApplicationController
  before_filter :check_login, :only => [:index]
  layout "nohead", :only => [ :login, :checklogin ]
  
  def index  
    
  end

  def login
    @user = User.new
  end
  
  def checklogin
    @user = User.new(user_params)
    check_user = User.where( "account = ? and pwd = ?", @user.account, @user.pwd).first
    if check_user
      cookies[:user_id] = check_user.id
      redirect_to :action => :index
    else
      flash[:notice] = "用户名密码错误！"
      redirect_to :action => :login
    end
  end

  def logout
    cookies.delete(:user_id)
    redirect_to :action => :login
  end
  
  private
  
  def check_login
    redirect_to :controller => :index, :action => :login unless current_user
  end
  
  def user_params
    params.require(:user).permit(:account, :pwd)
  end
end
