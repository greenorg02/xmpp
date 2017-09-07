%% Created automatically by XML generator (fxml_gen.erl)
%% Source: xmpp_codec.spec

-module(yc_message_data).

-compile(export_all).

do_decode(<<"yc">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_message_data(<<"urn:yc:message:data">>, Opts,
			   El);
do_decode(<<"sticker">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_sticker(<<"urn:yc:message:data">>, Opts, El);
do_decode(<<"contact">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_contact(<<"urn:yc:message:data">>, Opts, El);
do_decode(<<"info">>, <<"urn:yc:msg:s:0">>, El, Opts) ->
    decode_yc_sticker_info(<<"urn:yc:msg:s:0">>, Opts, El);
do_decode(<<"info">>, <<"urn:yc:msg:c:0">>, El, Opts) ->
    decode_yc_contact_info(<<"urn:yc:msg:c:0">>, Opts, El);
do_decode(<<"media">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_media(<<"urn:yc:message:data">>, Opts, El);
do_decode(<<"info">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_info(<<"urn:yc:message:data">>, Opts, El);
do_decode(<<"item">>, <<"urn:yc:message:data">>, El,
	  Opts) ->
    decode_yc_media_item(<<"urn:yc:message:data">>, Opts,
			 El);
do_decode(<<"thumbnail">>, <<"urn:yc:message:data">>,
	  El, Opts) ->
    decode_yc_media_item_thumbnail(<<"urn:yc:message:data">>,
				   Opts, El);
do_decode(Name, <<>>, _, _) ->
    erlang:error({xmpp_codec, {missing_tag_xmlns, Name}});
do_decode(Name, XMLNS, _, _) ->
    erlang:error({xmpp_codec, {unknown_tag, Name, XMLNS}}).

tags() ->
    [{<<"yc">>, <<"urn:yc:message:data">>},
     {<<"sticker">>, <<"urn:yc:message:data">>},
     {<<"contact">>, <<"urn:yc:message:data">>},
     {<<"info">>, <<"urn:yc:msg:s:0">>},
     {<<"info">>, <<"urn:yc:msg:c:0">>},
     {<<"media">>, <<"urn:yc:message:data">>},
     {<<"info">>, <<"urn:yc:message:data">>},
     {<<"item">>, <<"urn:yc:message:data">>},
     {<<"thumbnail">>, <<"urn:yc:message:data">>}].

do_encode({yc_thumbnail, _} = Thumbnail, TopXMLNS) ->
    encode_yc_media_item_thumbnail(Thumbnail, TopXMLNS);
do_encode({yc_media_item, _, _, _, _, _, _} = Item,
	  TopXMLNS) ->
    encode_yc_media_item(Item, TopXMLNS);
do_encode({yc_info, _, _} = Info, TopXMLNS) ->
    encode_yc_info(Info, TopXMLNS);
do_encode({yc_media_items, _} = Media, TopXMLNS) ->
    encode_yc_media(Media, TopXMLNS);
do_encode({yc_contact_info, _, _} = Info, TopXMLNS) ->
    encode_yc_contact_info(Info, TopXMLNS);
do_encode({yc_sticker_info, _} = Info, TopXMLNS) ->
    encode_yc_sticker_info(Info, TopXMLNS);
do_encode({yc_contact, _} = Contact, TopXMLNS) ->
    encode_yc_contact(Contact, TopXMLNS);
do_encode({yc_sticker, _} = Sticker, TopXMLNS) ->
    encode_yc_sticker(Sticker, TopXMLNS);
do_encode({yc_message_data, _, _, _, _} = Yc,
	  TopXMLNS) ->
    encode_yc_message_data(Yc, TopXMLNS).

do_get_name({yc_contact, _}) -> <<"contact">>;
do_get_name({yc_contact_info, _, _}) -> <<"info">>;
do_get_name({yc_info, _, _}) -> <<"info">>;
do_get_name({yc_media_item, _, _, _, _, _, _}) ->
    <<"item">>;
do_get_name({yc_media_items, _}) -> <<"media">>;
do_get_name({yc_message_data, _, _, _, _}) -> <<"yc">>;
do_get_name({yc_sticker, _}) -> <<"sticker">>;
do_get_name({yc_sticker_info, _}) -> <<"info">>;
do_get_name({yc_thumbnail, _}) -> <<"thumbnail">>.

do_get_ns({yc_contact, _}) -> <<"urn:yc:message:data">>;
do_get_ns({yc_contact_info, _, _}) ->
    <<"urn:yc:msg:c:0">>;
do_get_ns({yc_info, _, _}) -> <<"urn:yc:message:data">>;
do_get_ns({yc_media_item, _, _, _, _, _, _}) ->
    <<"urn:yc:message:data">>;
do_get_ns({yc_media_items, _}) ->
    <<"urn:yc:message:data">>;
do_get_ns({yc_message_data, _, _, _, _}) ->
    <<"urn:yc:message:data">>;
do_get_ns({yc_sticker, _}) -> <<"urn:yc:message:data">>;
do_get_ns({yc_sticker_info, _}) -> <<"urn:yc:msg:s:0">>;
do_get_ns({yc_thumbnail, _}) ->
    <<"urn:yc:message:data">>.

pp(yc_thumbnail, 1) -> [data];
pp(yc_media_item, 6) ->
    [type, uid, url, thumbnail, lat, lng];
pp(yc_info, 2) -> [sent, uid];
pp(yc_media_items, 1) -> [items];
pp(yc_contact_info, 2) -> [member_id, name];
pp(yc_sticker_info, 1) -> [sticker_id];
pp(yc_contact, 1) -> [info];
pp(yc_sticker, 1) -> [info];
pp(yc_message_data, 4) ->
    [info, media, contact, sticker];
pp(_, _) -> no.

records() ->
    [{yc_thumbnail, 1}, {yc_media_item, 6}, {yc_info, 2},
     {yc_media_items, 1}, {yc_contact_info, 2},
     {yc_sticker_info, 1}, {yc_contact, 1}, {yc_sticker, 1},
     {yc_message_data, 4}].

decode_yc_message_data(__TopXMLNS, __Opts,
		       {xmlel, <<"yc">>, _attrs, _els}) ->
    {Media, Sticker, Contact, Info} =
	decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				   false, false, false, false),
    {yc_message_data, Info, Media, Contact, Sticker}.

decode_yc_message_data_els(__TopXMLNS, __Opts, [],
			   Media, Sticker, Contact, Info) ->
    {Media, Sticker, Contact, Info};
decode_yc_message_data_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"info">>, _attrs, _} = _el | _els], Media,
			   Sticker, Contact, Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media, Sticker, Contact,
				     decode_yc_info(<<"urn:yc:message:data">>,
						    __Opts, _el));
      _ ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media, Sticker, Contact, Info)
    end;
