<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 上午 11:18
 */

namespace app\admin\controller;

use core\lib\Controller;

class PublicController extends Controller{

    public function __construct()
    {
        parent::__construct();
    }


    /**
     * 用户登录
     * @author zhang qing <490702087@qq.com>
     */
    public function login(){
        if (is_null(session('user'))) {
            if (IS_POST) {
                $ret=$this->ctx->UserManager->userLogin();
                $this->ajaxReturn($ret);
            }else{
                $this->assign('site_name', C('SITE_NAME'));
                $this->display();
            }
        }else{
            header("Location: ".WEBROOT_PATH."admin/index/index".C('URL_HTML_SUFFIX'));
            exit;
        }
    }

    /**
     * 退出登录
     * @author zhang qing <490702087@qq.com>
     */
    public function loginOut(){
        session('user', null);
        header("Location: ".WEBROOT_PATH."admin/public/login".C('URL_HTML_SUFFIX'));
        exit;
    }

    /**
     * 找回密码
     * @author zhang qing <490702087@qq.com>
     */
    public function getPassword(){
        if (IS_POST) {
            $ret=$this->ctx->UserManager->getPassword();
            $this->ajaxReturn($ret);
        }else{
            $this->display();
        }
    }

    /**
     * 密码重置修改
     * @author zhang qing <490702087@qq.com>
     */
    public function resetPassword(){
        if (IS_POST) {
            $ret=$this->ctx->UserManager->resetPassword();
            $this->ajaxReturn($ret);
        }else{
            $ret=$this->ctx->UserManager->checkResetPasswordCode();
            if ($ret['ec']==200) {
                $userid     =I('get.userid');
                $username   =$this->ctx->UserModel->getUser('username', array('id'  =>$userid));
                $this->assign('userid', $userid);
                $this->assign('username', $username);
                $this->assign('code', I('get.code'));
                $this->display();
            }else{
                die($ret['em']);
            }
        }
    }
}