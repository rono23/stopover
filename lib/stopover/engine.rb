module Stopover
  class Engine < ::Rails::Engine
    isolate_namespace Stopover

    config.to_prepare do
      Stopover::ApplicationController.helper Rails.application.helpers
    end
  end
end
