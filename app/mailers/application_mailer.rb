class ApplicationMailer < ActionMailer::Base
  append_view_path 'app/views/mailer'
  default from: 'from@example.com'
  layout 'mailer'
end
