
/* =====================================================================================
 * $.cachefile('url')
 */
!function ($) {
    $.extend({
        cachefile: function (url) {
            var cache = document.createElement('object');
            cache.data = url;
            cache.id = new Date().getTime();
            cache.width = 0;
            cache.height = 0;
            document.body.appendChild(cache);
            return cache;
        }
    })
}($)

/*=====================================================================================
 * $.tip('str','error')
 * $.tip('str','alert')
 * $.tip('str','success')
 */
!function ($) {
    $(function () {
        if ($('.handle-tip').length == 0)
            $('body').append('<div class="handle-tip hide" style="z-index: 999999"></div>');
    })
    $.extend({
        tip: function (text, type) {
            $('.handle-tip').html(text).autoShowAndHide(type);
        }
    })
    $.fn.extend({
        autoShowAndHide: function (type) {
            var left = parseFloat($('.handle-tip').width()) / 2;
            $('.handle-tip').css({ 'opacity': '0', 'margin-left': '-' + left + 'px', 'display': 'block' })
                .attr('class', 'handle-tip handle-' + type).stop()
                .animate({ 'opacity': 1 }, 200, function () {
                    $(this).animate({ 'opacity': 0 }, 6000, function () {
                        $(this).css('display', 'none');
                    });
                });
        }
    })
}($)

/*=====================================================================================
 * url      请求的地址
 * target   显示位置
 * $.LoadAjaxContent(url)
 */
!function ($) {
    $.extend({
        LoadAjaxContent: function (url, target) {
            $.ajax({
                mimeType    : 'text/html; charset=utf-8', // ! Need set mimeType only when run from local file
                url         : url,
                type        : 'GET',
                cache       : false,
                beforeSend  : function(){
                    $(target).empty();
                    $(target).html('<div class="preloader"><i class="fa fa-spinner fa-pulse fa-3x fa-fw"></i><span class="sr-only">Loading...</span></div>');
                },
                success     : function(data) {
                    $(target).empty();
                    $(target).html(data);
                },
                error       : function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                },
                dataType    : "html",
                async       : true
            });
        }
    })
}($)


/*=====================================================================================
 * $(ele).momoAjax({beforeSend:callback,success:callback})
 * data-action="url"   data-type="post"   data-param="json"                  若无data-type，默认post
 * data-action="url"   data-type="get"    data=param="location.search"       若无data-type，默认post
 * data-role="submit"  data-target='formSelector'
 * data-sync="name"
 * data-check='noNull,onlyNum,xxx' data-tip='$.tip要提示的信息'
 * data-cancel-tip="true" 取消所有操作过程的tip提示信息
 *
 * href_ajax="true" data-href 在跳转时采用ajax方式
 * href_target="#ajax-content" 与 href_ajax一起使用，指定ajax请求的页面数据放到哪个dom标签，默认是#ajax-content
 */
