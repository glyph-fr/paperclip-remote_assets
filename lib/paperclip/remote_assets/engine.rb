module Paperclip
  module RemoteAssets
    class Engine < ::Rails::Engine
      initializer 'paperclip.remote_assets.insert_middleware' do |app|
        if Rails.env.development? && Paperclip::RemoteAssets.remote_root
          app.config.middleware.use Paperclip::RemoteAssets::Middleware
        end
      end
    end
  end
end
