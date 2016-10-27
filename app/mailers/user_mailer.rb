class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def report_email(email)
    mail(to: email, subject: 'Report')
  end
end
