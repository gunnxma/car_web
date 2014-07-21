class PaymentDetail < ActiveRecord::Base
  belongs_to :payment
  belongs_to :pay_reason
  belongs_to :payments_way
end
