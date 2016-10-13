<?php
/**
 * 系统惯例配置
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/10 0010 上午 11:05
 */

return array(
    /* 默认设定 */
    "DEFAULT_MODULE"        =>'home',          // 默认模块
    'DEFAULT_C_LAYER'       =>'controller',     // 默认的控制器层名称
    'DEFAULT_M_LAYER'       =>'model',          // 默认的模型层名称
    'DEFAULT_V_LAYER'       =>'view',           // 默认的视图层名称
    "DEFAULT_CONTROLLER"    =>'index',          // 默认控制器
    "DEFAULT_ACTION"        =>'index',          // 默认方法

    'DEFAULT_TIMEZONE'      =>'PRC',	        // 默认时区
    'DEFAULT_AJAX_RETURN'   => 'JSON',         // 默认AJAX 数据返回格式,可选JSON XML ...
    'DEFAULT_JSONP_HANDLER' => 'jsonpReturn', // 默认JSONP格式返回的处理方法
    'VAR_JSONP_HANDLER'     => 'callback',
    'DEFAULT_FILTER'        => 'htmlspecialchars', // 默认参数过滤方法 用于I函数...
    'VAR_AUTO_STRING'		=> false,	// 输入变量是否自动强制转换为字符串 如果开启则数组变量需要手动传入变量修饰符获取变量

    /* 模板引擎设置 */
    'TMPL_TEMPLATE_SUFFIX'  =>  '.twig',        // 默认模板文件后缀
    'TMPL_TEMPLATE_CACHE'   =>  false,        // 模板缓存
    'TMPL_TEMPLATE_CHARSET' =>  'UTF-8',        // 默认输出编码

    /* URL设置 */
    'VAR_PATHINFO'          =>  's',            // 兼容模式PATHINFO获取变量例如 ?s=/module/action/id/1
    'URL_HTML_SUFFIX'       =>'.html',          // URL伪静态后缀设置

    /* 数据库设置 */
    'DB_TYPE'               =>  'mysql',     // 数据库类型
    'DB_HOST'               =>  'localhost', // 服务器地址
    'DB_NAME'               =>  'mmo',          // 数据库名
    'DB_USER'               =>  'root',      // 用户名
    'DB_PWD'                =>  'pw2020',          // 密码
    'DB_PORT'               =>  '3306',        // 端口
    'DB_PREFIX'             =>  'gm_',    // 数据库表前缀
    'DB_CHARSET'            =>  'utf8',      // 数据库编码默认采用utf8

    /* SESSION设置 */
    'SESSION_AUTO_START'    =>  true,    // 是否自动开启Session
    'SESSION_OPTIONS'       =>  array(), // session 配置数组 支持type name id path expire domain 等参数
    'SESSION_TYPE'          =>  '', // session hander类型 默认无需设置 除非扩展了session hander驱动
    'SESSION_PREFIX'        =>  '', // session 前缀
    //'VAR_SESSION_ID'      =>  'session_id',     //sessionID的提交变量

    /* Cookie设置 */
    'COOKIE_EXPIRE'         =>  0,       // Cookie有效期
    'COOKIE_DOMAIN'         =>  '',      // Cookie有效域名
    'COOKIE_PATH'           =>  '/',     // Cookie路径
    'COOKIE_PREFIX'         =>  '',      // Cookie前缀 避免冲突
    'COOKIE_SECURE'         =>  false,   // Cookie安全传输
    'COOKIE_HTTPONLY'       =>  '',      // Cookie httponly设置

    /* 上传配置 */
    "UPLOAD_IMAGE_EXT"      =>'bmp|png|jpeg|gif|jpg',          // 允许上传的图片格式
    "UPLOAD_IMAGE_MAXSIZE"  =>1024,          // 限制文件大小，单位KB
    "UPLOAD_IMAGE_FOLDER"   =>'upload/image'.DIRECTORY_SEPARATOR,          // 图片文件上传主目录

    "UPLOAD_FILE_EXT"       =>'png|jpg|jpeg|gif|bmp|flv|swf|mkv|avi|rm|rmvb|mpeg|mpg|ogg|ogv|mov|wmv|mp4|webm|mp3|wav|mid|rar|zip|tar|gz|7z|bz2|cab|iso|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|md|xml',          // 允许上传文件格式
    "UPLOAD_FILE_MAXSIZE"   =>5120,          // 限制文件大小，单位KB
    "UPLOAD_FILE_FOLDER"    =>'upload/file'.DIRECTORY_SEPARATOR,          // 文件上传主目录

    "UPLOAD_VIDEO_EXT"      =>'flv|swf|mkv|avi|rm|rmvb|mpeg|mpg|ogg|ogv|mov|wmv|mp4|webm|mp3|wav|mid',          // 允许上传视频格式
    "UPLOAD_VIDEO_MAXSIZE"  =>5120,          // 限制文件大小，单位KB
    "UPLOAD_VIDEO_FOLDER"   =>'upload/video'.DIRECTORY_SEPARATOR,          // 视频上传主目录

    "UPLOAD_SCRAWL_EXT"     =>'png',          // ueditor：涂鸦图片保存格式
    "UPLOAD_SCRAWL_MAXSIZE" =>1024,          // ueditor：限制文件大小，单位KB
    "UPLOAD_SCRAWL_FOLDER"  =>'upload/scrawl'.DIRECTORY_SEPARATOR,          // ueditor：涂鸦图片文件上传主目录

    "UPLOAD_SNAPSCREEN_EXT"     =>'jpg',          // ueditor：截图保存格式
    "UPLOAD_SNAPSCREEN_MAXSIZE" =>1024,          // ueditor：限制文件大小，单位KB
    "UPLOAD_SNAPSCREEN_FOLDER"  =>'upload/snapscreen'.DIRECTORY_SEPARATOR,          // ueditor：截图上传主目录

    /* 站点设置 */
    'SITE_NAME'             => 'MMO GM管理',              // 站点名称
    'SITE_TITLE'            => 'MMO GM管理',              // 站点标题
    'SITE_KEYWORDS'         => 'gm',                      // 站点关键词
    'SITE_DESCRIPTION'      => 'gm运营管理工具',           // 站点描述

    /* 邮箱服务器设置 */
    'MAIL_SMTP_HOST'        => '',              // SMTP服务器
    'MAIL_SMTP_PORT'        => '',              // SMTP服务器端口
    'MAIL_SMTP_USERNAME'    => '',              // SMTP登录用户名
    'MAIL_SMTP_PASSWORD'    => '',              // SMTP登录密码
    'MAIL_SMTP_SMTPSECURE'  => '',              // 安全模式，可选值：'', 'ssl' or 'tls'

    /* 数据缓存设置 */
    'DATA_CACHE_TIME'       =>  0,      // 数据缓存有效期 0表示永久缓存
    'DATA_CACHE_COMPRESS'   =>  false,   // 数据缓存是否压缩缓存
    'DATA_CACHE_CHECK'      =>  false,   // 数据缓存是否校验缓存
    'DATA_CACHE_PREFIX'     =>  'gm_',     // 缓存前缀
    'DATA_CACHE_TYPE'       =>  'Memcache',  // 数据缓存类型,支持:File|Db|Apc|Memcache|Shmop|Sqlite|Xcache|Apachenote|Eaccelerator
    'DATA_CACHE_PATH'       =>  RUNTIME_PATH.'temp',// 缓存路径设置 (仅对File方式缓存有效)
    'DATA_CACHE_KEY'        =>  '',	// 缓存文件KEY (仅对File方式缓存有效)
    'DATA_CACHE_SUBDIR'     =>  false,    // 使用子目录缓存 (自动根据缓存标识的哈希创建子目录)
    'DATA_PATH_LEVEL'       =>  1,        // 子目录缓存级别
);