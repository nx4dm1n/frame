<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/14 0014 下午 13:52
 */

namespace app\admin\manager;

use core\lib\Manager;

class VideoCategoryManager extends Manager{

    /**
     * 保存
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function save(){
        $map=array(
            'pid'           =>I('pid'),
            'name'          =>I('name'),
            'caption'       =>I('caption'),
            'keywords'      =>I('keywords'),
            'description'   =>I('description'),
            'icon'          =>I('icon'),
            'pic'           =>I('pic'),
        );

        $ret=$this->ctx->VideoCategoryModel->save(I('id'), $map);

        return $ret;
    }

    /**
     * 获取分类
     *
     * @param int    $pid
     * @param string $delimiter
     * @param int    $spac
     * @param bool   $root_delimiter
     * @param array  $result
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function getCategory($pid=0, $delimiter='──',$spac=0,  $root_delimiter=false, &$result=array()){
        $spac++;

        $ret=$this->ctx->VideoCategoryModel->getCategory($pid);

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

            $this->getCategory($item['id'], $delimiter, $spac, $root_delimiter, $result);
        }

        return $result;
    }

    /**
     * 删除菜单栏目
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function remove(){

        $id=I('id');
        $ret=$this->ctx->VideoCategoryModel->remove($id);

        //TODO:删除该分类下的所有信息

        return $ret;
    }
}