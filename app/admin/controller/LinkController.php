<?php
/**
 * 友情链接
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 14:42
 */

namespace app\admin\controller;

class LinkController extends CommonController{

    public function __construct()
    {
        parent::__construct();
        $this->breadcrumb[]=array(
            'text'  =>'友情链接'
        );

    }

    /**
     * 友情链接-首页
     * @author zhang qing <490702087@qq.com>
     */
    public function index(){
        $classid=I('classid');
        if ($classid==1) {
            $breadcrumb_text='文字链接';
        }elseif($classid==2){
            $breadcrumb_text='图片链接';
        }
        $this->breadcrumb[]=array(
            'text'  =>$breadcrumb_text
        );
        $this->assign('breadcrumb', $this->breadcrumb);
        $this->assign('classid', I('classid'));
        $this->display();
    }

    /**
     * 友情链接-列表
     * @author zhang qing <490702087@qq.com>
     */
    public function pagelist(){
        if (IS_POST) {
            $ret=$this->ctx->LinkManager->getList();
            $this->ajaxReturn($ret);
        }else{
            $this->assign('is_pass', I('get.is_pass'));
            $this->assign('classid', I('get.classid/d'));

            // 每个操作key不要随便修改，并且不同操作的key不要一样，前台有根据判断
            if (I('get.is_pass')) {
                $action_list=array(
                    0=>'操作', 1=>'推荐', 2=>'取消推荐', 3=>'加入回收站'
                );
            }else{
                $action_list=array(
                    0=>'操作', 1=>'推荐', 2=>'取消推荐', 4=>'彻底删除', 5=>'从回收站还原'
                );
            }
            $this->assign('action_list', $action_list);

            $this->display();
        }
    }

    /**
     * 友情链接-添加/修改
     * @author zhang qing <490702087@qq.com>
     */
    public function show(){
        $this->assign('upload_image_accept', 'image/'.str_replace('|', ', image/', C('UPLOAD_IMAGE_EXT')));
        $this->assign('upload_image_ext', '"'.str_replace('|', '","', C('UPLOAD_IMAGE_EXT')).'"');
        $this->assign('upload_image_maxsize', C('UPLOAD_IMAGE_MAXSIZE'));

        $map=$this->ctx->LinkModel->findByShow(I('id'));
        if ($map['pic']) {
            $map['pic']=$this->ctx->UploadModel->getPicRecord($map['pic']);
        }
        $this->assign('map', $map);

        $this->display();
    }

    /**
     * 友情链接-保存
     * @author zhang qing <490702087@qq.com>
     */
    public function save(){
        $ret=$this->ctx->LinkManager->save();
        $this->ajaxReturn($ret);
    }

    /**
     * 友情链接-设置是否显示
     * @author zhang qing <490702087@qq.com>
     */
    public function setPass(){
        $ret=$this->ctx->LinkManager->setPass();
        $this->ajaxReturn($ret);
    }

    public function setRecommend(){
        $ret=$this->ctx->LinkManager->setRecommend();
        $this->ajaxReturn($ret);
    }

    /**
     * 友情链接-删除记录
     * @author zhang qing <490702087@qq.com>
     */
    public function remove(){
        $ret=$this->ctx->LinkManager->remove();
        $this->ajaxReturn($ret);
    }
}