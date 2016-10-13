<?php
/**
 * 广告系统
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 14:42
 */

namespace app\admin\controller;

class AdController extends CommonController{

    public function __construct()
    {
        parent::__construct();
        $this->breadcrumb[]=array(
            'text'  =>'广告系统'
        );

    }

    /**
     * 广告系统-首页
     * @author zhang qing <490702087@qq.com>
     */
    public function index(){
        $classid=I('classid');
        if ($classid==1) {
            $breadcrumb_text='首页幻灯广告';
        }elseif($classid==2){
            $breadcrumb_text='内页Banner';
        }
        $this->breadcrumb[]=array(
            'text'  =>$breadcrumb_text
        );
        $this->assign('breadcrumb', $this->breadcrumb);
        $this->assign('classid', I('classid'));
        $this->display();
    }

    /**
     * 广告系统-列表
     * @author zhang qing <490702087@qq.com>
     */
    public function pagelist(){
        if (IS_POST) {
            $ret=$this->ctx->AdManager->getList();
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
     * 广告系统-添加/修改
     * @author zhang qing <490702087@qq.com>
     */
    public function show(){
        $this->assign('upload_image_accept', 'image/'.str_replace('|', ', image/', C('UPLOAD_IMAGE_EXT')));
        $this->assign('upload_image_ext', '"'.str_replace('|', '","', C('UPLOAD_IMAGE_EXT')).'"');
        $this->assign('upload_image_maxsize', C('UPLOAD_IMAGE_MAXSIZE'));

        $map=$this->ctx->AdModel->findByShow(I('id'));
        if ($map['pic']) {
            $map['pic']=$this->ctx->UploadModel->getPicRecord($map['pic']);
        }
        $this->assign('map', $map);

        $this->display();
    }

    /**
     * 广告系统-保存
     * @author zhang qing <490702087@qq.com>
     */
    public function save(){
        $ret=$this->ctx->AdManager->save();
        $this->ajaxReturn($ret);
    }

    /**
     * 广告系统-设置是否显示
     * @author zhang qing <490702087@qq.com>
     */
    public function setPass(){
        $ret=$this->ctx->AdManager->setPass();
        $this->ajaxReturn($ret);
    }

    public function setRecommend(){
        $ret=$this->ctx->AdManager->setRecommend();
        $this->ajaxReturn($ret);
    }

    /**
     * 广告系统-删除记录
     * @author zhang qing <490702087@qq.com>
     */
    public function remove(){
        $ret=$this->ctx->AdManager->remove();
        $this->ajaxReturn($ret);
    }
}