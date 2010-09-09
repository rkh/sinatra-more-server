Sinatra::MoreServer
===================

Adds support for more web servers to [Sinatra](http://sinatrarb.com)::Base#run!

Also, adds a helper method to ensure the server used from #run! supports async.callback, so all the
fancy comet implementations work.

BigBand
-------

Sinatra::MoreServer is part of the [BigBand](http://github.com/rkh/big_band) stack.
Check it out if you are looking for other fancy Sinatra extensions.


Installation
------------

    gem install sinatra-more-server

Additional Servers
------------------

Out of the box, Sinatra supports:

* [Webrick](http://www.ruby-doc.org/stdlib/libdoc/webrick/rdoc/)
* [Thin](http://code.macournoyer.com/thin/)
* [Mongrel](http://mongrel.rubyforge.org/)

Currently, this extensions adds support for:

* [Unicorn](http://unicorn.bogomips.org/)
* [Rainbows!](http://rainbows.bogomips.org/)
* [Zbatery](http://zbatery.bogomip.org/)
* [Ebb](http://ebb.rubyforge.org/)

Usage
-----

Classic style:

    require "sinatra"
    require "sinatra/more_server"

Or in your own subclass:

    require "sinatra/base"
    require "sinatra/more_server"
    
    class Foo < Sinatra::Base
      register Sinatra::MoreServer
    end

Async only, please!
-------------------

You use `async.callback`? Maybe via a library like [async\_sinatra](http://github.com/raggi/async_sinatra)
or [pusher](http://github.com/macournoyer/pusher)? Then you might want to make sure we only use a server
that supports it:

    require "sinatra"
    require "sinatra/more_server"
    
    configure do
      has_async_callback!
    end

As mentioned above, this will only have effect on running your script directly. However, in any other case,
you will choose your server manually, anyway. (Hint: As far as I know, only thin- and rainbows!-based implementations
support async.callback at the moment.)

Thanks
------

* Graham Hughes for fixing it to work with Rack >= 1.2
