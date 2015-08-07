require 'test_helper'

module Stopover
  class ApplicationControllerTest < ActiveSupport::TestCase
    setup do
      Stopover.setup do |config|
        config.custom_methods do
          def default_url_options
            { host: 'testtest.host', port: 3001 }
          end

          def current_user
            nil
          end
        end
      end
    end

    test 'instance methods from module_eval' do
      @controller = Stopover::ApplicationController.new
      assert_equal({ host: 'testtest.host', port: 3001 }, @controller.default_url_options)
      assert_equal nil, @controller.current_user
    end

    test '.renderer' do
      @renderer = Stopover::ApplicationController.renderer
      assert_equal "<!DOCTYPE html>\n<html>\n  <head>\n    <title>404</title>\n    <link rel=\"stylesheet\" media=\"all\" href=\"/assets/application.css\" />\n    <script src=\"/assets/application.js\"></script>\n  </head>\n  <body>\n    <h1><a href=\"http://testtest.host:3001/stopover/\">404 - Test</a></h1>\n\n  </body>\n</html>\n", @renderer.render_to_string('stopover/404', layout: 'stopover')
    end
  end
end
