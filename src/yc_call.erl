%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(yc_call).

-compile(export_all).

do_decode(<<"accept">>, <<"urn:xmpp:yc:avc:0">>, El,
	  Opts) ->
    decode_yc_call_accept(<<"urn:xmpp:yc:avc:0">>, Opts,
			  El);
do_decode(<<"end">>, <<"urn:xmpp:yc:avc:0">>, El,
	  Opts) ->
    decode_yc_call_end(<<"urn:xmpp:yc:avc:0">>, Opts, El);
do_decode(<<"propose">>, <<"urn:xmpp:yc:avc:0">>, El,
	  Opts) ->
    decode_yc_call_propose(<<"urn:xmpp:yc:avc:0">>, Opts,
			   El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"accept">>, <<"urn:xmpp:yc:avc:0">>},
     {<<"end">>, <<"urn:xmpp:yc:avc:0">>},
     {<<"propose">>, <<"urn:xmpp:yc:avc:0">>}].

do_encode({yc_call_propose, _, _} = Propose,
	  TopXMLNS) ->
    encode_yc_call_propose(Propose, TopXMLNS);
do_encode({yc_call_end, _} = End, TopXMLNS) ->
    encode_yc_call_end(End, TopXMLNS);
do_encode({yc_call_accept, _} = Accept, TopXMLNS) ->
    encode_yc_call_accept(Accept, TopXMLNS).

do_get_name({yc_call_accept, _}) -> <<"accept">>;
do_get_name({yc_call_end, _}) -> <<"end">>;
do_get_name({yc_call_propose, _, _}) -> <<"propose">>.

do_get_ns({yc_call_accept, _}) ->
    <<"urn:xmpp:yc:avc:0">>;
do_get_ns({yc_call_end, _}) -> <<"urn:xmpp:yc:avc:0">>;
do_get_ns({yc_call_propose, _, _}) ->
    <<"urn:xmpp:yc:avc:0">>.

pp(yc_call_propose, 2) -> [sid, type];
pp(yc_call_end, 1) -> [sid];
pp(yc_call_accept, 1) -> [sid];
pp(_, _) -> no.

records() ->
    [{yc_call_propose, 2}, {yc_call_end, 1},
     {yc_call_accept, 1}].

decode_yc_call_accept(__TopXMLNS, __Opts,
		      {xmlel, <<"accept">>, _attrs, _els}) ->
    Sid = decode_yc_call_accept_attrs(__TopXMLNS, _attrs,
				      undefined),
    {yc_call_accept, Sid}.

decode_yc_call_accept_attrs(__TopXMLNS,
			    [{<<"sid">>, _val} | _attrs], _Sid) ->
    decode_yc_call_accept_attrs(__TopXMLNS, _attrs, _val);
decode_yc_call_accept_attrs(__TopXMLNS, [_ | _attrs],
			    Sid) ->
    decode_yc_call_accept_attrs(__TopXMLNS, _attrs, Sid);
decode_yc_call_accept_attrs(__TopXMLNS, [], Sid) ->
    decode_yc_call_accept_attr_sid(__TopXMLNS, Sid).

encode_yc_call_accept({yc_call_accept, Sid},
		      __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:yc:avc:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_yc_call_accept_attr_sid(Sid,
					    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								       __TopXMLNS)),
    {xmlel, <<"accept">>, _attrs, _els}.

decode_yc_call_accept_attr_sid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"sid">>, <<"accept">>, __TopXMLNS}});
decode_yc_call_accept_attr_sid(__TopXMLNS, _val) ->
    _val.

encode_yc_call_accept_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

decode_yc_call_end(__TopXMLNS, __Opts,
		   {xmlel, <<"end">>, _attrs, _els}) ->
    Sid = decode_yc_call_end_attrs(__TopXMLNS, _attrs,
				   undefined),
    {yc_call_end, Sid}.

decode_yc_call_end_attrs(__TopXMLNS,
			 [{<<"sid">>, _val} | _attrs], _Sid) ->
    decode_yc_call_end_attrs(__TopXMLNS, _attrs, _val);
decode_yc_call_end_attrs(__TopXMLNS, [_ | _attrs],
			 Sid) ->
    decode_yc_call_end_attrs(__TopXMLNS, _attrs, Sid);
decode_yc_call_end_attrs(__TopXMLNS, [], Sid) ->
    decode_yc_call_end_attr_sid(__TopXMLNS, Sid).

encode_yc_call_end({yc_call_end, Sid}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:yc:avc:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_yc_call_end_attr_sid(Sid,
					 xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
								    __TopXMLNS)),
    {xmlel, <<"end">>, _attrs, _els}.

decode_yc_call_end_attr_sid(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"sid">>, <<"end">>, __TopXMLNS}});
decode_yc_call_end_attr_sid(__TopXMLNS, _val) -> _val.

encode_yc_call_end_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

decode_yc_call_propose(__TopXMLNS, __Opts,
		       {xmlel, <<"propose">>, _attrs, _els}) ->
    {Sid, Type} = decode_yc_call_propose_attrs(__TopXMLNS,
					       _attrs, undefined, undefined),
    {yc_call_propose, Sid, Type}.

decode_yc_call_propose_attrs(__TopXMLNS,
			     [{<<"sid">>, _val} | _attrs], _Sid, Type) ->
    decode_yc_call_propose_attrs(__TopXMLNS, _attrs, _val,
				 Type);
decode_yc_call_propose_attrs(__TopXMLNS,
			     [{<<"type">>, _val} | _attrs], Sid, _Type) ->
    decode_yc_call_propose_attrs(__TopXMLNS, _attrs, Sid,
				 _val);
decode_yc_call_propose_attrs(__TopXMLNS, [_ | _attrs],
			     Sid, Type) ->
    decode_yc_call_propose_attrs(__TopXMLNS, _attrs, Sid,
				 Type);
decode_yc_call_propose_attrs(__TopXMLNS, [], Sid,
			     Type) ->
    {decode_yc_call_propose_attr_sid(__TopXMLNS, Sid),
     decode_yc_call_propose_attr_type(__TopXMLNS, Type)}.

encode_yc_call_propose({yc_call_propose, Sid, Type},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:xmpp:yc:avc:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_yc_call_propose_attr_type(Type,
					      encode_yc_call_propose_attr_sid(Sid,
									      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													 __TopXMLNS))),
    {xmlel, <<"propose">>, _attrs, _els}.

decode_yc_call_propose_attr_sid(__TopXMLNS,
				undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"sid">>, <<"propose">>, __TopXMLNS}});
decode_yc_call_propose_attr_sid(__TopXMLNS, _val) ->
    _val.

encode_yc_call_propose_attr_sid(_val, _acc) ->
    [{<<"sid">>, _val} | _acc].

decode_yc_call_propose_attr_type(__TopXMLNS,
				 undefined) ->
    <<"audio">>;
decode_yc_call_propose_attr_type(__TopXMLNS, _val) ->
    _val.

encode_yc_call_propose_attr_type(<<"audio">>, _acc) ->
    _acc;
encode_yc_call_propose_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].
