<?php
/**
 * 设置
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 14:42
 */

namespace app\admin\controller;

class UserController extends CommonController{
    public function __construct()
    {
        parent::__construct();
        $this->breadcrumb[]=array(
            'text'  =>'用户管理'
        );

    }

    /**
     * 用户管理-首页
     * @author zhang qing <490702087@qq.com>
     */
    public function index(){
        $this->assign('breadcrumb', $this->breadcrumb);
        $this->display();
    }

    /**
     * 用户管理-列表
     * @author zhang qing <490702087@qq.com>
     */
    public function pagelist(){
        if (IS_POST) {
            $ret=$this->ctx->UserManager->getList();
            $this->ajaxReturn($ret);
        }else{
            $this->display();
        }
    }

    /**
     * 用户管理-添加/修改
     * @author zhang qing <490702087@qq.com>
     */
    public function show(){
        $this->assign('upload_image_accept', 'image/'.str_replace('|', ', image/', C('UPLOAD_IMAGE_EXT')));
        $this->assign('upload_image_ext', '"'.str_replace('|', '","', C('UPLOAD_IMAGE_EXT')).'"');
        $this->assign('upload_image_maxsize', C('UPLOAD_IMAGE_MAXSIZE'));

        $map=$this->ctx->UserModel->findByShow(I('id'));

        $this->assign('map', $map);

        $this->display();
    }

    /**
     * 用户管理-保存
     * @author zhang qing <490702087@qq.com>
     */
    public function save(){
        $ret=$this->ctx->UserManager->save();
        $this->ajaxReturn($ret);
    }


    /**
     * 用户管理-删除记录
     * @author zhang qing <490702087@qq.com>
     */
    public function remove(){
        $ret=$this->ctx->UserManager->remove();
        $this->ajaxReturn($ret);
    }

    public function rule(){
        if (IS_POST) {
            $ret=$this->ctx->UserManager->saveRule();
            $this->ajaxReturn($ret);
        }else{
            $userid     =I('userid');
            $user_rule  =$this->ctx->UserModel->getFieldValue('rule', array('id'=>$userid));
            $user_rule  = $user_rule ? $user_rule : array();
            if (!empty($user_rule)) {
                $user_rule=explode(',', $user_rule);
            }

            $ret=$this->ctx->SettingManager->getMenu(0, "");
            $allmenu=new \ArrayIterator($ret);
            $allmenu->rewind();
            $menuhtml='';
            while ($allmenu->valid()) {
                $menu=$allmenu->current();
                $checked=in_array($menu['id'], $user_rule) ? 'checked' : '';
                if ($menu['pid']==0) {
                    $menuhtml.='<tr>
                                    <td width="8%">
                                            <label class="ckbox ckbox-primary ckbox-inline">
                                                <input name="rule[]" type="checkbox" '.$checked.' value="'.$menu['id'].'"> <span class="text-success">'.$menu['name'].'</span>
                                            </label></td><td>';
                }else{
                    $menuhtml.='<label class="ckbox ckbox-primary ckbox-inline">
                                <input name="rule[]" type="checkbox" '.$checked.'  value="'.$menu['id'].'"> <span>'.$menu['name'].'</span>
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;';
                }
                $allmenu->next();
                $menu=$allmenu->current();
                if ($menu['pid']==0) {
                    $menuhtml.='</td></tr>';
                }
            }
            $this->assign('menuhtml', $menuhtml);
            $this->assign('userid', $userid);

            $this->display();
        }
    }
}