class RazorpayController < ApplicationController

  def pay

    @pay_razor=Razorpay::Payment.fetch(params["payment_id"]).capture({amount: params["amount"].to_i})

    @fees=params[:amount].to_i/100;
    @make_reciept=Receipt.create(
      student_id: current_user.id,
      subject_id: params[:subject_id].to_i,
      end_date: params[:end_date],
      fees: @fees,
      emp_name: 'self'
    )
    @cart_add=Cart.create(
      student_id: current_user.id,
      course_id: params[:subject_id].to_i,
      end_date: params[:end_date],
      fees: @fees,
      emp_name: 'self',
      subscription: true
    )
    ReceiptMailer.receipt_email(User.find_by(id: current_user.id)).deliver_now
    render js: "window.location = '#{root_path}'"
  end

end
