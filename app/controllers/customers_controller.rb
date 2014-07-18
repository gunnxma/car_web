class CustomersController < ApplicationController
  def index
    @customers = Customer.all.order(id: :desc)
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def new
  end

  def edit
  end
end
