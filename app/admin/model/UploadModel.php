<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 下午 15:48
 */

namespace app\admin\model;

use core\lib\Model;

class UploadModel extends Model{
    public function __construct($options=null)
    {
        parent::__construct($options=null, __CLASS__);
    }

    /**
     * 保存-新增加记录
     *
     * @param array $map
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function addRecord($map=array()){
        $data=array(
            'ec'        => 500,
            'em'        => '保存失败'
        );

        $map['adddate']     =date('Y-m-d H:i:s', NOW_TIME);

        $ret=$this->insert($this->table, $map);
        if ($ret) {
            $data['ec']=200;
            $data['em']='保存成功';
            $data['id']=$ret;
        }

        return $data;
    }



    public function getField($columns, $where){
        return $this->get($this->table, $columns, $where);
    }

    /**
     * 获取图片文件记录
     *
     * @param $picid
     *
     * @return array|bool
     * @author zhang qing <490702087@qq.com>
     */
    public function getPicRecord($picid){
        if (is_array($picid)) { // 图片集合
            $pic=array();
            foreach ($picid as $key=>$fileid) {
                $ret=$this->ctx->UploadModel->getField(array('url', 'caption', 'id', 'size', 'type'), array('id'=>$fileid));
                if ($ret) {
                    $pic[$key]=$ret;
                    $pic[$key]['url']=WEBROOT_PATH.$pic[$key]['url'];
                    $pic[$key]['key']=$pic[$key]['id'];
                }else{
                    $pic[$key]=array("url"=>"", "caption"=>"", "key"=>0, "size"=>"", "type"=>"", "extra"=>array("id"=>$fileid));
                }
            }
        }else{  // 略缩图
            $pic='';
            $where=array(
                'id'=>$picid
            );
            $ret=$this->getField(array('url', 'caption', 'id', 'size', 'type'), $where);
            if ($ret) {
                $pic=$ret;
                $pic['url']=WEBROOT_PATH.$pic['url'];
            }else{
                $pic=array("url"=>"", "caption"=>"", "key"=>0, "size"=>"", "type"=>"", "extra"=>array("id"=>$picid));
            }
        }

        return $pic;
    }

    /**
     * 获取视频文件记录
     *
     * @param $videoid
     *
     * @return array|bool
     * @author zhang qing <490702087@qq.com>
     */
    public function getVideoRecord($videoid){
        $where=array(
            'id'=>$videoid
        );
        $ret=$this->getField(array('url', 'caption', 'id', 'size', 'type'), $where);
        if ($ret) {
            $video=$ret;
            $video['url']=WEBROOT_PATH.$video['url'];
        }else{
            $video=array("url"=>"", "caption"=>"", "key"=>0, "size"=>"", "type"=>"", "extra"=>array("id"=>$videoid));
        }

        return $video;
    }


    /**
     * 获取文件记录
     *
     * @param $fileid
     *
     * @return array|bool
     * @author zhang qing <490702087@qq.com>
     */
    public function getFileRecord($fileid){
        $where=array(
            'id'=>$fileid
        );
        $ret=$this->getField(array('url', 'caption', 'id', 'size', 'type'), $where);
        if ($ret) {
            $file=$ret;
            $file['url']=WEBROOT_PATH.$file['url'];
        }else{
            $file=array("url"=>"", "caption"=>"", "key"=>0, "size"=>"", "type"=>"", "extra"=>array("id"=>$fileid));
        }

        return $file;
    }

    public function delRecord($where){
        $data=array(
            'ec'=>500,
            'em'=>'删除失败'
        );

        $ret=$this->delete($this->table, $where);
        if ($ret) {
            $data['ec']=200;
            $data['em']='删除成功';
        }

        return $data;
    }
}