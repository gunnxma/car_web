class PaymentsController < ApplicationController
  before_filter :check_power
  MAX_DETAIL = 20
  def index
    if current_user.id == 1
      @q = Payment.all.search(params[:q])
    else
      @q = Payment.where("payments.user_id = ?",current_user.id).search(params[:q])
    end
    if request.format == :xls
      @payments = @q.result.include(:car_info).order(addtime: :desc)
    else
      @payments = @q.result.paginate(:page => params[:page]).order(addtime: :desc)
    end
    #@payments = Payment.order(addtime: :desc)
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def new
    @payment = Payment.new
    @payment.user_id = current_user.id
    init_new_payment
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.cost = 0
    @payment.addtime = DateTime.now
    @payment.payment_details.each do |item|
      item.cost = 0 if item.cost.nil?
      @payment.cost += item.cost
    end

    if @payment.save
      redirect_to :action => :index
    else
      init_new_payment
      render "new"
    end
  end

  def edit
    @payment = Payment.find(params[:id])
    init_edit_payment
  end

  def update
    @payment = Payment.find(params[:id])
    @payment.payment_details.delete_all
    @payment.cost = 0
    if @payment.update_attributes(payment_params)
      @payment.payment_details.each do |item|
        item.cost = 0 if item.cost.nil?
        @payment.cost += item.cost
      end
      @payment.save
      redirect_to :action => :edit, :id => @payment.id
    else
      init_edit_payment
      render "edit"
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    flash[:notice] = "删除成功"
    redirect_to :action => :index
  end

  private

  def init_new_payment
    MAX_DETAIL.times do
      @payment.payment_details.build
    end
  end

  def init_edit_payment
    (MAX_DETAIL-@payment.payment_details.count).times do
      @payment.payment_details.build
    end
  end

  def payment_params
    params.require(:payment).permit(:car_info_id, :user_id, payment_details_attributes: [:pay_reason_id, :cost, :remark, :payments_way_id])
  end
end
