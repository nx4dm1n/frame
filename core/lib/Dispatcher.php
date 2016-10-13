<?php
/**
 * 分解url中模块、控制器、方法及参数
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/10 0010 上午 11:38
 */

namespace core\lib;

class Dispatcher {

    /**
     * URL映射到控制器
     * @access public
     * @return void
     */
    static public function dispatch() {
        $module     = C('DEFAULT_MODULE');      // 默认模块
        $controller = C('DEFAULT_CONTROLLER');  // 默认控制器
        $action     = C('DEFAULT_ACTION');      // 默认方法
        /**
         * 分解URL
         * 1、去除url中的index.php，需要在nginx里做url rewrite
         * 2、根据url中的“/”进行分解。/控制器名称/方法名称[/参数名称/参数值]....
         * domain.com/index.php/aaa/111/bbb/222
         * domain.com/aaa/111/bbb/222
         */
        $var_pathinfo=C('VAR_PATHINFO');
        if (isset($_REQUEST[$var_pathinfo])) {
            // 删除URL中最前面的/
            $_REQUEST[$var_pathinfo]=ltrim($_REQUEST[$var_pathinfo], '/');
            // 删除URL中.html后缀
            $_REQUEST[$var_pathinfo]=str_replace(C('URL_HTML_SUFFIX'), '', $_REQUEST[$var_pathinfo]);

            $patharr=explode('/', $_REQUEST[$var_pathinfo]);
            $patharr=array_filter($patharr, function ($val){
                if (empty($val)) {
                    return false;
                }else{
                    return $val;
                }
            });
            switch (count($patharr)) {
                case 1 :
                    $module     = $patharr[0];
                    break;
                case 2 :
                    $controller = $patharr[0];
                    $action     = $patharr[1];
                    break;
                case 3 :
                    $module     = $patharr[0];
                    $controller = $patharr[1];
                    $action     = $patharr[2];
                    break;
                default :
                    foreach ($patharr as $key=>$value) {
                        if ($key===0) {
                            $module=$value;
                        }
                        if ($key===1) {
                            $controller=$value;
                        }
                        if ($key===2) {
                            $action=$value;
                        }
                        if ($key % 2!==0 && $key!==0 && $key>=3) {
                            $tv=isset($patharr[$key+1]) ? $patharr[$key+1] : null;
                            $_GET[$value]=$tv;
                        }
                    }
            }
            unset($_REQUEST[$var_pathinfo]);
        }

        // 规范化文件名：小写转换，驼峰转换，下面程序顺序保持当前就行，因为TPL_FILE与TPL_FOLDER需要在转换前就获取到物理路径
        $module     = strtolower($module);

        define('TPL_FOLDER', ROOT_PATH.'app/'.$module.DIRECTORY_SEPARATOR.C('DEFAULT_V_LAYER').DIRECTORY_SEPARATOR.strtolower($controller).DIRECTORY_SEPARATOR);     // "/app/admin/view/public"
        define('TPL_FILE', strtolower($action).C('TMPL_TEMPLATE_SUFFIX'));     // "login.twig"


        $controller = str_replace(' ', '', ucwords(str_replace('_', ' ', $controller)));
        $action     = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $action))));

        // 定义常量
        define('MODULE', $module);
        define('CONTROLLER', $controller);
        define('ACTION', $action);
    }
}