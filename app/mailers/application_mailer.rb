class ApplicationMailer < ActionMailer::Base
  default from: ENV['GOOGLEMAP_API_KEY']
  layout 'mailer'
end
