module Stopover
  class ApplicationController < ActionController::Base
    include Rails.application.routes.url_helpers
    include Stopover::CustomMethods

    def self.renderer
      new.tap do |controller|
        controller.request  = ActionDispatch::Request.new({})
        controller.response = ActionDispatch::Response.new
        controller.params = {}
      end
    end

    private

    def _prefixes
      @_prefixes ||= [Stopover.view_path, 'application']
    end
  end
end
