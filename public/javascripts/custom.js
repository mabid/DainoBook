function inline_tip(elem, title)
{
    if( elem.value == '' || elem.value == title )
    {
        elem.setStyle({ color:'#AAAAAA'});
        elem.value = title;
    }
    elem.observe('focus', function(e){ if( elem.value == title) elem.value=''; elem.setStyle({color:'black'});});
    elem.observe('blur', function(e){ if(elem.value==""){ elem.value=title; elem.style.color="#AAAAAA"; }});

    form = elem.ancestors().filter(function(e){ return e.tagName == "FORM" })[0];
    Event.observe(form, 'submit', function(){ if( elem.value == title ) elem.value = ""; });
}

function update_msg(url, obj)
{
    new Ajax.Request(url);
    Effect.toggle(Element.up(obj).next(1).identify(), 'appear', { duration:0.1 });
    obj.siblings().each(function(e){ e.show(); });
    obj.hide();
}

function delete_sms(obj, url, sms_target, sms_list)
{
    sms_target.setOpacity(0.5);
    ajax_updater(sms_list, url);
}
function ajax_call(link, url, target)
{
    target.setOpacity(0.5);
    new Ajax.Updater(
        { success:target }, url,
            { evalScripts:true, onSuccess:function(){target.setOpacity(1.0);} }
    );
}
function delete_bulk_sms(form, target)
{
    target.setOpacity(0.5);
    form.request({ onComplete:function(d){ target.setOpacity(1.0); }, onSuccess:function(d){ target.replace(d.responseText); }});
}
function open_popup_inline(facebox, header, data, event, params, klass)
{
    facebox.loading();
    fb.reveal(header, data, klass, params);
    if( event )
        Event.stop(event);
}
function open_popup(facebox, header, url, event, params, klass)
{
    facebox.loading();
	new Ajax.Request(url, {
		method		: 'post',
        parameters: params,
		onFailure	: function(transport){
			fb.reveal(header, transport.responseText, klass, params);
            if( params && params['onFailure'])
                params['onFailure'](transport);
            if( params && params['onComplete'])
                params['onFailure'](onComplete);
		},
		onSuccess	: function(transport){
			fb.reveal(header, transport.responseText, klass, params);
            if( params && params['onSuccess'])
                params['onSuccess'](transport);

            if( params && params['onComplete'])
                params['onFailure'](onComplete);
		}
	});
    if( event )
        Event.stop(event);
}
function ajax_request(url, options)
{
    var host = location.protocol + '//' + location.host;
    new Ajax.Request(host + url, options);
}

function ajax_updater(container, url, options)
{
    var host = location.protocol + '//' + location.host;
    if( options == null )
        options = {};
    if( options['onSuccess'] )
    {
        options['onSuccess'] = options['onSuccess'].wrap(function(base_func, transport)
        {
            container.replace(transport.responseText);
            base_func(transport);

        });
    }
    else
    {
        options['onSuccess'] = function(transport)
        {
            container.replace(transport.responseText);
        }
    }
    ajax_request(url, options);
}
function get_page(obj, url, requester, target)
{
    target = $(target);
    requester = $(requester);
    requester.setOpacity(0.5);
    new Ajax.Updater(
        { success:target }, url,
            { evalScripts:true }
    );
}