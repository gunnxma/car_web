class UsersController < ApplicationController
  before_filter :check_power
  def index
    @users = User.where("id > 1")
  end

  def new
    @user = User.new
    if params[:department_id]
      @user.department_id = params[:department_id]
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :action => :index
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.user_depots.destroy_all
    @user.user_powers.destroy_all
    if @user.update_attributes(user_params)
      redirect_to :action => :index
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: :index
  end

  private

  def user_params
    params.require(:user).permit(:department_id, :name, :account, :pwd, :phone, user_powers_attributes: [:action_id], user_depots_attributes: [:depot_id])
  end
end
