# Preview all emails at http://localhost:3000/rails/mailers/registration_mailer
class RegistrationMailerPreview < ActionMailer::Preview
  def welcome_email
    RegistrationMailer.welcome_email(Family.first.id)
  end
end
