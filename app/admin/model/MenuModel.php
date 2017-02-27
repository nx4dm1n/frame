<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 下午 15:48
 */

namespace app\admin\model;

use core\lib\Model;

class MenuModel extends Model{
    public function __construct($options=null)
    {
        parent::__construct($options=null, __CLASS__);
    }

    /**
     * 保存
     *
     * @param        $id
     * @param        $pid
     * @param        $name
     * @param string $url
     * @param string $icon
     * @param string $sorting
     *
     * @return array
     * @author zhang.qing <zhang.qing@immomo.com>
     */
    public function saveMenu($id, $pid, $name, $url='', $icon='', $sorting=99999, $isvalid=1){
        $data=array(
            'ec'        => 500,
            'em'        => '保存失败'
        );

        if (!is_numeric($pid) || $pid<0) {
            $data['em']='请选择所属栏目';
            return $data;
        }


        if (empty($name)) {
            $data['em']='请填写栏目名称';
            return $data;
        }

        if (!is_numeric($sorting) || $sorting<0) {
            $data['em']='请输入排序';
            return $data;
        }

        if (!is_numeric($isvalid) || ($isvalid<0 || $isvalid>1)) {
            $data['em']='参数：“是否启用” 非法';
            return $data;
        }

        $map=array(
            'pid'=>$pid,
            'name'=>$name,
            'url'=>$url,
            'icon'=>$icon,
            'sorting'=>$sorting,
            'isvalid'=>$isvalid,
        );

        if (empty($id)) {
            $ret=$this->get($this->table, '*', array('AND'=>array('pid'=> $pid, 'name'=>$name)));
            if (false===$ret) {
                $ret=$this->insert($this->table, $map);
                if ($ret) {
                    $data['ec']=200;
                    $data['em']='保存成功';
                }
            }else{
                $data['em']="保存失败，“{$name}” 已经存在";
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
     * 查找菜单
     *
     * @param int $pid
     * @param string $isvalid
     *
     * @return mixed
     * @author zhang qing <490702087@qq.com>
     */
    public function getMenu($pid=0, $isvalid=""){
        $where=array(
            'AND'=>array(
                'pid'=>$pid
            ),
            'ORDER'=>array(
                'sorting'=>'ASC',
                'id'=>'ASC'
            )
        );

        if ($isvalid!=='') {
            $where['AND']['isvalid']=$isvalid;
        }
        $ret=$this->select($this->table, '*', $where);
        return $ret;
    }


    /**
     * 根据ID获取单条menu数据
     *
     * @param $id
     *
     * @author zhang qing <490702087@qq.com>
     */
    public function findMenu($id){
        $ret=$this->get($this->table, '*', array('id'=>$id));
        return $ret;
    }

    /**
     * 根据ID获取单条menu数据
     *
     * @param $id
     *
     * @author zhang qing <490702087@qq.com>
     */
    public function findMenu2($columns='*', $where=array()){
        $ret=$this->get($this->table, $columns, $where);
        return $ret;
    }

    /**
     * 删除栏目菜单
     *
     * @param $id
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function delMenu($id){

        //TODO:是否含有子栏目等判断

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