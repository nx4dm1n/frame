<?php
/**
 * 设置
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 14:42
 */

namespace app\admin\controller;

class IndexController extends CommonController{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 后台管理-首页
     * @author zhang qing <490702087@qq.com>
     */
    public function index(){
        $userinfo  = session('user');
        $user_rule  = $userinfo['rule'] ? $userinfo['rule'] : array();
        if (!empty($user_rule)) {
            $user_rule=explode(',', $user_rule);
        }

        $ret=$this->ctx->SettingManager->getMenu(0, "");
        $allmenu=new \ArrayIterator($ret);
        $allmenu->rewind();
        $menuhtml='';
        while ($allmenu->valid()) {
            $menu=$allmenu->current();
            if (in_array($menu['id'], $user_rule) || $userinfo['is_root']) {
                if ($menu['pid']==0) {
                    $menuhtml.='<li class="nav-parent">
                            <a href=""><i class="'.$menu['icon'].'"></i> <span>'.$menu['name'].'</span></a>
                            <ul class="children">';
                }else{
                    $menuhtml.='<li><a href="'.WEBROOT_PATH.$menu['url'].C('URL_HTML_SUFFIX').'" class="ajax-link">'.$menu['name'].'</a></li>';
                }
            }

            $allmenu->next();
            $menu=$allmenu->current();
            if ($menu['pid']==0) {
                $menuhtml.='</ul></li>';
            }
        }
        $this->assign('site_name', C('SITE_NAME'));
        $this->assign('menuhtml', $menuhtml);

        $this->display();
    }
}