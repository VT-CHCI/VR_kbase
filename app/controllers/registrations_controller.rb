#registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  def create
    super
    
    # sends welcome email to user
    AdminMailer.welcome_email(@user).deliver unless @user.invalid?

    # notifies each one of our admins
    User.where(:admin => 'true').each { |admin|
      AdminMailer.new_user_email(@user, admin.email).deliver
    }
  end

end