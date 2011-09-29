# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sit::Application.initialize!


Sit::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address => "smtp.inbox.ru" ,
    :port => 2525,
    :domain => "inbox.ru" ,
    :authentication => :login ,
    :user_name => "sit.sit" ,
    :password => "sitsecretsit" ,
    :enable_starttls_auto => true
  }
end