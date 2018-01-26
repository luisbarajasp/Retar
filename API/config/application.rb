require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module API
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Auto load files under app folder
    config.autoload_paths += %W(#{config.root}/app)
    # Don't generate system test files.
    config.generators.system_tests = nil

    #to skip assets, scaffolds.css, test framework, helpers, view
    config.generators do |g|
      g.template_engine false #to skip views
      g.test_framework  false #to skip test framework
      g.assets  false
      g.helper false
      g.stylesheets false
      g.skip_routes true
    end
  end
end
