<?php
/**
 * 设置
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 14:42
 */

namespace app\admin\controller;

class VoteController extends CommonController{
    public function __construct()
    {
        parent::__construct();
        $this->breadcrumb[]=array(
            'text'  =>'投票系统'
        );

    }

    /**
     * 文章管理-首页
     * @author zhang qing <490702087@qq.com>
     */
    public function index(){
        $this->breadcrumb[]=array(
            'text'  =>'投票选项'
        );
        $this->assign('breadcrumb', $this->breadcrumb);
        $this->display();
    }

    /**
     * 文章管理-列表
     * @author zhang qing <490702087@qq.com>
     */
    public function pagelist(){
        if (IS_POST) {
            $ret=$this->ctx->VoteManager->getList();
            $this->ajaxReturn($ret);
        }else{

            $this->assign('is_pass', I('get.is_pass'));

            // 每个操作key不要随便修改，并且不同操作的key不要一样，前台有根据判断
            if (I('get.is_pass')) {
                $action_list=array(
                    0=>'操作', 3=>'加入回收站'
                );
            }else{
                $action_list=array(
                    0=>'操作', 4=>'彻底删除', 5=>'从回收站还原'
                );
            }
            $this->assign('action_list', $action_list);

            $this->display();
        }
    }

    /**
     * 栏目管理-添加/修改
     * @author zhang qing <490702087@qq.com>
     */
    public function show(){

        $map=$this->ctx->VoteModel->findByShow(I('id'));

        $this->assign('map', $map);


        $this->display();
    }

    /**
     * 文章-保存
     * @author zhang qing <490702087@qq.com>
     */
    public function save(){
        $ret=$this->ctx->VoteManager->save();
        $this->ajaxReturn($ret);
    }

    /**
     * 文章管理-设置是否显示
     * @author zhang qing <490702087@qq.com>
     */
    public function setPass(){
        $ret=$this->ctx->VoteManager->setPass();
        $this->ajaxReturn($ret);
    }

    public function setRecommend(){
        $ret=$this->ctx->VoteManager->setRecommend();
        $this->ajaxReturn($ret);
    }

    /**
     * 文章管理-删除记录
     * @author zhang qing <490702087@qq.com>
     */
    public function remove(){
        $ret=$this->ctx->VoteManager->remove();
        $this->ajaxReturn($ret);
    }

    /**
     * 显示统计图表
     * @author zhang.qing <zhang.qing@immomo.com>
     */
    public function showChart(){
        $this->breadcrumb[]=array(
            'text'  =>'统计图表'
        );
        $this->assign('breadcrumb', $this->breadcrumb);
        $this->display();
    }
}