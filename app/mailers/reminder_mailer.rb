class ReminderMailer < ApplicationMailer
  default from: "yash1998g@gmail.com"

  def reminder_email(user)

    @user = user
    mail(to: @user.email, subject: 'REMINDER')

  end
end
