require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cleverpi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.enabled = false
    config.generators do |g|
  	  g.assets false
  	end
    config.generators do |g|
      #g.factory_girl false
      g.hidden_namespaces << "test_unit"
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl
    end
  end
end
