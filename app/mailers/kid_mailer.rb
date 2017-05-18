class KidMailer < ApplicationMailer
  default from: 'vbs@brushycreekchurch.com'

  def register_email(kid)
    @kid = kid
    mail(to: @kid.email,
         subject: '#{@kid.full_name} is registered for Under Construction!',
         template_path: 'kid_mailer',
         template_name: 'preregister_email')
  end
end
