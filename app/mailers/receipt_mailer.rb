class ReceiptMailer < ApplicationMailer
  default from: "yash1998g@gmail.com"

  def receipt_email(user)

    @user = user
    mail(to: @user.email, subject: 'RECEIPT')

  end

end
