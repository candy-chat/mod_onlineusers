%%%----------------------------------------------------------------------
%%% File    : mod_onlineusers.erl
%%% Author  : Michael Weibel <michael.weibel@amiadogroup.com>
%%% Purpose : Display number of online users
%%% Created : 2011-08-16
%%%----------------------------------------------------------------------

-module(mod_onlineusers).
-author('michael.weibel@amiadogroup.com').
-vsn('').
%%-define(ejabberd_debug, true).

-behaviour(gen_mod).

-export([
    start/2,
    stop/1,
    process/2
    ]).

-include("ejabberd.hrl").
-include("jlib.hrl").
-include("web/ejabberd_http.hrl").

%%%----------------------------------------------------------------------
%%% REQUEST HANDLERS
%%%----------------------------------------------------------------------

process(LocalPath, _Request) ->
    {200, [], integer_to_list(mnesia:table_info(session, size))}.

%%%----------------------------------------------------------------------
%%% BEHAVIOUR CALLBACKS
%%%----------------------------------------------------------------------

start(_Host, _Opts) ->
    ok.

stop(_Host) ->
    ok.
