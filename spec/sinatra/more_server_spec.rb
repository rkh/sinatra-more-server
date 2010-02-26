require File.expand_path(__FILE__ + "/../../spec_helper.rb")

describe Sinatra::MoreServer do
  before { app :MoreServer }

  describe "additional server" do
    it("should offer unicorn")   { app.server.should include("unicorn")  }
    it("should offer rainbows")  { app.server.should include("rainbows") }
    it("should offer zbatery")   { app.server.should include("zbatery")  }
    it("should offer ebb")       { app.server.should include("ebb")      }
  end

  describe "async_server" do
    it("should not offer mongrel as an async server") { app.async_server.should_not include("mongrel") }
    it("should not offer webrick as an async server") { app.async_server.should_not include("webrick") }
    it("should not offer unicorn as an async server") { app.async_server.should_not include("unicorn") }

    it("should offer thin as an async server")     { app.async_server.should include("thin")     }
    it("should offer ebb as an async server")      { app.async_server.should include("ebb")      }
    it("should offer rainbows as an async server") { app.async_server.should include("rainbows") }
    it("should offer zbatery as an async server")  { app.async_server.should include("zbatery")  }

    it "uses async_server instead of server when async support is requested" do
      app.has_async_callback!
      app.server.should == app.async_server
    end
  end

end
