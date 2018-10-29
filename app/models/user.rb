class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :comments

  after_create :send_registration_email
  def send_registration_email
    @email = params[:email]
    UserMailer.registration_email(@email).deliver_now
  end
end
