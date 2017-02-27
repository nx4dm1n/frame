<?php
/**
 * 设置
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 14:42
 */

namespace app\admin\controller;

class SettingController extends CommonController{
    public function __construct()
    {
        parent::__construct();
        $this->breadcrumb[]=array(
            'text'  =>'系统设置'
        );

    }

    /**
     * 栏目管理-首页
     * @author zhang qing <490702087@qq.com>
     */
    public function menuIndex(){
        $this->breadcrumb[]=array(
            'text'  =>'栏目管理'
        );
        $this->assign('breadcrumb', $this->breadcrumb);

        $this->display();
    }

    /**
     * 栏目管理-列表
     * @author zhang qing <490702087@qq.com>
     */
    public function menuList(){
        $ret=$this->ctx->SettingManager->getMenu();
        $this->assign('allmenu', $ret);
        $this->display();
    }

    /**
     * 栏目管理-添加
     * @author zhang qing <490702087@qq.com>
     */
    public function menuShow(){
        $id =I('id');
        $pid=I('pid');
        if (!empty($id)) {
            $ret=$this->ctx->MenuModel->findMenu($id);
            if (false!==$ret) {
                $this->assign('id', $id);
                $this->assign('name', $ret['name']);
                $this->assign('pid', $ret['pid']);
                $this->assign('url', $ret['url']);
                $this->assign('icon', $ret['icon']);
                $this->assign('sorting', $ret['sorting']);
                $this->assign('isvalid', $ret['isvalid']);
            }
        }else{
            if (!empty($pid)) {
                $this->assign('pid', $pid);
            }
            $this->assign('sorting', 99999);
            $this->assign('isvalid', 1);
        }

        $ret=$this->ctx->SettingManager->getMenu();
        $this->assign('allmenu', $ret);
        $this->display();
    }

    /**
     * 栏目管理-保存
     * @author zhang qing <490702087@qq.com>
     */
    public function menuSave(){
        $ret=$this->ctx->SettingManager->saveMenu();
        $this->ajaxReturn($ret);
    }

    /**
     * 栏目管理-删除
     * @author zhang qing <490702087@qq.com>
     */
    public function menuDel(){
        $ret=$this->ctx->SettingManager->delMenu();
        $this->ajaxReturn($ret);
    }

    /**
     * 常规设置-首页
     * @author zhang qing <490702087@qq.com>
     */
    public function configIndex(){
        $this->breadcrumb[]=array(
            'text'  =>'常规设置'
        );
        $this->assign('breadcrumb', $this->breadcrumb);
        $this->assign('config', C());
        $this->display();
    }

    public function configSave(){
        $ret=$this->ctx->SettingManager->saveConfig();
        $this->ajaxReturn($ret);
    }
}