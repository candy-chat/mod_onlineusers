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
    {200, [], pretty_string_int(mnesia:table_info(session, size))}.

%% Transform 1234567890 into "1,234,567,890"
%% copied from ejabberd's ejabberd_web_admin.erl. Thanks for sharing.
pretty_string_int(Integer) when is_integer(Integer) ->
    pretty_string_int(integer_to_list(Integer));
pretty_string_int(String) when is_list(String) ->
    {_, Result} = lists:foldl(
        fun(NewNumber, {3, Result}) ->
              {1, [NewNumber, $, | Result]};
          (NewNumber, {CountAcc, Result}) ->
              {CountAcc+1, [NewNumber | Result]}
        end,
        {0, ""},
        lists:reverse(String)),
    Result.

%%%----------------------------------------------------------------------
%%% BEHAVIOUR CALLBACKS
%%%----------------------------------------------------------------------

start(_Host, _Opts) ->
    ok.

stop(_Host) ->
    ok.
