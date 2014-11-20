class CarInfoFollowupsController < ApplicationController
  before_filter :check_power
  before_filter :get_followups, :only => [:new, :create, :edit, :update]
  def new
    @followup = @car_info.followups.build
    @followup.has_next = 1
    @followup.next_time = 3.days.since
    @followup.state = 0
  end

  def create
    @followup = @car_info.followups.build(followup_params)
    @followup.user_id = current_user.id
    @followup.addtime = DateTime.now
    @followup.is_finished = 0
    if @car_info.save
      redirect_to :action => :new, :car_info_id => @car_info.id
    else
      render "new"
    end
  end

  def edit
    @followup = @car_info.followups.find(params[:id])
    if params[:op] == "cancel"
      @followup.state = -1
    end
  end

  def update
    @followup = @car_info.followups.find(params[:id])
    if @followup.update_attributes(followup_params)
      if @followup.state = -1 && @followup.cancel_reason.empty?
        @followup.state = 0
        @followup.save
        @followup.state = -1
        render "edit"
      else
        redirect_to :action => :new, :car_info_id => @car_info.id
      end
    else
      render "edit"
    end
  end

  private

  def get_followups
    @car_info = CarInfo.find(params[:car_info_id])
    if current_user.id == 1
      @followups = @car_info.followups.all
    else
      @followups = @car_info.followups.where(:user_id => current_user.id)
    end
  end

  def followup_params
    params.require(:followup).permit(:followup_type_id, :content, :next_content, :next_time, :is_finished, :has_next, :state, :cancel_reason)
  end
end
