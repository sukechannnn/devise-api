require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module FerretOauthApi
  class Application < Rails::Application
    config.time_zone = 'Tokyo'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja
    config.i18n.fallbacks = {'ja' => 'en'}

    Slim::Engine.set_default_options :pretty => true unless Rails.env == 'production'

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # schema = JSON.parse(File.read("#{Rails.root}/docs/schema/schema.json"))
    # config.middleware.use Rack::JsonSchema::ErrorHandler
    # config.middleware.use Rack::JsonSchema::ResponseValidation, schema: schema
  end
end
