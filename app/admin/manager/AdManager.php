<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/14 0014 下午 13:52
 */

namespace app\admin\manager;

use core\lib\Manager;

class AdManager extends Manager{

    /**
     * 保存
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function save(){
        $map=array(
            "classid"          => I('classid'),
            "title"            => I('title'),
            "url"              => I('url'),
            "caption"          => I('caption'),
            "pic"              => I('pic'),
            "order_num"        => I('order_num'),
            "hits"             => I('hits'),
            "is_recommend"     => I('is_recommend'),
            "is_pass"          => I('is_pass'),
            "adddate"          => I('adddate'),
            "last_update"      => I('last_update'),
        );

        $ret=$this->ctx->AdModel->save(I('id'), $map);

        return $ret;
    }

    /**
     * 获取所有文章
     * @author zhang qing <490702087@qq.com>
     */
    public function getList(){
        $data=array();
        $post_data = I('post.');

        $where  = array();
        $search = array();
        $order  = array();

        $is_pass   = I('get.is_pass/d');
        $classid   = I('get.classid/d');

        foreach ($post_data['columns'] as $key=>$field) {
            if ($field['searchable']==='true' && $post_data['search']['value']) {
                $search[$field['name'].'[~]']=$post_data['search']['value'];
            }
        }

        foreach ($post_data['order'] as $key=>$field) {
            if ($post_data['columns'][$field['column']]['orderable']==='true') {
                $order[$post_data['columns'][$field['column']]['name']]=strtoupper($field['dir']);
            }
        }

        $where['AND']['is_pass']   = $is_pass;
        $where['ORDER']     = $order;

        if ($classid) {
            $where['AND']['classid']=$classid;
        }

        if ($search) {
            $where['AND']['OR']     =$search;
        }

        $total      =$this->ctx->AdModel->getCount(array());   // 总的记录数
        $filtered   =$this->ctx->AdModel->getCount($where);    // 搜索关键词过滤后记录数
        $data['draw']               =I('draw');
        $data['recordsTotal']       =$total;
        $data['recordsFiltered']    =$filtered;
        $data['data']               =array();
        if ($post_data['length']!=-1) {
            $where['LIMIT']=array($post_data['start'], $post_data['length']);
        }
        $result=$this->ctx->AdModel->getAll('*', $where);
        foreach ($result as $key=>$record) {
            $data['data'][]=array(
                "DT_RowId"          =>"row_{$record['id']}",
                "id"                =>$record['id'],
                "title"             =>$record['title'],
                "url"               =>$record['url'],
                "order_num"         =>$record['order_num'],
                "hits"              =>$record['hits'],
                "is_recommend"      =>$record['is_recommend'],
                "is_pass"           =>$record['is_pass'],
                "last_update"       =>$record['last_update']
            );
        }

        return $data;
    }

    /**
     * 设置显示/隐藏
     * @return mixed
     * @author zhang qing <490702087@qq.com>
     */
    public function setPass(){
        $id         =I('id');
        $value     =I('value');
        $data=array(
            'is_pass'=>$value,
            'last_update'=>date('Y-m-d H:i:s', NOW_TIME)
        );

        $where=array(
            'id'=>$id
        );

        $ret=$this->ctx->AdModel->modify($data, $where);

        return $ret;
    }

    public function setRecommend(){
        $id     = I('post.id');
        $value  = I('post.value');

        $data=array(
            'is_recommend'=>$value,
            'last_update'=>date('Y-m-d H:i:s', NOW_TIME)
        );

        $where=array(
            'id'=>$id
        );

        $ret=$this->ctx->AdModel->modify($data, $where);

        return $ret;
    }

    /**
     * 记录记录
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function remove(){
        $id         =I('id');
        $where=array(
            'id'=>$id
        );
        $ret=$this->ctx->AdModel->remove($where);

        return $ret;
    }
}