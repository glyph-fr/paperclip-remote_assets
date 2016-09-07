require "paperclip/remote_assets/version"

module Paperclip
  module RemoteAssets
    extend ActiveSupport::Autoload

    autoload :Middleware

    mattr_writer :remote_root

    def self.remote_root
      @@remote_root ||= ENV['REMOTE_ASSETS_ROOT']
    end
  end
end

require 'paperclip/remote_assets/engine'