decode_yc_message_data_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"media">>, _attrs, _} = _el | _els],
			   Media, Sticker, Contact, Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     decode_yc_media(<<"urn:yc:message:data">>,
						     __Opts, _el),
				     Sticker, Contact, Info);
      _ ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media, Sticker, Contact, Info)
    end;
decode_yc_message_data_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"contact">>, _attrs, _} = _el | _els],
			   Media, Sticker, Contact, Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media, Sticker,
				     decode_yc_contact(<<"urn:yc:message:data">>,
						       __Opts, _el),
				     Info);
      _ ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media, Sticker, Contact, Info)
    end;
decode_yc_message_data_els(__TopXMLNS, __Opts,
			   [{xmlel, <<"sticker">>, _attrs, _} = _el | _els],
			   Media, Sticker, Contact, Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media,
				     decode_yc_sticker(<<"urn:yc:message:data">>,
						       __Opts, _el),
				     Contact, Info);
      _ ->
	  decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
				     Media, Sticker, Contact, Info)
    end;
decode_yc_message_data_els(__TopXMLNS, __Opts,
			   [_ | _els], Media, Sticker, Contact, Info) ->
    decode_yc_message_data_els(__TopXMLNS, __Opts, _els,
			       Media, Sticker, Contact, Info).

encode_yc_message_data({yc_message_data, Info, Media,
			Contact, Sticker},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_yc_message_data_$media'(Media,
						      __NewTopXMLNS,
						      'encode_yc_message_data_$sticker'(Sticker,
											__NewTopXMLNS,
											'encode_yc_message_data_$contact'(Contact,
															  __NewTopXMLNS,
															  'encode_yc_message_data_$info'(Info,
																			 __NewTopXMLNS,
																			 []))))),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"yc">>, _attrs, _els}.

