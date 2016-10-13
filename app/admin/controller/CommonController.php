<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 13:14
 */

namespace app\admin\controller;

use core\lib\Controller;

class CommonController extends Controller{
    protected $breadcrumb=array();

    protected function __construct()
    {
        parent::__construct();

        if (is_null(session('user'))) {
            header("Location: ".WEBROOT_PATH."admin/public/login".C('URL_HTML_SUFFIX'));
            exit;
        }

        $userinfo=session('user');

        if ($userinfo['pic']) {
            $ret=$this->ctx->UploadModel->getPicRecord($userinfo['pic']);
            $userinfo['pic']=$ret['url'];
        }

        $this->assign('user', $userinfo);
        $this->breadcrumb[]=array(
            'url'   =>'index.html',
            'icon'  =>'fa fa-home mr5',
            'text'  =>'首页'
        );
    }
}