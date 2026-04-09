require "test_helper"

class PaymentTest < ActiveSupport::TestCase
   # test "the truth" do
   #   assert true
   # end
   #
   test "should not save payment without reservation" do
    payment = Payment.new(amount: 100.0, payment_method: "Credit Card")
    assert_not payment.save
  end
end