!function ($) {
    function MomoAjax($el, oParam) {
        $el.data('beforeSend', oParam.beforeSend || function () {
            return {ret: true}
        });
        $el.data('success', oParam.success || '');
        $el.data('other', oParam.other || '');
        return $el;
    };
    MomoAjax.formData = function ($form) {
        var formData = new FormData();
        $.each($form.serializeArray(), function (k, v) {
            formData.append(v['name'], v['value']);
        });
        $form.find('input[type="file"]').each(function () {
            formData.append($(this).attr('name'), this.files[0]);
        })
        return formData;
    }
    MomoAjax.verify = function ($el) {
        var resultList = {};
        resultList.form = $el.data('target') ? $($el.data('target')) : $el.parents('form').length > 0 ? $el.parents('form') : null;
        resultList.contentType = resultList.form && resultList.form.attr('enctype') === 'multipart/form-data' ? false : 'application/x-www-form-urlencoded; charset=UTF-8';
        resultList.type = $el.data('type') ? $el.data('type') : resultList.form ? resultList.form.attr('method') : 'post';                 //data-type优先级最高
        resultList.action = $el.attr('data-action') ? $el.attr('data-action') : resultList.form ? resultList.form.attr('action') : location.href;    //data-action优先级最高
        resultList.toggle_action = $el.attr('data-toggle-action') ? $el.attr('data-toggle-action') : '';
        resultList.toggle_class = $el.attr('data-toggle-class') ? $el.attr('data-toggle-class') : '';
        resultList.param = $el.data('param') ? ($el.data('type') == 'post' ? ((typeof $el.data('param') == 'string') ? $.parseJSON($el.data('param')) : $el.data('param')) : $el.data('param')) : resultList.form ? resultList.form.serialize() : {};
        resultList.isHasFile = !(/www/.test(resultList.contentType));
        resultList.data = resultList.isHasFile ? new FormData(resultList.form[0]) : resultList.param;
        resultList.check_node = resultList.form ? resultList.form.find('[data-check]') : null;                                             //先检查，后beforeend
        resultList.beforeSend = $el.data('beforeSend') || null;
        resultList.success = $el.data('success') || null;
        resultList.other = $el.data('other') || null;
        resultList.confirm = $el.is('[data-confirm]') ? $el.attr('data-confirm') ? $el.attr('data-confirm') : '' : null;
        resultList.isCancelTip = $el.data('cancel-tip') || false;
        resultList.reload = $el.attr('data-reload') || null;
        resultList.href = $el.attr('data-href') == 'href' ? location.href : ($el.attr('data-href') ? $el.attr('data-href') : '');
        resultList.href_ajax = $el.attr('data-href-ajax') ? true : false;
        resultList.href_target = $el.attr('data-href-target')!==undefined ? $el.attr('data-href-target') : '#ajax-content';
        resultList.processData = resultList.isHasFile ? false : true;
        resultList.result = {ret: true};
        return resultList;
    }
    MomoAjax.isTextField = function ($el) {
        return ($el[0].nodeName == 'TEXTAREA' || $el[0].nodeName == 'INPUT' && /hidden|text/.test($el.attr('type')))
    }
    MomoAjax.isSelect = function ($el) {
        return ($el[0].nodeName == 'SELECT')
    }
    MomoAjax.isCheckbox = function ($el) {
        return ($el[0].nodeName == 'INPUT' && /checkbox/.test($el.attr('type')))
    }
    MomoAjax.isRadio = function ($el) {
        return ($el[0].nodeName == 'INPUT' && /radio/.test($el.attr('type')))
    }
    MomoAjax.check = {
        noNull: function ($el) {
            return {ret: !($.trim($el.val()) == ''), errorMsg: $el.data('tip') || '不允许为空'}
        },
        onlyNum: function ($el) {
            return {ret: (/^[0-9]*$/.test($el.val())), errorMsg: $el.data('tip') || '只能是純数字'}
        },
        onlyNumeric: function ($el) {
            return {ret: ($.isNumeric($el.val())), errorMsg: $el.data('tip') || '只能是数值'}
        },
        phone: function ($el) {
            var reg = /^(\+)?\d{5,}$/;
            return {ret: (reg.test($el.val())), errorMsg: $el.data('tip') || '大哥，手机号都能输错？'}
        },
        email: function ($el) {
            var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return {ret: (reg.test($el.val())), errorMsg: $el.data('tip') || '老妹，邮箱格式不对'}
        }
    }
    MomoAjax.tool = {
        toggle: function ($el, resultList) {//切换样式和action
            var _class = resultList.toggle_class;
            var _action = resultList.toggle_action;
            if (_class) {
                ($el.hasClass(_class)) ? $el.removeClass(_class) : $el.addClass(_class);
            }
            if (_action) {
                if (resultList.form) {
                    var tem_action = resultList.form.attr('action');
                    resultList.form.attr('data-action', _action);
                    $el.attr('data-toggle-action', tem_action);
                }
                else {
                    var tem_action = $el.attr('data-action');
                    $el.attr('data-action', _action).attr('data-toggle-action', tem_action);
                }
            }
        }
    }
    MomoAjax.prototype = {
        init: function (e) {
            var $el = $(e.target);
            var resultList = MomoAjax.verify($el);//判定元素身上各种属性，返回结果清单
            if (resultList.confirm != null) {
                var closeKey = $el.attr('data-closeKey') || '',
                    submitKey = $el.attr('data-submitKey') || '';
                $.when($.momoConfirm(resultList.confirm, '', closeKey, submitKey))
                    .done(function () {
                        MomoAjax.prototype.submit(e);
                    });
            }
            else {
                MomoAjax.prototype.submit(e);
            }
        },
        submit: function (e) {
            var $el = $(e.target);
            var resultList = MomoAjax.verify($el);
            $.ajax({
                type: resultList.type,
                url: resultList.action,
                data: resultList.data,
                contentType: resultList.contentType,
                processData: resultList.processData,
                xhr: function () {
                    var myXhr = $.ajaxSettings.xhr();
                    if (resultList.isHasFile) {//兼容异步上传对jquery的xhr对象的影响
                        var $fileInput = resultList.form.find('.upload-box input[type="file"]');
                        if ($fileInput.val()) {
                            myXhr.addEventListener("loadstart", function (e) {
                                $fileInput.attr('disabled', 'disabled');
                            }, false);
                            myXhr.upload.addEventListener('progress', function (e) {
                                var percentComplete = (e.loaded / e.total).toFixed(3);
                                var w = ($('.upload-box').outerWidth() - 2) * percentComplete;
                                $('.progress-bar').css('width', w + 'px');
                            }, false);
                            myXhr.addEventListener("load", function (e) {
                                $fileInput.removeAttr('disabled');
                            }, false);
                        }
                    }
                    return myXhr;
                },
                beforeSend: function (promise, jqXHR) {
                    if (!resultList.isCancelTip) $.tip('正在处理，请稍候...', 'alert');
                    var isHasError = false;
                    if (resultList.check_node && resultList.check_node.length > 0) {
                        resultList.check_node.each(function () { //循环 MomoAjax.check来检查
                            var $check_node = $(this);
                            if ($check_node.attr('disabled')) {//不检查disabled的元素
                                return true;
                            }
                            var checkList = $check_node.data('check').split(',');
                            $.each(checkList, function (k, v) {
                                if (v in MomoAjax.check) {
                                    resultList.result = MomoAjax.check[v]($check_node);
                                    if (!resultList.result.ret) {
                                        resultList.form.find('[data-mark]').css('border', '').removeAttr('data-mark');
                                        $check_node.attr('data-mark', 'css').css('border', '1px solid #f00');
                                        isHasError = true;
                                        return false;
                                    }
                                }
                            })
                            if (!resultList.result.ret) {//有不合格直接退出严查循环
                                return false;
                            }
                        })
                        if (isHasError) {
                            this.errorMsg = (resultList.result && !resultList.result.ret && resultList.result.errorMsg) ? resultList.result.errorMsg : '';
                            return resultList.result.ret;
                        }
                    }
                    if (resultList.beforeSend) {
                        resultList.result = resultList.beforeSend.call($el,jqXHR);
                    }
                    this.errorMsg = (resultList.result && !resultList.result.ret && resultList.result.errorMsg) ? resultList.result.errorMsg : '';
                    return resultList.result.ret;
                }
            }).fail(function () {
                if (!resultList.isCancelTip)
                    $.tip(this.errorMsg || '出错了，请重试', 'error');
            }).done(function (data) {
                    if (data && data.ec == 200 || data.errcode == 200) {
                        if (resultList.success) {
                            resultList.success.call($el, data);
                            if (resultList.toggle_action || resultList.toggle_class) {
                                MomoAjax.tool.toggle($el, resultList);
                            }
                            return;
                        }
                        else {
                            if (!resultList.isCancelTip)
                                $.tip(data && data.em || data.errmsg || '提交成功', 'success');
                            MomoAjax.tool.toggle($el, resultList);
                            if (resultList.reload) {
                                setTimeout(function () {
                                    window.location.reload();
                                }, 500);
                            }
                            if (resultList.href) {
                                if (resultList.href_ajax) {
                                    setTimeout(function () {
                                        $.LoadAjaxContent(resultList.href, resultList.href_target);
                                    }, 500);
                                }else{
                                    setTimeout(function () {
                                        location.href = resultList.href;
                                    }, 500);
                                    //
                                }
                            }
                        }
                    }
                    else {
                        if (resultList.other) {
                            resultList.other.call($el, data);
                            return;
                        }
                        else {
                            if (!resultList.isCancelTip)
                                $.tip(data && data.em || data.errmsg || '提交成功，但服务器返回有异常', 'error');
                        }
                    }

                }
            );
        },
        sync: function (e) {
            var $target = $(e.target);
            if (!$target.is('[data-sync]'))return;
            var $el = $('[data-sync=' + $target.data('sync') + ']:not([data-sync-focus])');
            if (MomoAjax.isTextField($el)) {
                var value = $target.val();
                $el.val(value).attr('value', value);

            }
            if (MomoAjax.isSelect($el)) {
                var value = $target.val();
                $el.val(value);
            }
            if (MomoAjax.isCheckbox($el) || MomoAjax.isRadio($el)) {
                $el.prop('checked', $target.is(':checked'));
            }
        },
        initSync: function () {
            $('[data-sync]').each(function (e) {
                var $this = $(this);
                var $el = $('[data-sync=' + $this.data('sync') + ']');
                if (MomoAjax.isTextField($this)) {
                    if ($this.val()) {
                        var value = $this.val();
                        $el.val(value).attr('value', value);
                    }
                }
                if (MomoAjax.isSelect($this)) {
                    if ($this.val()) {
                        var value = $this.val();
                        $el.val(value);
                    }
                }
                if (MomoAjax.isCheckbox($this) || MomoAjax.isRadio($this)) {
                    if ($this.is(':checked')) {
                        $el.prop('checked', $this.is(':checked'));
                    }
                }
            })
        },
        reset: function (e) {
            var $el = $(e.target);
            var resultList = MomoAjax.verify($el);
            resultList.form[0].reset();
        },
        fileChange: function () {
            var $this = $(this);
            var file = $this[0].files[0];
            var fileSize = 0;
            var fileName = file.name;
            //添加文件大小限制
            if ($this.attr("data-maxsize")) {
                var maxsize = $this.attr("data-maxsize") * 1024 * 1024;
                if (maxsize < file.size) {
                    $.tip("对不起，文件大小超过了限制！", "error");
                    $(this).val("");
                    return false;
                }
            }

            if (file.size > 1024 * 1024)
                fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
            else
                fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
            $.tip('名称：' + file.name + '<br>类型：' + file.type + '<br>大小：' + fileSize, 'alert');
            if (file.name.length > 10) {
                fileName = /.{0,10}/.exec(file.name)[0] + '...';
            }
            $this.prev().html(fileName);
            $this.css('width', $('.upload-box').outerWidth() + 'px');
            $('.progress-bar').css({
                left: $this.offset().left + 1 + 'px',
                top: $this.offset().top - 5 + 'px'
            })
        },
        fileMousedown: function (e) {
            var $this = $(this);
            $this.prev().html('选择文件');
            $this.css('width', '89px').val('');
            $('.progress-bar').css('width', '0px');
        }
    }
    $.fn.momoAjax = function (oParam) {
        return new MomoAjax($(this), oParam);
    }
    $.fn.momoFile = function () {
        if ($('.progress-bar').length == 0)
            $('body').append('<div class="progress-bar"></div>');
        $(this).on('change', MomoAjax.prototype.fileChange).on('mousedown', MomoAjax.prototype.fileMousedown);
    };
    $(function () {
        if (!window.seajs) {
            setTimeout(MomoAjax.prototype.initSync, 300);
            $(document).on('click', '[data-action],[data-role=submit]', MomoAjax.prototype.init);
            $(document).on('click', '[data-role=reset]', MomoAjax.prototype.reset);
            $(document).on('sync', MomoAjax.prototype.sync);
            $(document).on('click', '[data-check]', function () {
                var $this = $(this);
                if (/css/.test($this.data('mark'))) {
                    $this.css('border', '').attr('data-mark', $this.data('mark').replace('css', ''));
                }
            });
            $('input[data-sync],textarea[data-sync]')
                .focusin(function () {
                    $(this).attr('data-sync-focus', 'true');
                })
                .focusout(function () {
                    $(this).removeAttr('data-sync-focus').attr('value', $(this).val());
                })
                .on('input', function () {
                    $(this).trigger('sync');
                })
            $('select[data-sync]').change(function (e) {
                $(this).trigger('sync');
            })
            $('input[type=radio][data-sync],input[type=checkbox][data-sync]').click(function (e) {
                $(this).trigger('sync');
            })
            var $momoFile = $('.upload-box input[type="file"]');
            if ($momoFile.length > 0) {
                $('.upload-box input[type="file"]').momoFile();
            }
        }
    })
}($)


