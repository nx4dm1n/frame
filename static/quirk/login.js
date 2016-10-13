/**
 * Created by Administrator on 2016/9/13 0013.
 */


require.config({
    paths   : {
        jquery      :'lib/jquery/jquery',
        momo        :'js/momo'
    }
});

require(['jquery'], function (){
    require(['momo'], function(){
        $('[data-action]').momoAjax();
    });
});