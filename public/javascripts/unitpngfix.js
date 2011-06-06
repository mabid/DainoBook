var clear="/isms/images/clear.gif";

pngfix=function()
{
    try
    {
        var els=document.getElementsByTagName('*');
        var i_p=/\.png/i;
        var i=els.length;
        while (i-- >0)
        {
            var el=els[i];
            var es=el.style;
            if( el.src && el.src.match(i_p) && es.filter=='')
            {
                el.height = el.height;
                el.width = el.width;
                es.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+el.src+"',sizingMethod='crop')";
                el.src = clear;
            }
            else if( el.currentStyle != null )
            {
                var elb=el.currentStyle.backgroundImage;
                if(elb.match(i_p))
                {
                    var path=elb.split('"');
                    var rep=(el.currentStyle.backgroundRepeat=='no-repeat')?'crop':'scale';es.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+path[1]+"',sizingMethod='"+rep+"')";
                    es.height=el.clientHeight+'px';
                    es.backgroundImage="none";
                }
            }
            if (el.currentStyle != null && el.currentStyle.position!='absolute' && !es.filter && !el.tagName.match(/(body|html|script)/gi))
                es.position="relative";
                if (es.filter&&el.currentStyle.position=="relative")
                es.position="static";
        }
    }
    catch(e)
    {
        //do nothing
    }
}
if( navigator.appName == 'Microsoft Internet Explorer')
    Event.observe(window, 'load',pngfix);