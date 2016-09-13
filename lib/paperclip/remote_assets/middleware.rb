module Paperclip
  module RemoteAssets
    class Middleware
      SYSTEM_PREFIX_REGEX = /\A\/system\//

      attr_reader :app

      def initialize(app)
        @app = app
      end

      def call(env)
        if remote_asset?(env['REQUEST_PATH'])
          [302, { 'Location': remote_asset_path_for(env['REQUEST_PATH']) }, []]
        else
          app.call(env)
        end
      end

      private

      def remote_asset?(path)
        path.match(SYSTEM_PREFIX_REGEX) && !File.exist?(Rails.root.join('public', path))
      end

      def remote_asset_path_for(path)
        unless Paperclip::RemoteAssets.remote_root_includes_system?
          path = path.gsub(SYSTEM_PREFIX_REGEX, '/')
        end

        File.join(Paperclip::RemoteAssets.remote_root, path)
      end
    end
  end
end