'encode_yc_message_data_$media'(false, __TopXMLNS,
				_acc) ->
    _acc;
'encode_yc_message_data_$media'(Media, __TopXMLNS,
				_acc) ->
    [encode_yc_media(Media, __TopXMLNS) | _acc].

'encode_yc_message_data_$sticker'(false, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_yc_message_data_$sticker'(Sticker, __TopXMLNS,
				  _acc) ->
    [encode_yc_sticker(Sticker, __TopXMLNS) | _acc].

'encode_yc_message_data_$contact'(false, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_yc_message_data_$contact'(Contact, __TopXMLNS,
				  _acc) ->
    [encode_yc_contact(Contact, __TopXMLNS) | _acc].

'encode_yc_message_data_$info'(false, __TopXMLNS,
			       _acc) ->
    _acc;
'encode_yc_message_data_$info'(Info, __TopXMLNS,
			       _acc) ->
    [encode_yc_info(Info, __TopXMLNS) | _acc].

decode_yc_sticker(__TopXMLNS, __Opts,
		  {xmlel, <<"sticker">>, _attrs, _els}) ->
    Info = decode_yc_sticker_els(__TopXMLNS, __Opts, _els,
				 false),
    {yc_sticker, Info}.

decode_yc_sticker_els(__TopXMLNS, __Opts, [], Info) ->
    Info;
decode_yc_sticker_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"info">>, _attrs, _} = _el | _els], Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:msg:s:0">> ->
	  decode_yc_sticker_els(__TopXMLNS, __Opts, _els,
				decode_yc_sticker_info(<<"urn:yc:msg:s:0">>,
						       __Opts, _el));
      _ ->
	  decode_yc_sticker_els(__TopXMLNS, __Opts, _els, Info)
    end;
decode_yc_sticker_els(__TopXMLNS, __Opts, [_ | _els],
		      Info) ->
    decode_yc_sticker_els(__TopXMLNS, __Opts, _els, Info).

encode_yc_sticker({yc_sticker, Info}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_yc_sticker_$info'(Info,
						   __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"sticker">>, _attrs, _els}.

'encode_yc_sticker_$info'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_yc_sticker_$info'(Info, __TopXMLNS, _acc) ->
    [encode_yc_sticker_info(Info, __TopXMLNS) | _acc].

decode_yc_contact(__TopXMLNS, __Opts,
		  {xmlel, <<"contact">>, _attrs, _els}) ->
    Info = decode_yc_contact_els(__TopXMLNS, __Opts, _els,
				 false),
    {yc_contact, Info}.

decode_yc_contact_els(__TopXMLNS, __Opts, [], Info) ->
    Info;
decode_yc_contact_els(__TopXMLNS, __Opts,
		      [{xmlel, <<"info">>, _attrs, _} = _el | _els], Info) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:msg:c:0">> ->
	  decode_yc_contact_els(__TopXMLNS, __Opts, _els,
				decode_yc_contact_info(<<"urn:yc:msg:c:0">>,
						       __Opts, _el));
      _ ->
	  decode_yc_contact_els(__TopXMLNS, __Opts, _els, Info)
    end;
decode_yc_contact_els(__TopXMLNS, __Opts, [_ | _els],
		      Info) ->
    decode_yc_contact_els(__TopXMLNS, __Opts, _els, Info).

encode_yc_contact({yc_contact, Info}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_yc_contact_$info'(Info,
						   __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"contact">>, _attrs, _els}.

