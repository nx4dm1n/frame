<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 下午 15:48
 */

namespace app\admin\model;

use core\lib\Model;

class UserModel extends Model{
    public function __construct($options=null)
    {
        parent::__construct($options=null, __CLASS__);
    }

    /**
     * 查询用户是否存在 并返回 用户信息
     *
     * @param $username
     * @param $password
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function findUser($username, $password){
        $data=array(
            'ec'        => 500,
            'em'        => '用户名或密码不正确'
        );

        if (empty($username)) {
            $data['em']='请填写用户名';
            return $data;
        }

        if (empty($password)) {
            $data['em']='请填写密码';
            return $data;
        }

        $ret=$this->get($this->table, '*', array('AND'=>array('username'=> $username, 'password'=>md5($password))));
        if (false!==$ret) {
            if ($ret['status']) {
                $data['ec']=200;
                $data['em']='登录成功，页面正在跳转';
                $data['ret']=$ret;
            }else{
                $data['em']='账号已禁止登录';
            }
        }

        return $data;
    }

    public function modifyLoginInfo($map, $where){
        $data['ec']=200;
        $data['em']='更新登录信息成功';

        $ret=$this->update($this->table, $map, $where);

        return $ret;
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
                "username"         => "",
                "password"         => "",
                "is_root"          => 0,
                "mail"             => "",
                "name"             => "",
                "sex"              => 1,
                "phone"            => "",
                "caption"          => "",
                "status"           => 1,
                "pic"              => ""
            );
        }else{
            $map=$this->get($this->table, '*', array('id'=>$id));
        }

        if ($map['pic']) {
            $map['pic']=$this->ctx->UploadModel->getPicRecord($map['pic']);
        }

        return $map;
    }

    public function getCount($where=array()){
        $count=$this->count($this->table, $where);

        return $count;
    }

    public function getAll($columns='*', $where){
        $ret=$this->select($this->table, $columns, $where);

        return $ret;
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

        if (empty($map['username'])) {
            $data['em']='请填写用户名';
            return $data;
        }

        if (empty($id)) {
            if (is_null($map['password'])) {
                $data['em']='请填写密码';
            }else{
                $map['adddate']     =date('Y-m-d H:i:s', NOW_TIME);

                $ret=$this->insert($this->table, $map);
                if ($ret) {
                    $data['ec']=200;
                    $data['em']='保存成功';
                }
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

    public function saveRule($id, $map=array()){
        $data=array(
            'ec'        => 500,
            'em'        => '保存失败'
        );

        if (empty($id)) {
            $data['em']='非法修改';
        }else{
            $this->update($this->table, $map, array('id'=>$id));
            $data['ec']=200;
            $data['em']='保存成功';
        }

        return $data;
    }

    public function getFieldValue($columns, $where){
        return $this->get($this->table, $columns, $where);
    }

    public function hasUser($where=array()){
        $ret=$this->has($this->table, $where);
        return $ret;
    }

    public function getUser($columns, $where){
        $ret=$this->get($this->table, $columns, $where);

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