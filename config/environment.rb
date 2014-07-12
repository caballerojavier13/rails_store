# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

 ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
      address:        "smtp.yahoo.ca",
      port:           587, 
      domain:         "yahoo_domain",
      authentication: "plain",
      user_name:      "confirmation109",
      password:       "Uottawa1",
      enable_starttls_auto: true
    } 