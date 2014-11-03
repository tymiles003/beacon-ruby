require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require 'carrierwave'

module Beacon
  class Application < Rails::Application
    config.time_zone = 'Pacific Time (US & Canada)'

    config.assets.initialize_on_precompile = true
    config.i18n.enforce_available_locales = true
    config.action_controller.allow_forgery_protection = false

    config.to_prepare do
      DeviseController.respond_to :html, :json
    end
  end
end
