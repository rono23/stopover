Stopover.setup do |config|
  # Stopover is called after `rake assets:precompile` automatically.
  # Set `true` and use `rake stopover:create` if you don't want.
  # Default is <%= Stopover.disable_hook_assets_precompile.to_s %>.
  # config.disable_hook_assets_precompile = <%= Stopover.disable_hook_assets_precompile.to_s %>

  # The name of layout for all static pages. Set `false` if you don't need a layout.
  # Default is '<%= Stopover.layout_name %>'.
  # config.layout_name = '<%= Stopover.layout_name %>'

  # The directry name of views. For exmaple, if this value is set to '<%= Stopover.view_path %>', Stopover finds views from 'app/views/<%= Stopover.view_path %>'.
  # Default is '<%= Stopover.view_path %>'.
  # config.view_path = '<%= Stopover.view_path %>'

  # When you set custom methods, it will be included to `Stopover::ApplicationController`.
  config.custom_methods do
    # Set host etc to generate path/url in views.
    def default_url_options
      Rails.application.config.action_mailer[:default_url_options] || { host: 'localhost', port: 3000 }
    end

    # Override current_user is useful when you are using devise etc.
    # For example, when a view calls `user_signed_in?`, it will return true/false on a browser,
    # but raise an error on rake because of `request.env['warden']` is nil.
    # In order to avoid this, you can set `current_user` is nil and it is always handled as a guest on both.
    # def current_user
    #   nil
    # end
  end
end
