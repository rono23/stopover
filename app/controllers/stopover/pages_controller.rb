require_dependency "stopover/application_controller"

module Stopover
  class PagesController < ApplicationController
    def index
      render text: "Create views in app/views/#{Stopover.view_path} and then you can access #{request.fullpath}FILENAME without an extension."
    end

    def show
      render "#{Stopover.view_path}/#{params[:id]}", layout: Stopover.layout_name
    end
  end
end
