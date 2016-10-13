<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/14 0014 下午 13:52
 */

namespace app\admin\manager;

use core\lib\Manager;

class SettingManager extends Manager{
    /**
     * 用户登录
     * @author zhang qing <490702087@qq.com>
     */
    public function saveMenu(){
        $id         =I('id');
        $pid        =I('pid');
        $name       =I('name');
        $url        =I('url');
        $icon       =I('icon');

        $ret=$this->ctx->MenuModel->saveMenu($id, $pid, $name, $url, $icon);

        return $ret;
    }

    /**
     * 获取栏目
     *
     * @param int    $pid               父ID
     * @param int    $spac              重复多个次 $delimiter
     * @param string $delimiter         用什么符号表示层次关系
     * @param boolean $root_delimiter    根结果是否添加 $delimiter 来表示层次关系
     * @param array  $result            结果保存
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function getMenu($pid=0, $delimiter='──',$spac=0,  $root_delimiter=false, &$result=array()){
        $spac++;

        $ret=$this->ctx->MenuModel->getMenu($pid);

        foreach ($ret as $key=>$item) {
            if ($delimiter!=='') {
                if ($item['pid']!=0) {
                    $item['name']=str_repeat($delimiter, $spac).$item['name'];
                }else{
                    if (true===$root_delimiter) {
                        $item['name']=str_repeat($delimiter, $spac).$item['name'];
                    }
                }
            }

            $result[]=$item;

            $this->getMenu($item['id'], $delimiter, $spac, $root_delimiter, $result);
        }

        return $result;
    }

    /**
     * 删除菜单栏目
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function delMenu(){
        $id=I('id');
        $ret=$this->ctx->MenuModel->delMenu($id);



        return $ret;
    }

    /**
     * 保存配置
     * @author zhang qing <490702087@qq.com>
     */
    public function saveConfig(){
        $ret=array(
            'ec'=>500,
            'em'=>'保存失败'
        );
        $config   =I('post.config');

        if (!empty($config) && is_array($config)) {
            $config=array_change_key_case($config, CASE_UPPER);
            $content='<?php'.PHP_EOL;
            $content.='/**
 * 所有模块公用配置，由后台《系统设置》生成
 * @author zhang qing <490702087@qq.com>
 * @since  '.date('Y-m-d H:i:s').'
 */'.PHP_EOL;
            $content.='return ';
            $content.=var_export($config, true);
            $content.=';';

            $content=str_replace(array('\'\\\'', '\\\'\'', '\'true\'', '\'false\''), array('\'', '\'', 'true', 'false'), $content);

            $saveret=file_put_contents(MODULE_COMMON_PATH.'config'.DIRECTORY_SEPARATOR.'config.php', $content);

            if ($saveret) {
                opcache_reset();
                $ret['ec']=200;
                $ret['em']='保存成功';
            }
        }

        return $ret;
    }

}