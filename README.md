mod_onlineusers
===============

Displays the number of online users via the http interface of ejabberd. 

* To compile, clone it to the ejabberd-modules folder you checked out from [svn](http://www.ejabberd.im/ejabberd-modules) and call `./build.sh` (ignore the warning regarding LocalPath).
* After that, copy ebin/mod_onlineusers.ebin to your ebin folder of ejabberd.
* Then, edit ejabberd.cfg and add the following to your modules config: `  {mod_onlineusers, []}`.
* Also in ejabberd.cfg, add to your http-listen configuration the following: {request_handlers, [{["onlineusers"], mod_onlineusers}]}
  

**Be aware:** I just did it because I didn't find a better way to do it via a standard module from ejabberd. There may be bugs and there may be a better way to achieve it.
