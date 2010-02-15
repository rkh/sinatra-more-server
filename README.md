Sinatra::MoreServer
=======================

Adds support for more web servers to [Sinatra](http://sinatrarb.com)::Base#run!.
(Read: The server used when running `ruby yourfile.rb`. This has no effect rackup and akin.)

BigBand
-------

Sinatra::MoreServer is part of the [BigBand](http://github.com/rkh/big_band) stack.
Check it out if you are looking for other fancy Sinatra extensions.

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