'encode_yc_contact_$info'(false, __TopXMLNS, _acc) ->
    _acc;
'encode_yc_contact_$info'(Info, __TopXMLNS, _acc) ->
    [encode_yc_contact_info(Info, __TopXMLNS) | _acc].

decode_yc_sticker_info(__TopXMLNS, __Opts,
		       {xmlel, <<"info">>, _attrs, _els}) ->
    Sticker_id = decode_yc_sticker_info_attrs(__TopXMLNS,
					      _attrs, undefined),
    {yc_sticker_info, Sticker_id}.

decode_yc_sticker_info_attrs(__TopXMLNS,
			     [{<<"stickerId">>, _val} | _attrs], _Sticker_id) ->
    decode_yc_sticker_info_attrs(__TopXMLNS, _attrs, _val);
decode_yc_sticker_info_attrs(__TopXMLNS, [_ | _attrs],
			     Sticker_id) ->
    decode_yc_sticker_info_attrs(__TopXMLNS, _attrs,
				 Sticker_id);
decode_yc_sticker_info_attrs(__TopXMLNS, [],
			     Sticker_id) ->
    decode_yc_sticker_info_attr_stickerId(__TopXMLNS,
					  Sticker_id).

encode_yc_sticker_info({yc_sticker_info, Sticker_id},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:msg:s:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs =
	encode_yc_sticker_info_attr_stickerId(Sticker_id,
					      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
									 __TopXMLNS)),
    {xmlel, <<"info">>, _attrs, _els}.

decode_yc_sticker_info_attr_stickerId(__TopXMLNS,
				      undefined) ->
    <<>>;
decode_yc_sticker_info_attr_stickerId(__TopXMLNS,
				      _val) ->
    _val.

encode_yc_sticker_info_attr_stickerId(<<>>, _acc) ->
    _acc;
encode_yc_sticker_info_attr_stickerId(_val, _acc) ->
    [{<<"stickerId">>, _val} | _acc].

decode_yc_contact_info(__TopXMLNS, __Opts,
		       {xmlel, <<"info">>, _attrs, _els}) ->
    {Member_id, Name} =
	decode_yc_contact_info_attrs(__TopXMLNS, _attrs,
				     undefined, undefined),
    {yc_contact_info, Member_id, Name}.

decode_yc_contact_info_attrs(__TopXMLNS,
			     [{<<"memberId">>, _val} | _attrs], _Member_id,
			     Name) ->
    decode_yc_contact_info_attrs(__TopXMLNS, _attrs, _val,
				 Name);
decode_yc_contact_info_attrs(__TopXMLNS,
			     [{<<"name">>, _val} | _attrs], Member_id, _Name) ->
    decode_yc_contact_info_attrs(__TopXMLNS, _attrs,
				 Member_id, _val);
decode_yc_contact_info_attrs(__TopXMLNS, [_ | _attrs],
			     Member_id, Name) ->
    decode_yc_contact_info_attrs(__TopXMLNS, _attrs,
				 Member_id, Name);
decode_yc_contact_info_attrs(__TopXMLNS, [], Member_id,
			     Name) ->
    {decode_yc_contact_info_attr_memberId(__TopXMLNS,
					  Member_id),
     decode_yc_contact_info_attr_name(__TopXMLNS, Name)}.

encode_yc_contact_info({yc_contact_info, Member_id,
			Name},
		       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:msg:c:0">>, [],
				    __TopXMLNS),
    _els = [],
    _attrs = encode_yc_contact_info_attr_name(Name,
					      encode_yc_contact_info_attr_memberId(Member_id,
										   xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
													      __TopXMLNS))),
    {xmlel, <<"info">>, _attrs, _els}.

decode_yc_contact_info_attr_memberId(__TopXMLNS,
				     undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"memberId">>, <<"info">>,
		   __TopXMLNS}});
decode_yc_contact_info_attr_memberId(__TopXMLNS,
				     _val) ->
    _val.

encode_yc_contact_info_attr_memberId(_val, _acc) ->
    [{<<"memberId">>, _val} | _acc].

