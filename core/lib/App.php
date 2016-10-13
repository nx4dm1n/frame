<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/9 0009 下午 15:34
 */

namespace core\lib;

class App{
    /**
     * 运行程序
     * @author zhang qing <490702087@qq.com>
     */
    public static function run(){
        // 初始化文件存储方式
        Storage::connect(STORAGE_TYPE);

//        $runtimefile  = RUNTIME_PATH.APP_MODE.'~runtime.php';
//        if(!APP_DEBUG && Storage::has($runtimefile)){
//            Storage::load($runtimefile);
//        }else{
//            if(Storage::has($runtimefile)){
//                Storage::unlink($runtimefile);
//            }
//            $content =  '';

            // 读取应用模式
            $mode   =   include MODE_PATH.APP_MODE.'.php';
            // 加载核心文件
            foreach ($mode['core'] as $file){
                if(is_file($file)) {
                    include $file;
//                    if(!APP_DEBUG){
//                        $content   .= compile($file);
//                    }
                }
            }

            // 加载应用模式配置文件
            foreach ($mode['config'] as $key=>$file){
                if(is_file($file)) {
                    is_numeric($key)?C(load_config($file)):C($key,load_config($file));
                }
            }

//            if(!APP_DEBUG){
//                //$content  .=  "\nnamespace { Think\\Think::addMap(".var_export(self::$_map,true).");";
//                //$content  .=  "\nL(".var_export(L(),true).");\nC(".var_export(C(),true).');Think\Hook::import('.var_export(Hook::get(),true).');}';
//                Storage::put($runtimefile,strip_whitespace('<?php '.$content));
//            }
//        }


        // 设置系统时区
        date_default_timezone_set(C('DEFAULT_TIMEZONE'));

        // 定义当前请求的系统常量
        define('NOW_TIME',      $_SERVER['REQUEST_TIME']);
        define('REQUEST_METHOD',$_SERVER['REQUEST_METHOD']);
        define('IS_GET',        REQUEST_METHOD =='GET'      ? true : false);
        define('IS_POST',       REQUEST_METHOD =='POST'     ? true : false);
        define('IS_PUT',        REQUEST_METHOD =='PUT'      ? true : false);
        define('IS_DELETE',     REQUEST_METHOD =='DELETE'   ? true : false);

        define('IS_CGI',(0 === strpos(PHP_SAPI,'cgi') || false !== strpos(PHP_SAPI,'fcgi')) ? 1 : 0 );
        define('IS_WIN',strstr(PHP_OS, 'WIN') ? 1 : 0 );
        define('IS_CLI',PHP_SAPI=='cli'? 1   :   0);


        // Session初始化
        if(!IS_CLI){
            session(C('SESSION_OPTIONS'));
        }

        // URL调度，分解URL
        Dispatcher::dispatch();


        // 合并当前模块下的配置文件
        $module_config=APP_PATH.MODULE.DIRECTORY_SEPARATOR.'config'.DIRECTORY_SEPARATOR.'config.php';
        if (is_file($module_config)) {
            C(load_config($module_config));
        }

        $ctrlClass  =   str_replace('/', '\\', APP_PATH.MODULE."\\".C('DEFAULT_C_LAYER')."\\".CONTROLLER."Controller");
        $ctrlAction =   ACTION;

        $ctrl=new $ctrlClass();
        $ctrl->$ctrlAction();

    }
}