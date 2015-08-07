module Stopover
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      class_option :template_engine,
        type: :string,
        aliases: '-e',
        desc: 'Template engine for the views. Available options are "erb", "haml", and "slim".'

      def self.banner
        <<-BANNER.chomp
rails g stopover:install

    Copies a layout, template and initializer to your application.
BANNER
      end

      desc ''
      def copy_initializer
        template 'stopover.rb', 'config/initializers/stopover.rb'
      end

      def copy_layout
        layout = "layouts/#{Stopover.layout_name}.html.#{template_engine}"
        copy_file layout, "app/views/#{layout}"
      end

      def copy_view
        view = "404.html.#{template_engine}"
        copy_file "views/#{view}", "app/views/#{Stopover.view_path}/#{view}"
      end

      def show_readme
        readme 'README' if behavior == :invoke
      end

      private

      def template_engine
        options[:template_engine].try(:to_s).try(:downcase) || 'erb'
      end
    end
  end
end
