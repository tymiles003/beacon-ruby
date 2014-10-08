# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'simplecov'

require 'factory_girl_rails'

include ActionDispatch::TestProcess

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each{|f| require f}

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  
  config.infer_base_class_for_anonymous_controllers = false
  config.use_transactional_fixtures = false
  config.order = :random

  config.before(:each) do
    Warden.test_mode!
  end

  RSpec.configure do |config|
    
    config.after(:each) do
      if Rails.env.test? || Rails.env.cucumber?
        FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
      end 
    end

    config.after(:all) do 
      [User].each do |m|
        m.all.each(&:destroy)
        FileUtils.rm_rf(Dir["#{Rails.root}/#{m.to_s.underscore.tableize}"])
        FileUtils.rm_rf(Dir["#{Rails.root}/public/#{m.to_s.underscore.tableize}"])
      end
      Warden.test_reset!
    end
  end
  
end