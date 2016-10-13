<?php
/**
 * 新闻
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 14:42
 */

namespace app\admin\controller;

class NewsCategoryController extends CommonController{
    public function __construct()
    {
        parent::__construct();
        $this->breadcrumb[]=array(
            'text'  =>'新闻系统'
        );
    }

    /**
     * 栏目管理-首页
     * @author zhang qing <490702087@qq.com>
     */
    public function index(){
        $this->breadcrumb[]=array(
            'text'  =>'栏目管理'
        );
        $this->assign('breadcrumb', $this->breadcrumb);
        $this->display();
    }

    public function pagelist(){
        $ret=$this->ctx->NewsCategoryManager->getCategory();
        $this->assign('categorys', $ret);
        $this->display();
    }

    /**
     * 栏目管理-添加
     * @author zhang qing <490702087@qq.com>
     */
    public function show(){
        $this->assign('upload_image_accept', 'image/'.str_replace('|', ', image/', C('UPLOAD_IMAGE_EXT')));
        $this->assign('upload_image_ext', '"'.str_replace('|', '","', C('UPLOAD_IMAGE_EXT')).'"');
        $this->assign('upload_image_maxsize', C('UPLOAD_IMAGE_MAXSIZE'));

        $id =I('id');
        $pid=I('pid');
        $map=array(
            'pid'           =>'',
            'name'          =>'',
            'caption'       =>'',
            'keywords'      =>'',
            'description'   =>'',
            'icon'          =>'',
            'pic'           =>'',
        );

        if (!empty($id)) {
            $ret=$this->ctx->NewsCategoryModel->find($id);
            if (false!==$ret) {
                $map=$ret;
            }
        }else{
            if (!empty($pid)) {
                $map['pid']=$pid;
            }
        }

        if ($map['pic']) {
            $map['pic']=$this->ctx->UploadModel->getPicRecord($map['pic']);
        }

        $this->assign('map', $map);

        $ret=$this->ctx->NewsCategoryManager->getCategory();
        $this->assign('categorys', $ret);
        $this->display();
    }

    /**
     * 栏目管理-保存
     * @author zhang qing <490702087@qq.com>
     */
    public function save(){
        $ret=$this->ctx->NewsCategoryManager->save();
        $this->ajaxReturn($ret);
    }

    /**
     * 栏目管理-删除
     * @author zhang qing <490702087@qq.com>
     */
    public function remove(){
        $ret=$this->ctx->NewsCategoryManager->remove();
        $this->ajaxReturn($ret);
    }
}