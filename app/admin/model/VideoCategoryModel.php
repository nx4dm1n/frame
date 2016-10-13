<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 下午 15:48
 */

namespace app\admin\model;

use core\lib\Model;

class VideoCategoryModel extends Model{
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

        if (!is_numeric($map['pid']) || $map['pid']<0) {
            $data['em']='请选择所属栏目';
            return $data;
        }

        if (empty($map['name'])) {
            $data['em']='请填写栏目名称';
            return $data;
        }

        if (empty($id)) {
            $ret=$this->get($this->table, '*', array('AND'=>array('pid'=> $map['pid'], 'name'=>$map['name'])));
            if (false===$ret) {
                $ret=$this->insert($this->table, $map);
                if ($ret) {
                    $data['ec']=200;
                    $data['em']='保存成功';
                }
            }else{
                $data['em']="保存失败，“{$map['name']}” 已经存在";
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
     * 查找栏目
     *
     * @param int $pid
     *
     * @return mixed
     * @author zhang qing <490702087@qq.com>
     */
    public function getCategory($pid=0){
        $ret=$this->select($this->table, '*', array('pid'=>$pid));
        return $ret;
    }

    /**
     * 根据ID查找
     *
     * @param        $id
     * @param string $columns
     *
     * @return mixed
     * @author zhang qing <490702087@qq.com>
     */
    public function find($id, $columns='*'){
        $ret=$this->get($this->table, $columns, array('id'=>$id));
        return $ret;
    }

    public function remove($id){
        $data=array(
            'ec'        => 500,
            'em'        => '删除失败'
        );

        $ret=$this->delete($this->table, array('id'=>$id));
        if ($ret) {
            $data['ec']=200;
            $data['em']='删除成功';
        }

        return $data;
    }
}