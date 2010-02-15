require "sinatra/more_server/unicorn"
require "zbatery"

class Sinatra
  module MoreServer
    # Rack Handler to use Rainbows for Sinatra::Base.run!
    module Rainbows
      def self.run(app, options = {})
        Sinatra::MoreServer::Unicorn.run app, options.merge(:Backend => ::Zbatery)
      end
    end
  end
end