decode_yc_contact_info_attr_name(__TopXMLNS,
				 undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"name">>, <<"info">>, __TopXMLNS}});
decode_yc_contact_info_attr_name(__TopXMLNS, _val) ->
    _val.

encode_yc_contact_info_attr_name(_val, _acc) ->
    [{<<"name">>, _val} | _acc].

decode_yc_media(__TopXMLNS, __Opts,
		{xmlel, <<"media">>, _attrs, _els}) ->
    Items = decode_yc_media_els(__TopXMLNS, __Opts, _els,
				[]),
    {yc_media_items, Items}.

decode_yc_media_els(__TopXMLNS, __Opts, [], Items) ->
    lists:reverse(Items);
decode_yc_media_els(__TopXMLNS, __Opts,
		    [{xmlel, <<"item">>, _attrs, _} = _el | _els], Items) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_media_els(__TopXMLNS, __Opts, _els,
			      [decode_yc_media_item(<<"urn:yc:message:data">>,
						    __Opts, _el)
			       | Items]);
      _ ->
	  decode_yc_media_els(__TopXMLNS, __Opts, _els, Items)
    end;
decode_yc_media_els(__TopXMLNS, __Opts, [_ | _els],
		    Items) ->
    decode_yc_media_els(__TopXMLNS, __Opts, _els, Items).

encode_yc_media({yc_media_items, Items}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els = lists:reverse('encode_yc_media_$items'(Items,
						  __NewTopXMLNS, [])),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"media">>, _attrs, _els}.

'encode_yc_media_$items'([], __TopXMLNS, _acc) -> _acc;
'encode_yc_media_$items'([Items | _els], __TopXMLNS,
			 _acc) ->
    'encode_yc_media_$items'(_els, __TopXMLNS,
			     [encode_yc_media_item(Items, __TopXMLNS) | _acc]).

decode_yc_info(__TopXMLNS, __Opts,
	       {xmlel, <<"info">>, _attrs, _els}) ->
    {Sent, Uid} = decode_yc_info_attrs(__TopXMLNS, _attrs,
				       undefined, undefined),
    {yc_info, Sent, Uid}.

decode_yc_info_attrs(__TopXMLNS,
		     [{<<"sent">>, _val} | _attrs], _Sent, Uid) ->
    decode_yc_info_attrs(__TopXMLNS, _attrs, _val, Uid);
decode_yc_info_attrs(__TopXMLNS,
		     [{<<"uid">>, _val} | _attrs], Sent, _Uid) ->
    decode_yc_info_attrs(__TopXMLNS, _attrs, Sent, _val);
decode_yc_info_attrs(__TopXMLNS, [_ | _attrs], Sent,
		     Uid) ->
    decode_yc_info_attrs(__TopXMLNS, _attrs, Sent, Uid);
decode_yc_info_attrs(__TopXMLNS, [], Sent, Uid) ->
    {decode_yc_info_attr_sent(__TopXMLNS, Sent),
     decode_yc_info_attr_uid(__TopXMLNS, Uid)}.

encode_yc_info({yc_info, Sent, Uid}, __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els = [],
    _attrs = encode_yc_info_attr_uid(Uid,
				     encode_yc_info_attr_sent(Sent,
							      xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
											 __TopXMLNS))),
    {xmlel, <<"info">>, _attrs, _els}.

decode_yc_info_attr_sent(__TopXMLNS, undefined) -> <<>>;
decode_yc_info_attr_sent(__TopXMLNS, _val) -> _val.

encode_yc_info_attr_sent(<<>>, _acc) -> _acc;
encode_yc_info_attr_sent(_val, _acc) ->
    [{<<"sent">>, _val} | _acc].

decode_yc_info_attr_uid(__TopXMLNS, undefined) -> <<>>;
decode_yc_info_attr_uid(__TopXMLNS, _val) -> _val.

encode_yc_info_attr_uid(<<>>, _acc) -> _acc;
encode_yc_info_attr_uid(_val, _acc) ->
    [{<<"uid">>, _val} | _acc].

