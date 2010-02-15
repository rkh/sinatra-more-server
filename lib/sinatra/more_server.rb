require "sinatra/base"

module Sinatra
  # Adds more servers to Sinatra::Base#run! (currently unicorn and rainbows).
  module MoreServer
    autoload :Unicorn,  "big_band/more_server/unicorn"
    autoload :Rainbows, "big_band/more_server/rainbows"
    def self.registered(klass)
      ::Rack::Handler.register "unicorn",  "::Sinatra::MoreServer::Unicorn"
      ::Rack::Handler.register "rainbows", "::Sinatra::MoreServer::Rainbows"
      ::Rack::Handler.register "ebb",      "::Rack::Handler::Ebb"
      ::Rack::Handler.autoload :Ebb,       "ebb"
      klass.server += ["ebb", "rainbows", "unicorn"]
    end
  end
  
  register MoreServer
end