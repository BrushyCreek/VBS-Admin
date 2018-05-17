class ApplicationMailer < ActionMailer::Base
  default from: 'Registration <registration@#{ENV['MAILGUN_DOMAIN']}>'
  layout 'mailer'
end
