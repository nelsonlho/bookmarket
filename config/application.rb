require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bookmarket
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    ActionMailer::Base.smtp_settings = {

        :address        => 'smtp.gmail.com',
        :domain         => 'mail.google.com',
        :port           => 587,
        :user_name      => ENV['GMAIL_EMAIL'],
        :password       => ENV['GMAIL_PASSWORD'],
        :authentication => :login,
        :enable_starttls_auto => true

    }
    config.active_record.raise_in_transactional_callbacks = true
    config.paperclip_defaults = {
        storage: :s3,
        s3_host_name: "s3-us-west-2.amazonaws.com",
        :s3_region => ENV['AWS_REGION'],
        s3_credentials:{
            bucket: ENV['AWS_BUCKET'],
            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
        }
    }
  end
end
