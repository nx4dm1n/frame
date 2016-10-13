<?php
/**
 * 控制器基类
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 上午 11:41
 */

namespace core\lib;

class Controller{
    protected $ctx;
    protected $assigns=array();     // 保存所有赋值给模板的变量键值

    protected function __construct()
    {
        $this->ctx=\Ctx::instance();
        $this->assign('static_url', STATIC_URL);
        $this->assign('webroot_path', WEBROOT_PATH);
    }

    /**
     * Action跳转(URL重定向） 支持指定模块和延时跳转
     * @access protected
     * @param string $url 跳转的URL表达式
     * @param array $params 其它URL参数
     * @param integer $delay 延时跳转的时间 单位为秒
     * @param string $msg 跳转提示信息
     * @return void
     */
    protected function redirect($url,$params=array(),$delay=0,$msg='') {
        $url    =   U($url,$params);
        redirect($url,$delay,$msg);
    }

    /**
     * 给模板赋值
     *
     * @param $name         变量名
     * @param $value        变量值
     *
     * @author zhang qing <490702087@qq.com>
     */
    protected function assign($name, $value){
        $this->assigns[$name]=$value;
    }

    /**
     * 显示模板
     *
     * @param null  $file       模板文件名，不需指定模板文件扩展名，在配置文件里已指定
     * @param array $option
     *
     * @author zhang qing <490702087@qq.com>
     */
    protected function display($file=null, $option=array()){
        $loader=new \Twig_Loader_Filesystem(TPL_FOLDER);
        if ($file===null) {
            $file=TPL_FILE;
        }else{
            $file.=C('TMPL_TEMPLATE_SUFFIX');
        }
        $option['charset']  =C('TMPL_TEMPLATE_CHARSET');
        $option['cache']    =C('TMPL_TEMPLATE_CACHE') ? CACHE_PATH : false;
        if (APP_DEBUG===true) {
            $option['debug']=true;
        }
        $twig=new \Twig_Environment($loader, $option);
        echo $twig->render($file, $this->assigns);
    }

    /**
     * Ajax方式返回数据到客户端
     * @access protected
     * @param mixed $data 要返回的数据
     * @param String $type AJAX返回数据格式
     * @param int $json_option 传递给json_encode的option参数
     * @return void
     */
    protected function ajaxReturn($data,$type='',$json_option=0) {
        if(empty($type)) $type  =   C('DEFAULT_AJAX_RETURN');
        switch (strtoupper($type)){
            case 'JSON' :
                // 返回JSON数据格式到客户端 包含状态信息
                header('Content-Type:application/json; charset=utf-8');
                exit(json_encode($data,$json_option));
            case 'XML'  :
                // 返回xml格式数据
                header('Content-Type:text/xml; charset=utf-8');
                exit(xml_encode($data));
            case 'JSONP':
                // 返回JSON数据格式到客户端 包含状态信息
                header('Content-Type:application/json; charset=utf-8');
                $handler  =   isset($_GET[C('VAR_JSONP_HANDLER')]) ? $_GET[C('VAR_JSONP_HANDLER')] : C('DEFAULT_JSONP_HANDLER');
                exit($handler.'('.json_encode($data,$json_option).');');
            case 'EVAL' :
                // 返回可执行的js脚本
                header('Content-Type:text/html; charset=utf-8');
                exit($data);
            default     :
                // 用于扩展其他返回格式数据
        }
    }
}