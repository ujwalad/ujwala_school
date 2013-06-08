require File.join(File.dirname(__FILE__), 'boot')


RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

Rails::Initializer.run do |config|

  config.gem 'clickatell'
  config.time_zone = 'UTC'
  config.gem 'declarative_authorization', :source => 'http://gemcutter.org'

  config.load_once_paths += %W( #{RAILS_ROOT}/lib )
  config.load_paths += Dir["#{RAILS_ROOT}/app/models/*"].find_all { |f| File.stat(f).directory? }

  config.reload_plugins = true if RAILS_ENV =="development"
  config.plugins = [:paperclip,:all]
config.gem 'smsonrails', :source  => 'http://gemcutter.org'
config.gem 'clickatell' #If using Clickatell
end

SmsOnRails::ServiceProviders::Clickatell.config =
{
   :api_id => 'api-key',
   :user_name => 'username',
   :password => 'password'
}


SmsOnRails::ServiceProviders::EmailGateway.config =
{
   :sender => 'youremail address',
   :subject => 'Default Subject Text'
   #:bcc => nil,
   #:mailer_klass => nil
}


SmsOnRails::ServiceProviders::Base.set_default_service_provider :clickatell
