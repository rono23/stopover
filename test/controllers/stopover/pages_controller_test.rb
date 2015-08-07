require 'test_helper'

module Stopover
  class PagesControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes

      Stopover.setup do |config|
        config.custom_methods do
          def default_url_options
            { host: 'test.host' }
          end
        end
      end
    end

    test 'GET index' do
      get :index
      assert_response :success
      assert_equal 'Create views in app/views/stopover and then you can access /stopover/FILENAME without an extension.', @response.body
    end

    test 'GET show' do
      get :show, id: 404
      assert_response :success
      assert_equal "<!DOCTYPE html>\n<html>\n  <head>\n    <title>404</title>\n    <link rel=\"stylesheet\" media=\"all\" href=\"/assets/application.css\" />\n    <script src=\"/assets/application.js\"></script>\n  </head>\n  <body>\n    <h1><a href=\"http://test.host/stopover/\">404 - Test</a></h1>\n\n  </body>\n</html>\n", @response.body
    end
  end
end
