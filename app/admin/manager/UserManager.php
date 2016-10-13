<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/14 0014 下午 13:52
 */

namespace app\admin\manager;

use core\lib\Manager;

class UserManager extends Manager{
    /**
     * 用户登录
     * @author zhang qing <490702087@qq.com>
     */
    public function userLogin(){
        $username=I('username');
        $password=I('password');

        $ret=$this->ctx->UserModel->findUser($username, $password);

        if ($ret['ec']===200) {
            // 修改登录时间  与 登录次数
            $map=array(
                'hits'          =>++$ret['ret']['hits'],
                'last_logindate'=>date('Y-m-d H:i:s', NOW_TIME)
            );
            $this->ctx->UserModel->modifyLoginInfo($map, array('id'=>$ret['ret']['id']));

            // 保存session
            session('user', $ret['ret']);
        }

        return $ret;
    }

    public function getList(){
        $data=array();
        $post_data = I('post.');

        $where  = array();
        $search = array();
        $order  = array();

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

        $where['ORDER']     = $order;
        if ($search) {
            $where['AND']['OR']     =$search;
        }

        $total      =$this->ctx->UserModel->getCount(array());   // 总的记录数
        $filtered   =$this->ctx->UserModel->getCount($where);    // 搜索关键词过滤后记录数
        $data['draw']               =I('draw');
        $data['recordsTotal']       =$total;
        $data['recordsFiltered']    =$filtered;
        $data['data']               =array();
        if ($post_data['length']!=-1) {
            $where['LIMIT']=array($post_data['start'], $post_data['length']);
        }
        $result=$this->ctx->UserModel->getAll('*', $where);
        foreach ($result as $key=>$record) {
            $data['data'][]=array(
                "DT_RowId"          =>"row_{$record['id']}",
                "id"                =>$record['id'],
                "username"          =>$record['username'],
                "status"            =>$record['status'],
                "name"              =>$record['name'],
                "sex"               =>$record['sex'],
                "phone"             =>$record['phone'],
                "hits"              =>$record['hits'],
                "is_root"           =>$record['is_root'],
                "adddate"           =>$record['adddate'],
                "last_logindate"    =>$record['last_logindate']
            );
        }

        return $data;
    }

    /**
     * 保存
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function save(){
        $map=array(
            "username"          => I('username'),
            "is_root"           => I('is_root'),
            "mail"              => I('mail'),
            "name"              => I('name'),
            "sex"               => I('sex'),
            "phone"             => I('phone'),
            "caption"           => I('caption'),
            "status"            => I('status'),
            "pic"               => I('pic')
        );

        if (I('password')){
            $map['password']=md5(I('password'));
        }

        $ret=$this->ctx->UserModel->save(I('id'), $map);

        return $ret;
    }

    public function saveRule(){
        $userid =I('userid');
        $map    =array(
            'rule'=>empty(I('rule')) ? '' : implode(',' , I('rule'))
        );

        $ret=$this->ctx->UserModel->saveRule($userid, $map);

        return $ret;
    }

    public function getPassword(){
        $data=array(
            'ec'        => 500,
            'em'        => '用户不存在'
        );

        $username   =I('username');
        $email      =I('email');

        $where      =array(
            'username'  =>$username
        );

        $ret=$this->ctx->UserModel->hasUser($where);
        if ($ret) {
            $where  =array(
                'mail'=>$email
            );
            $ret=$this->ctx->UserModel->hasUser($where);
            if ($ret) {
                // 获取用户id
                $userid=$this->ctx->UserModel->getUser('id', array('username'  =>$username));

                // 发送邮件确认连接
                $data=$this->ctx->PHPMailerTool->sendResetPasswordLink($userid, $email, $username);
            }else{
                $data['em']="邮箱不匹配";
            }
        }

        return $data;
    }

    public function checkResetPasswordCode(){
        $data=array(
            'ec'        => 500,
            'em'        => '找回密码的链接错误或已过期'
        );

        $code       =I('get.code');
        $option=array(
            'prefix'=>'resetpwd_code_',
        );
        if (S($code, '', $option)) {
            $data['ec']=200;
            $data['em']='链接有效';
        }

        return $data;
    }

    public function resetPassword(){
        $userid     =I('userid');
        $username   =I('username');
        $password   =I('password');
        $code       =I('code');

        $map=array(
            'username'=>$username,
            'password'=>md5($password),
        );

        // 修改密码
        $ret=$this->ctx->UserModel->save($userid, $map);

        // 删除连接的code
        $option=array(
            'prefix'=>'resetpwd_code_',
        );
        S($code, null, $option);

        return $ret;
    }

    public function remove(){
        $id         =I('id');
        $where=array(
            'id'=>$id
        );
        $ret=$this->ctx->UserModel->remove($where);

        return $ret;
    }
}