/*=====================================================================================
 $.query
 @Demo:
 var url = location.search;
 > "?action=view&section=info&id=123&debug&testy[]=true&testy[]=false&testy[]"

 var section = $.query.get('section');
 > "info"

 var id = $.query.get('id');
 > 123

 var debug = $.query.get('debug');
 > true

 var arr = $.query.get('testy');
 > ["true", "false", true]

 var arrayElement = $.query.get('testy[1]');
 > "false"

 var newUrl = $.query.set("section", 5).set("action", "do").toString();
 > "?action=do&section=5&id=123"

 var newQuery = "" + $.query.set('type', 'string');
 > "?action=view&section=info&id=123&type=string"

 var oldQuery = $.query.toString();
 > "?action=view&section=info&id=123"

 var oldQuery2 = $.query;
 > ?action=view&section=info&id=123

 var newerQuery = $.query.SET('type', 'string');
 > ?action=view&section=info&id=123&type=string

 var notOldQuery = $.query.toString();
 > "?action=view&section=info&id=123&type=string"

 var oldQueryAgain = $.query.REMOVE("type");
 > ?action=view&section=info&id=123

 var emptyQuery = $.query.empty();
 > ""

 var stillTheSame = $.query.copy();
 > ?action=view&section=info&id=123
 *
 */
