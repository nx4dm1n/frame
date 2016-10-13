<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/9 0009 下午 15:17
 */
namespace core;

use core\lib\App;

// 系统常量定义
defined('ROOT_PATH')             or define('ROOT_PATH',             dirname($_SERVER['SCRIPT_FILENAME']).DIRECTORY_SEPARATOR);                      // 项目根目录
defined('CORE_PATH')             or define('CORE_PATH',             ROOT_PATH.'core'.DIRECTORY_SEPARATOR);                                          // 核心文件所在路径
defined('APP_DEBUG')             or define('APP_DEBUG',             false);                                                                         // 是否开启调试模式
defined('RUNTIME_PATH')          or define('RUNTIME_PATH',          ROOT_PATH.'runtime'.DIRECTORY_SEPARATOR);                                       // 运行时目录
defined('LOG_PATH')              or define('LOG_PATH',              RUNTIME_PATH.'logs'.DIRECTORY_SEPARATOR);                                       // 应用日志目录
defined('TEMP_PATH')             or define('TEMP_PATH',             RUNTIME_PATH.'temp'.DIRECTORY_SEPARATOR);                                       // 应用缓存目录
defined('DATA_PATH')             or define('DATA_PATH',             RUNTIME_PATH.'data'.DIRECTORY_SEPARATOR);                                       // 应用数据目录
defined('CACHE_PATH')            or define('CACHE_PATH',            RUNTIME_PATH.'cache'.DIRECTORY_SEPARATOR);                                      // 应用模板缓存目录
defined('STATIC_URL')            or define('STATIC_URL',            rtrim($_SERVER['PHP_SELF'], 'index.php').'static/');                            // 静态资源根目录
defined('WEBROOT_PATH')          or define('WEBROOT_PATH',          rtrim($_SERVER['HTTP_ORIGIN'].$_SERVER['DOCUMENT_URI'], 'index.php'));          // 网站根URL
defined('MODULE_COMMON_PATH')    or define('MODULE_COMMON_PATH',    ROOT_PATH.'app'.DIRECTORY_SEPARATOR.'common'.DIRECTORY_SEPARATOR);              // 所有模块公共文件
defined('MODE_PATH')             or define('MODE_PATH',             CORE_PATH.'mode'.DIRECTORY_SEPARATOR);                                          // 应用模式目录
defined('CONF_PARSE')            or define('CONF_PARSE',            '');                                                                            // 配置文件解析方法

/**
 * 如果开启debug则报告并显示所有错误信息到页面上
 */
if (true===APP_DEBUG) {
    ini_set('error_reporting', E_ALL);
    ini_set('display_errors', On);
}else{
    ini_set('error_reporting', E_ALL);
    ini_set('display_errors', Off);
}

if(function_exists('saeAutoLoader')){// 自动识别SAE环境
    defined('APP_MODE')     or define('APP_MODE',      'sae');
    defined('STORAGE_TYPE') or define('STORAGE_TYPE',  'Sae');
}else{
    defined('APP_MODE')     or define('APP_MODE',       'common'); // 应用模式 默认为普通模式
    defined('STORAGE_TYPE') or define('STORAGE_TYPE',   'File'); // 存储类型 默认为File
}


// 应用初始化
App::run();
