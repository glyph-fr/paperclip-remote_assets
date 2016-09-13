require "paperclip/remote_assets/version"

module Paperclip
  module RemoteAssets
    extend ActiveSupport::Autoload

    autoload :Middleware

    mattr_writer :remote_root
    mattr_writer :remote_root_includes_system

    def self.remote_root
      @@remote_root ||= ENV['REMOTE_ASSETS_ROOT']
    end

    def self.remote_root_includes_system?
      @@remote_root_includes_system ||= if ENV.key?('REMOTE_ASSETS_ROOT_INCLUDES_SYSTEM')
        ENV['REMOTE_ASSETS_ROOT_INCLUDES_SYSTEM'] == 'true'
      else
        true
      end
    end
  end
end

require 'paperclip/remote_assets/engine'
