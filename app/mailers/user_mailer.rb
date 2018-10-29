class UserMailer < ApplicationMailer
  default from: "seanriverwmize@gmail.com"
  def contact_form(email, name, message)
    @message = message
    mail(from: email, to: 'seanriverwmize@gmail.com', subject: "A new contact form message from #{name}")
  end
  def registration_email(email)
    mail(from: 'seanriverwmize@gmail.com', to: email, subject: "Confirmation Email", body: "This is a confirmation email. Your registration is complete!")
  end
end
