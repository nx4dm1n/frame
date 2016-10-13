/**
 * Created by Administrator on 2016/9/13 0013.
 */


require.config({
    paths   : {
        "momo"          :'js/momo',
        "domReady"      :'lib/domReady/domReady.min',
        "jquery"       :'lib/jquery/jquery',
        "jquery-ui"     :'lib/jquery-ui/jquery-ui',
        "bootstrap"     :"lib/bootstrap/js/bootstrap",
        "morris"        :"lib/morrisjs/morris",
        "raphael"       :"lib/raphael/raphael",
        "flot"          :"lib/flot/jquery.flot",
        "flot-resize"   :"lib/flot/jquery.flot.resize",
        "flot-spline"   :"lib/flot-spline/jquery.flot.spline",
        "knob"          :"lib/jquery-knob/jquery.knob",
        "toggles"       :"lib/jquery-toggles/toggles",
        "select2"       :"lib/select2/select2",
        "quirk"         :"js/quirk",
        "dashboard"     :"js/dashboard",
        "autosize"      :"lib/jquery-autosize/autosize",
        "zTree"         :"lib/zTree/js/jquery.ztree.all"
    },
    shim: {
        'jquery':{
            exports: 'jQuery'
        },
        'momo': {
            deps: ['jquery']
        },
        'bootstrap': {
            deps: ['jquery']
        }
    }
});

require(['jquery', 'domReady', 'jquery-ui', 'bootstrap', 'toggles', 'momo'], function (domReady){
    domReady(function () {
        /**
         * 显示/隐藏 左侧面板
         */
        $('#menuToggle').click(function() {
            var collapsedMargin = $('.mainpanel').css('margin-left');
            var collapsedLeft = $('.mainpanel').css('left');

            if(collapsedMargin === '220px' || collapsedLeft === '220px') {
                toggleMenu(-220,0);
            } else {
                toggleMenu(0,220);
            }
        });

        function toggleMenu(marginLeft, marginMain) {
            var emailList = ($(window).width() <= 768 && $(window).width() > 640)? 320 : 360;

            if($('.mainpanel').css('position') === 'relative') {
                $('.logopanel, .leftpanel').animate({left: marginLeft}, 'fast');
                $('.headerbar, .mainpanel').animate({left: marginMain}, 'fast');

                $('.emailcontent, .email-options').animate({left: marginMain}, 'fast');
                $('.emailpanel').animate({left: marginMain + emailList}, 'fast');

                if($('body').css('overflow') == 'hidden') {
                    $('body').css({overflow: ''});
                } else {
                    $('body').css({overflow: 'hidden'});
                }
            } else {
                $('.logopanel, .leftpanel').animate({marginLeft: marginLeft}, 'fast');
                $('.headerbar, .mainpanel').animate({marginLeft: marginMain}, 'fast');
                $('.emailcontent, .email-options').animate({left: marginMain}, 'fast');
                $('.emailpanel').animate({left: marginMain + emailList}, 'fast');
            }
        }

        /**
         * a标签所有带有ajax-link样式的进行ajax请求
         */
        $(document).on('click','a', function(e){
            if ($(this).hasClass('ajax-link')) {
                e.preventDefault();
                var url     = $(this).attr('href');
                var target  = $(this).attr('data-href-target')!==undefined ? $(this).attr('data-href-target') : '#ajax-content';
                $.LoadAjaxContent(url, target);
            }
        });

        /**
         * 后台管理页面-左侧菜单点击 高亮(active)标识
         */
        $(document).on('click', '#mainmenu ul.children li', function(){
            $('#mainmenu .active').removeClass('active');
            $(this).addClass('active');
            $(this).parents('li.nav-parent').addClass('active');
        });

        /**
         * Tooltip
         */
        $('.tooltips').tooltip({ container: 'body'});

        /**
         * Toggle Left Menu
         */
        $('.nav-parent > a').on('click', function() {
            var gran = $(this).closest('.nav');
            var parent = $(this).parent();
            var sub = parent.find('> ul');

            if(sub.is(':visible')) {
                sub.slideUp(200);
                if(parent.hasClass('nav-active')) { parent.removeClass('nav-active'); }
            } else {
                $(gran).find('.children').each(function() {
                    $(this).slideUp();
                });

                sub.slideDown(200);
                if(!parent.hasClass('active')) { parent.addClass('nav-active'); }
            }
            return false;
        });

    });
});