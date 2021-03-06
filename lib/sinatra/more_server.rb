require "sinatra/base"

module Sinatra
  # Adds more servers to Sinatra::Base#run! (currently unicorn and rainbows).
  module MoreServer
    autoload :Unicorn,  "sinatra/more_server/unicorn"
    autoload :Rainbows, "sinatra/more_server/rainbows"
    autoload :Zbatery,  "sinatra/more_server/zbatery"

    def self.registered(klass)
      ::Rack::Handler.register "unicorn",  "Sinatra::MoreServer::Unicorn"
      ::Rack::Handler.register "rainbows", "Sinatra::MoreServer::Rainbows"
      ::Rack::Handler.register "zbatery",  "Sinatra::MoreServer::Zbatery"
      ::Rack::Handler.register "ebb",      "Rack::Handler::Ebb"
      ::Rack::Handler.autoload :Ebb,       "ebb"
      klass.server += ["ebb", "zbatery", "rainbows", "unicorn"]
      klass.set :async_server, ["thin", "ebb", "zbatery", "rainbows"]
    end

    def has_async_callback!
      @has_async_callback = true
      set :server, async_server
    end

    def has_async_callback?
      !!@has_async_callback
    end

  end

  register MoreServer
end