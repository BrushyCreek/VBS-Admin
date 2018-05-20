class RegistrationMailer < ApplicationMailer
  def welcome_email(family_id)
    @family = Family.find(family_id)
    mail(to: @family.head.email,
         subject: "Thank you for signing up for I'm With The Band")
  end
end
