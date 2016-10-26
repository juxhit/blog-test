class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def report_email(user)
    @user = user
    mail(to: @user.email, subject: 'Report')
  end
end