decode_yc_media_item(__TopXMLNS, __Opts,
		     {xmlel, <<"item">>, _attrs, _els}) ->
    Thumbnail = decode_yc_media_item_els(__TopXMLNS, __Opts,
					 _els, false),
    {Type, Uid, Url, Lat, Lng} =
	decode_yc_media_item_attrs(__TopXMLNS, _attrs,
				   undefined, undefined, undefined, undefined,
				   undefined),
    {yc_media_item, Type, Uid, Url, Thumbnail, Lat, Lng}.

decode_yc_media_item_els(__TopXMLNS, __Opts, [],
			 Thumbnail) ->
    Thumbnail;
decode_yc_media_item_els(__TopXMLNS, __Opts,
			 [{xmlel, <<"thumbnail">>, _attrs, _} = _el | _els],
			 Thumbnail) ->
    case xmpp_codec:get_attr(<<"xmlns">>, _attrs,
			     __TopXMLNS)
	of
      <<"urn:yc:message:data">> ->
	  decode_yc_media_item_els(__TopXMLNS, __Opts, _els,
				   decode_yc_media_item_thumbnail(<<"urn:yc:message:data">>,
								  __Opts, _el));
      _ ->
	  decode_yc_media_item_els(__TopXMLNS, __Opts, _els,
				   Thumbnail)
    end;
decode_yc_media_item_els(__TopXMLNS, __Opts, [_ | _els],
			 Thumbnail) ->
    decode_yc_media_item_els(__TopXMLNS, __Opts, _els,
			     Thumbnail).

decode_yc_media_item_attrs(__TopXMLNS,
			   [{<<"type">>, _val} | _attrs], _Type, Uid, Url, Lat,
			   Lng) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, _val,
			       Uid, Url, Lat, Lng);
decode_yc_media_item_attrs(__TopXMLNS,
			   [{<<"uid">>, _val} | _attrs], Type, _Uid, Url, Lat,
			   Lng) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, Type,
			       _val, Url, Lat, Lng);
decode_yc_media_item_attrs(__TopXMLNS,
			   [{<<"url">>, _val} | _attrs], Type, Uid, _Url, Lat,
			   Lng) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, Type,
			       Uid, _val, Lat, Lng);
decode_yc_media_item_attrs(__TopXMLNS,
			   [{<<"lat">>, _val} | _attrs], Type, Uid, Url, _Lat,
			   Lng) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, Type,
			       Uid, Url, _val, Lng);
decode_yc_media_item_attrs(__TopXMLNS,
			   [{<<"lng">>, _val} | _attrs], Type, Uid, Url, Lat,
			   _Lng) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, Type,
			       Uid, Url, Lat, _val);
decode_yc_media_item_attrs(__TopXMLNS, [_ | _attrs],
			   Type, Uid, Url, Lat, Lng) ->
    decode_yc_media_item_attrs(__TopXMLNS, _attrs, Type,
			       Uid, Url, Lat, Lng);
decode_yc_media_item_attrs(__TopXMLNS, [], Type, Uid,
			   Url, Lat, Lng) ->
    {decode_yc_media_item_attr_type(__TopXMLNS, Type),
     decode_yc_media_item_attr_uid(__TopXMLNS, Uid),
     decode_yc_media_item_attr_url(__TopXMLNS, Url),
     decode_yc_media_item_attr_lat(__TopXMLNS, Lat),
     decode_yc_media_item_attr_lng(__TopXMLNS, Lng)}.

encode_yc_media_item({yc_media_item, Type, Uid, Url,
		      Thumbnail, Lat, Lng},
		     __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els =
	lists:reverse('encode_yc_media_item_$thumbnail'(Thumbnail,
							__NewTopXMLNS, [])),
    _attrs = encode_yc_media_item_attr_lng(Lng,
					   encode_yc_media_item_attr_lat(Lat,
									 encode_yc_media_item_attr_url(Url,
												       encode_yc_media_item_attr_uid(Uid,
																     encode_yc_media_item_attr_type(Type,
																				    xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
																							       __TopXMLNS)))))),
    {xmlel, <<"item">>, _attrs, _els}.

