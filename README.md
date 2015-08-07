# Stopover

Generate static pages with the asset pipeline on Rails.

## Installation

Put this line in your Gemfile:

```
gem 'stopover'
```

Run the bundle command to install it.

After you install Stopover, you need to run the generator:

```
rails generate stopover:install
```

And add to your routes.rb if you want to check pages on your browser:

```
mount Stopover::Engine, at: '/stopover', as: :stopover if Rails.env.development?
```

Then visit http://localhost:3000/stopover.

## Usage

Stopover is called after `rake assets:precompile` automatically.
And for example,  `app/views/stopover/404.html.erb` is compiled to `public/404.html`.

You can also stop the hook with `disable_hook_assets_precompile = true` in [stopover.rb](https://github.com/rono23/stopover/blob/master/lib/generators/stopover/templates/stopover.rb#L5) and call `rake stopover:create` by yourself.

#### Heroku

Using Stopover on Heroku requires settings:

```
# config/environments/production.rb
config.action_controller.asset_host = 'https://xxx.herokuapp.com'

# config/initializers/stopover.rb
config.disable_hook_assets_precompile = false
```

## Notice

Before deploy, please run `rake assets:precompile` or  `rake stopover:create` and check compiled html in local when created/updated views in stopover.
Because there are some differences between a browser and rake.

For example, when you are using devise and a view calls `user_signed_in?`, it will return true/false on a browser, but raise an error on rake because of `request.env['warden']` is nil.
In this case, you can set `current_user` in [stopover.rb](https://github.com/rono23/stopover/blob/master/lib/generators/stopover/templates/stopover.rb#L27) and it is always handled as a guest on both.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
