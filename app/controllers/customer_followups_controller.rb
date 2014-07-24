class CustomerFollowupsController < ApplicationController
  before_filter :get_followups, :only => [:new, :create, :edit, :update]
  def new
    @followup = @customer.followups.build
    @followup.has_next = 1
    @followup.next_time = 3.days.since
  end
  
  def create
    @customer.customer_other.business_stage_id = params[:business_stage_id]
    @followup = @customer.followups.build(followup_params)
    @followup.user_id = current_user.id
    @followup.addtime = DateTime.now
    @followup.is_finished = 0
    if @customer.save
      redirect_to :action => :new, :customer_id => @customer.id
    else
      render "new"
    end
  end
  
  def edit
    @followup = @customer.followups.find(params[:id])
  end
  
  def update
    @followup = @customer.followups.find(params[:id])
    if @followup.update_attributes(followup_params)
      redirect_to :action => :new, :customer_id => @customer.id
    else
      render "edit"
    end
  end
  
  private
  
  def get_followups
    @customer = Customer.find(params[:customer_id])
    @followups = @customer.followups.where(:user_id => current_user.id)
  end
  
  def followup_params
    params.require(:followup).permit(:followup_type_id, :content, :next_content, :next_time, :is_finished, :has_next)
  end
end
