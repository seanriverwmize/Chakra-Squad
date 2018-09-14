# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


#Allow ActionMailer to use the SendGrid plugin to send emails
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: ENV['seanriverwmize'],
  password: ENV['U7GH0LK:S'],
  domain: 'heroku.com',
  enable_starttls_auto: true
}
