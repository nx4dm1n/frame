<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 下午 15:48
 */

namespace app\admin\model;

use core\lib\Model;

class VoteModel extends Model{
    public function __construct($options=null)
    {
        parent::__construct($options=null, __CLASS__);
    }

    /**
     * 保存
     *
     * @param       $id
     * @param array $map
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function save($id, $map=array()){
        $data=array(
            'ec'        => 500,
            'em'        => '保存失败'
        );

        if (empty($map['title'])) {
            $data['em']='请填写选项标题';
            return $data;
        }

        if (empty($map['votes']) || !is_numeric($map['votes'])) {
            $map['votes']=0;
        }

        $map['order_num']   =is_numeric($map['order_num'])  ? $map['order_num'] : 99999;
        $map['last_update'] =date('Y-m-d H:i:s', NOW_TIME);

        if (empty($id)) {
            $map['adddate'] =date('Y-m-d H:i:s', NOW_TIME);

            $ret=$this->insert($this->table, $map);
            if ($ret) {
                $data['ec']=200;
                $data['em']='保存成功';
            }
        }else{
            $ret=$this->update($this->table, $map, array('id'=>$id));
            //if ($ret) {   //  这里不能这样判断，因为在修改时，数据没有改变的情况下直接提交的，更新影响的记录数是 0
                $data['ec']=200;
                $data['em']='保存成功';
            //}
        }

        return $data;
    }

    /**
     * 根据ID查找
     *
     * @param $id
     *
     * @return mixed
     * @author zhang qing <490702087@qq.com>
     */
    public function findByShow($id=''){
        if (empty($id)) {
            $map=array(
                "id"               => "",
                "title"            => "",
                "votes"            => 0,
                "order_num"        => 99999,
                "adddate"          => "",
                "last_update"      => ""
            );
        }else{
            $map=$this->get($this->table, '*', array('id'=>$id));
        }


        return $map;
    }

    public function getCount($where){
        $count=$this->count($this->table, $where);

        return $count;
    }

    public function getAll($columns='*', $where){
        $ret=$this->select($this->table, $columns, $where);
        $ret=$ret?$ret:array();

        return $ret;
    }

    public function sumVote($column, $where=array()){
        return $this->sum($this->table, $column, $where);
    }

    public function modify($data, $where){
        $this->update($this->table, $data, $where);
        $ret['ec']=200;
        $ret['em']='保存成功';

        return $ret;
    }

    public function remove($where){
        $data=array(
            'ec'        => 500,
            'em'        => '删除失败'
        );

        if ($this->delete($this->table, $where)) {
            $data['ec']=200;
            $data['em']='删除成功';
        }

        return $data;
    }
}