'encode_yc_media_item_$thumbnail'(false, __TopXMLNS,
				  _acc) ->
    _acc;
'encode_yc_media_item_$thumbnail'(Thumbnail, __TopXMLNS,
				  _acc) ->
    [encode_yc_media_item_thumbnail(Thumbnail, __TopXMLNS)
     | _acc].

decode_yc_media_item_attr_type(__TopXMLNS, undefined) ->
    erlang:error({xmpp_codec,
		  {missing_attr, <<"type">>, <<"item">>, __TopXMLNS}});
decode_yc_media_item_attr_type(__TopXMLNS, _val) ->
    _val.

encode_yc_media_item_attr_type(_val, _acc) ->
    [{<<"type">>, _val} | _acc].

decode_yc_media_item_attr_uid(__TopXMLNS, undefined) ->
    <<>>;
decode_yc_media_item_attr_uid(__TopXMLNS, _val) -> _val.

encode_yc_media_item_attr_uid(<<>>, _acc) -> _acc;
encode_yc_media_item_attr_uid(_val, _acc) ->
    [{<<"uid">>, _val} | _acc].

decode_yc_media_item_attr_url(__TopXMLNS, undefined) ->
    <<>>;
decode_yc_media_item_attr_url(__TopXMLNS, _val) -> _val.

encode_yc_media_item_attr_url(<<>>, _acc) -> _acc;
encode_yc_media_item_attr_url(_val, _acc) ->
    [{<<"url">>, _val} | _acc].

decode_yc_media_item_attr_lat(__TopXMLNS, undefined) ->
    <<>>;
decode_yc_media_item_attr_lat(__TopXMLNS, _val) -> _val.

encode_yc_media_item_attr_lat(<<>>, _acc) -> _acc;
encode_yc_media_item_attr_lat(_val, _acc) ->
    [{<<"lat">>, _val} | _acc].

decode_yc_media_item_attr_lng(__TopXMLNS, undefined) ->
    <<>>;
decode_yc_media_item_attr_lng(__TopXMLNS, _val) -> _val.

encode_yc_media_item_attr_lng(<<>>, _acc) -> _acc;
encode_yc_media_item_attr_lng(_val, _acc) ->
    [{<<"lng">>, _val} | _acc].

decode_yc_media_item_thumbnail(__TopXMLNS, __Opts,
			       {xmlel, <<"thumbnail">>, _attrs, _els}) ->
    Data = decode_yc_media_item_thumbnail_els(__TopXMLNS,
					      __Opts, _els, <<>>),
    {yc_thumbnail, Data}.

decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				   [], Data) ->
    decode_yc_media_item_thumbnail_cdata(__TopXMLNS, Data);
decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				   [{xmlcdata, _data} | _els], Data) ->
    decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				       _els, <<Data/binary, _data/binary>>);
decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				   [_ | _els], Data) ->
    decode_yc_media_item_thumbnail_els(__TopXMLNS, __Opts,
				       _els, Data).

encode_yc_media_item_thumbnail({yc_thumbnail, Data},
			       __TopXMLNS) ->
    __NewTopXMLNS =
	xmpp_codec:choose_top_xmlns(<<"urn:yc:message:data">>,
				    [], __TopXMLNS),
    _els = encode_yc_media_item_thumbnail_cdata(Data, []),
    _attrs = xmpp_codec:enc_xmlns_attrs(__NewTopXMLNS,
					__TopXMLNS),
    {xmlel, <<"thumbnail">>, _attrs, _els}.

decode_yc_media_item_thumbnail_cdata(__TopXMLNS,
				     <<>>) ->
    <<>>;
decode_yc_media_item_thumbnail_cdata(__TopXMLNS,
				     _val) ->
    _val.

encode_yc_media_item_thumbnail_cdata(<<>>, _acc) ->
    _acc;
encode_yc_media_item_thumbnail_cdata(_val, _acc) ->
    [{xmlcdata, _val} | _acc].