!function (settings) {
    // Various Settings
    var $separator = settings.separator || '&';
    var $spaces = settings.spaces === false ? false : true;
    var $suffix = settings.suffix === false ? '' : '[]';
    var $prefix = settings.prefix === false ? false : true;
    var $hash = $prefix ? settings.hash === true ? "#" : "?" : "";
    var $numbers = settings.numbers === false ? false : true;

    jQuery.query = new function () {
        var is = function (o, t) {
            return o != undefined && o !== null && (!!t ? o.constructor == t : true);
        };
        var parse = function (path) {
            var m, rx = /\[([^[]*)\]/g, match = /^([^[]+)(\[.*\])?$/.exec(path), base = match[1], tokens = [];
            while (m = rx.exec(match[2])) tokens.push(m[1]);
            return [base, tokens];
        };
        var set = function (target, tokens, value) {
            var o, token = tokens.shift();
            if (typeof target != 'object') target = null;
            if (token === "") {
                if (!target) target = [];
                if (is(target, Array)) {
                    target.push(tokens.length == 0 ? value : set(null, tokens.slice(0), value));
                } else if (is(target, Object)) {
                    var i = 0;
                    while (target[i++] != null);
                    target[--i] = tokens.length == 0 ? value : set(target[i], tokens.slice(0), value);
                } else {
                    target = [];
                    target.push(tokens.length == 0 ? value : set(null, tokens.slice(0), value));
                }
            } else if (token && token.match(/^\s*[0-9]+\s*$/)) {
                var index = parseInt(token, 10);
                if (!target) target = [];
                target[index] = tokens.length == 0 ? value : set(target[index], tokens.slice(0), value);
            } else if (token) {
                var index = token.replace(/^\s*|\s*$/g, "");
                if (!target) target = {};
                if (is(target, Array)) {
                    var temp = {};
                    for (var i = 0; i < target.length; ++i) {
                        temp[i] = target[i];
                    }
                    target = temp;
                }
                target[index] = tokens.length == 0 ? value : set(target[index], tokens.slice(0), value);
            } else {
                return value;
            }
            return target;
        };

        var queryObject = function (a) {
            var self = this;
            self.keys = {};

            if (a.queryObject) {
                jQuery.each(a.get(), function (key, val) {
                    self.SET(key, val);
                });
            } else {
                jQuery.each(arguments, function () {
                    var q = "" + this;
                    q = q.replace(/^[?#]/, ''); // remove any leading ? || #
                    q = q.replace(/[;&]$/, ''); // remove any trailing & || ;
                    if ($spaces) q = q.replace(/[+]/g, ' '); // replace +'s with spaces

                    jQuery.each(q.split(/[&;]/), function () {
                        var key = decodeURIComponent(this.split('=')[0] || "");
                        var val = decodeURIComponent(this.split('=')[1] || "");

                        if (!key) return;

                        //TODO parseInt('10000000000618121', 10) = 10000000000618120  妈蛋的。。。*_*
                        /*
                        if ($numbers) {
                            if (/^[+-]?[0-9]+\.[0-9]*$/.test(val)) // simple float regex
                                val = parseFloat(val);
                            else if (/^[+-]?[0-9]+$/.test(val)) // simple int regex
                                val = parseInt(val, 10);
                        }
                        */

                        val = (!val && val !== 0) ? true : val;

                        if (val !== false && val !== true && typeof val != 'number')
                            val = val;

                        self.SET(key, val);
                    });
                });
            }
            return self;
        };

        queryObject.prototype = {
            queryObject: true,
            spaces: false,
            has: function (key, type) {
                var value = this.get(key);
                return is(value, type);
            },
            GET: function (key) {
                if (!is(key)) return this.keys;
                var parsed = parse(key), base = parsed[0], tokens = parsed[1];
                var target = this.keys[base];
                while (target != null && tokens.length != 0) {
                    target = target[tokens.shift()];
                }
                return typeof target == 'number' ? target : target || "";
            },
            get: function (key) {
                var target = this.GET(key);
                if (is(target, Object))
                    return jQuery.extend(true, {}, target);
                else if (is(target, Array))
                    return target.slice(0);
                return target;
            },
            SET: function (key, val) {
                var value = !is(val) ? null : val;
                var parsed = parse(key), base = parsed[0], tokens = parsed[1];
                var target = this.keys[base];
                this.keys[base] = set(target, tokens.slice(0), value);
                return this;
            },
            set: function (key, val) {
                return this.copy().SET(key, val);
            },
            REMOVE: function (key) {
                return this.SET(key, null).COMPACT();
            },
            remove: function (key) {
                return this.copy().REMOVE(key);
            },
            EMPTY: function () {
                var self = this;
                jQuery.each(self.keys, function (key, value) {
                    delete self.keys[key];
                });
                return self;
            },
            load: function (url) {
                var hash = url.replace(/^.*?[#](.+?)(?:\?.+)?$/, "$1");
                var search = url.replace(/^.*?[?](.+?)(?:#.+)?$/, "$1");
                return new queryObject(url.length == search.length ? '' : search, url.length == hash.length ? '' : hash);
            },
            empty: function () {
                return this.copy().EMPTY();
            },
            copy: function () {
                return new queryObject(this);
            },
            COMPACT: function () {
                function build(orig) {
                    var obj = typeof orig == "object" ? is(orig, Array) ? [] : {} : orig;
                    if (typeof orig == 'object') {
                        function add(o, key, value) {
                            if (is(o, Array))
                                o.push(value);
                            else
                                o[key] = value;
                        }

                        jQuery.each(orig, function (key, value) {
                            if (!is(value)) return true;
                            add(obj, key, build(value));
                        });
                    }
                    return obj;
                }

                this.keys = build(this.keys);
                return this;
            },
            compact: function () {
                return this.copy().COMPACT();
            },
            toString: function () {
                var i = 0, queryString = [], chunks = [], self = this;
                var encode = function (str) {
                    str = str + "";
                    if ($spaces) str = str.replace(/ /g, "+");
                    return encodeURIComponent(str);
                };
                var addFields = function (arr, key, value) {
                    if (!is(value) || value === false) return;
                    var o = [encode(key)];
                    if (value !== true) {
                        o.push("=");
                        o.push(encode(value));
                    }
                    arr.push(o.join(""));
                };
                var build = function (obj, base) {
                    var newKey = function (key) {
                        return !base || base == "" ? [key].join("") : [base, "[", key, "]"].join("");
                    };
                    jQuery.each(obj, function (key, value) {
                        if (typeof value == 'object')
                            build(value, newKey(key));
                        else
                            addFields(chunks, newKey(key), value);
                    });
                };

                build(this.keys);

                if (chunks.length > 0) queryString.push($hash);
                queryString.push(chunks.join($separator));

                return queryString.join("");
            }
        };
        return new queryObject(location.search, location.hash);
    };
}(jQuery.query || {});


/*=====================================================================================
 $.popBox.show({
 title:'测试',//title名称，默认是提示
 html:'asdfaf',//弹窗内容，可以是string,节点对象
 hasBtn:true,//是否有提交按钮，默认有
 closeKey:'',//关闭快捷键keyCode
 submitKey:''//提交快捷键keyCode
 closeFn:function(){//关闭弹窗的操作，return false弹窗不关闭 this == popBox 手动关闭this.close()
 alert('关闭');
 },
 submitFn:function(){//提交的操作，return false弹窗不关闭 this == popBox 手动关闭this.close()
 alert('提交')
 }
 });
 */
(function ($, win) {
    var win = win,
        d = win.document,
        body = d.body,
        $ = $,
        $win = $(win),
        $d = $(d),
        $body = $('body');
    var shadowTpl = $('<div id="popShadow" class="pop_shadow"></div>'),
        popMainTpl = '<div id="popMain" class="pop_main">' +
            '<p id="popTitle" class="pop_title"><b></b><i id="popClose" class="icon icon-remove"></i></p>' +
            '<div id="popContent" class="pop_content"></div>' +
            '</div>';
    btnTpl = '<p class="pop_btn"><button id="popCancel" type="button">取消</button><button id="popSubmit" type="button">确定</button></p>';
    var keyCodeMap = window.KEYCODE;
    popMainTpl = $(popMainTpl);
    function POPBOX() {
        this.bind();
    }

    POPBOX.prototype = {
        bind: function () {
            var _this = this;
            _this.opts = {};
            $d.delegate('#popShadow,#popClose', 'click', function () {
                _this.close();
            });
            $d.delegate('#popCancel', 'click', function () {
                _this.close();
            });
            $d.delegate('#popSubmit', 'click', function () {
                _this.submit();
            });
        },
        init: function (opts, align) {
            var _this = this;
            this.opts = opts;

            this.shadow = $('#popShadow'),
                this.popMain = $('#popMain');
            if (!this.shadow.length) {
                this.shadow = shadowTpl.appendTo($('body'));
            } else {
                this.shadow.show();
            }
            if (!this.popMain.length) {
                this.popMain = popMainTpl.appendTo($('body'));
            } else {
                this.popMain.show();
            }
            if (opts.hasBtn) {
                if (!this.popMain.find('.pop_btn').length) {
                    $(btnTpl).appendTo(this.popMain);
                }
                if (this.opts.closeKey) {
                    $('#popCancel').html('取消(' + this.opts.closeKey + ')');
                }
                if (this.opts.submitKey) {
                    $('#popSubmit').html('确定(' + this.opts.submitKey + ')');
                }
            } else {
                this.popMain.find('.pop_btn').remove();
            }
            this.popCon = $('#popContent');
            if (align) {
                this.popCon.css('text-align', align);
            }
            $('#popTitle b').html(opts.title);
            this.popCon.html(opts.html);
            this.locate();
            if (_this.opts.submitKey || _this.opts.closeKey) {
                $('#popMain').attr('tabindex', '0');
            } else {
                $('#popMain').removeAttr('tabindex');
            }
            $('#popMain').off().on('keyup',function (e) {
                e.stopPropagation();
                if (_this.opts.submitKey && e.keyCode == keyCodeMap[_this.opts.submitKey.toLowerCase()]) {
                    _this.submit();
                }
                if (_this.opts.closeKey && e.keyCode == keyCodeMap[_this.opts.closeKey.toLowerCase()]) {
                    _this.close();
                }
            }).trigger('focus');
            if (_this.opts.eventFn) {
                _this.opts.eventFn.call(_this, $('#popMain'));
            }
        },
        show: function (option) {
            var opts = $.extend({
                title: '提示',
                html: '',
                hasBtn: true,
                closeKey: '',
                submitKey: '',
                beforeClose: function () {
                    return true
                },
                closeFn: function () {
                },
                beforeSubmit: function () {
                },
                submitFn: function () {
                }
            }, option);
            var _this = this;
            _this.init(opts);
        },
        confirm: function (option) {
            var opts = $.extend({
                title: '提示',
                hasBtn: true,
                html: '确定提交吗？',
                submitFn: function () {
                },
                cancelFn: function () {
                }
            }, option);
            this.init(opts, 'center');
        },
        submit: function () {
            var _this = this,
                opts = _this.opts,
                canClose = true;
            if (opts.submitFn) {
                canClose = opts.submitFn.call(_this);
            }
            if (canClose || canClose == undefined) {
                _this.hide();
            }
        },
        close: function () {
            var _this = this,
                opts = _this.opts,
                canClose = true;
            if (opts.closeFn || opts.cancelFn) {
                var fn = opts.closeFn || opts.cancelFn;
                canClose = fn.call(_this);
            }
            if (canClose || canClose == undefined) {
                _this.hide();
            }
        },
        hide: function () {
            this.popCon.html('').removeAttr('style');
            this.shadow.hide();
            this.popMain.removeAttr('style').hide();
        },
        locate: function () {
            var mainW = this.popMain.outerWidth(true),
                mainH = this.popMain.outerHeight(true),
                winH = $win.height(),
                winW = $win.width(),
                bodyH = $body.width();

            this.popMain.css({'margin-left': -(mainW / 2)});
            this.popCon.css({ 'max-height': winH - 290, 'overflow-y': 'auto'})
        }
    }
    POPBOX.prototype.constructor = POPBOX;
    var popBox = new POPBOX;
    win.popBox = popBox;
    $.popBox = popBox;
})(jQuery, window);

/*=====================================================================================
 *  $.when($.momoConfirm())
 .done(function () {})
 .fail(function () {});
 *
 */
!function ($) {
    $.momoConfirm = function (str, tit, closeKey, submitKey) {
        var deferred = $.Deferred();
        $.popBox.show({
            title: tit || '提示',
            html: str || '确认此操作？',
            hasBtn: true,
            closeFn: function () {//关闭弹窗的操作，return false弹窗不关闭 this == popBox 手动关闭this.close()
                deferred.reject();
            },
            submitFn: function () {//提交的操作，return false弹窗不关闭 this == popBox 手动关闭this.close()
                deferred.resolve();
            },
            closeKey: closeKey || '',
            submitKey: submitKey || ''

        })
        return deferred.promise();
    }
}($)

//=====================================================================================
// 加载css：$.loadCss(url,callback)
!(function () {
    function styleOnload(node, callback) {
        // for IE6-9 and Opera
        if (node.attachEvent) {
            node.attachEvent('onload', callback);
        }
        else {
            setTimeout(function () {
                poll(node, callback);
            }, 0); // for cache
        }
    }

    function poll(node, callback) {
        if (callback.isCalled) {
            return;
        }
        var isLoaded = false;
        if (/webkit/i.test(navigator.userAgent)) {//webkit
            if (node['sheet']) {
                isLoaded = true;
            }
        }
        // for Firefox
        else if (node['sheet']) {
            try {
                if (node['sheet'].cssRules) {
                    isLoaded = true;
                }
            } catch (ex) {
                // NS_ERROR_DOM_SECURITY_ERR
                if (ex.code === 1000) {
                    isLoaded = true;
                }
            }
        }
        if (isLoaded) {
            setTimeout(function () {
                callback();
            }, 1);
        }
        else {
            setTimeout(function () {
                poll(node, callback);
            }, 1);
        }
    }

    $.loadCss = function (url, callback) {
        var node = document.createElement("link");
        node.setAttribute("rel", "stylesheet");
        node.setAttribute("type", "text/css");
        node.setAttribute("href", url);
        document.body.appendChild(node);
        styleOnload(node, function () {
            callback();
        });
    }
})();


