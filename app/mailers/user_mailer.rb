class UserMailer < ApplicationMailer
  default from: "seanriverwmize@gmail.com"
  def contact_form(email, name, message)
    @message = message
    mail(from: email, to: 'seanriverwmize@gmail.com', subject: "A new contact form message from #{name}")
  end
end
