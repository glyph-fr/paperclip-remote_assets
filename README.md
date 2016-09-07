# Paperclip Remote Assets

Rack middleware for Rails development environment to make missing local
Paperclip assets fall back to remote assets on a given target URL.

When a request to your app is done in development mode starting with `/system/`,
the middleware checks if the file exists in your `public/system` folder and
redirects to the remote target if it doesn't.

> **Note** : This only works if your local assets storing path matches the
remote one. Your remote path should start with /system/ too.

## Installation

Add this line to your application's Gemfile, in the development group:

```ruby
group :development do
  gem 'paperclip-remote_assets'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-remote_assets

## Usage

Set your remote target root either with the `REMOTE_ASSETS_ROOT` environment
variable, or with the `Paperclip::RemoteAssets.remote_root` config.

```bash
ENV['REMOTE_ASSETS_ROOT'] = 'http://www.my-production-domain.com'
```

alternatively, in some initializer or environment file :

```ruby
Paperclip::RemoteAssets.remote_root = 'http://www.my-production-domain.com'
```

That's all.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/glyph-fr/paperclip-remote_assets.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

