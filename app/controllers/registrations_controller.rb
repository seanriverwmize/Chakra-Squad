class RegistrationsController < Devise::RegistrationsController
  def create
    super do
      UserMailer.registration_email(resource.email).deliver_now
    end
  end
end
