require "sinatra/more_server/unicorn"
require "rainbows"

module Sinatra
  module MoreServer
    # Rack Handler to use Rainbows for Sinatra::Base.run!
    module Rainbows
      def self.run(app, options = {})
        Sinatra::MoreServer::Unicorn.run app, options.merge(:Backend => ::Rainbows)
      end
    end
  end
end
