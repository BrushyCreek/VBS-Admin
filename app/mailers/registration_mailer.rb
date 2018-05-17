class RegistrationMailer < ApplicationMailer
  def welcome_email
    @family = params[:family]
    mail(from: 'Registration',
         to: @family.head.email,
         subject: "Thank you for signing up for I'm With The Band")
  end
end
