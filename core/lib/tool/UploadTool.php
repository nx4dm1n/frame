<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/20 0020 下午 15:40
 */

namespace core\lib\tool;

use core\lib\Tool;

class UploadTool extends Tool{


    /**
     * 执行上传操作
     *
     * @param        $file
     * @param string $type
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function doUpload($file, $type="image"){
        $data=array(
            'ec'        => 500,
            'em'        => '上传失败'
        );

        $chkret=$this->checkFile($file, $type);

        if ($chkret['ec']==200) {
            if (move_uploaded_file($file['tmp_name'], $chkret['path'])) {
                $data['ec']        = 200;
                $data['em']        = '上传成功';
                $data['name']      = $file['name'];
                $data['type']      = $file['type'];
                $data['size']      = $file['size'];
                $data['path']      = $chkret['path'];
            }
        }else{
            $data['em']=$chkret['em'];
        }


        return $data;
    }

    /**
     * 检测文件合法性：大小、扩展、上传渠道
     *
     * @param        $file
     * @param string $type
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function checkFile($file, $type='image'){
        $type=strtoupper($type);
        $ret=array(
            'ec'=>500,
            'em'=>'文件错误'
        );
        if (false===is_uploaded_file($file['tmp_name'])) {
            $ret['em']='非正常渠道上传';
            return $ret;
        }
        $path_parts  =  pathinfo ( $file['name'] );

        $upload_image_ext=explode('|', C('UPLOAD_'.$type.'_EXT'));

        if (false===in_array($path_parts['extension'], $upload_image_ext)) {
            $ret['em']='只支持 '.implode('、', $upload_image_ext).' 扩展的文件';
            return $ret;
        }

        $upload_image_maxsize=C('UPLOAD_'.$type.'_MAXSIZE');
        $filesize=filesize($file['tmp_name']) / 1024;   // bytes 转 kb
        if ($filesize<=0 || $filesize > $upload_image_maxsize){
            $ret['em']='文件必须大于 0KB，小于等于 '.$upload_image_maxsize.'KB';
            return $ret;
        }

        $filename   = uniqid();
        $path       = C('UPLOAD_'.$type.'_FOLDER').date('Y-m-d').DIRECTORY_SEPARATOR.$filename.'.'.$path_parts['extension'];

        if (false===is_dir(dirname(ROOT_PATH.$path)) && false===mkdir(dirname(ROOT_PATH.$path),0777,true)) {
            $ret['em']='创建目录失败';
            return $ret;
        }

        $ret=array(
            'ec'=>200,
            'em'=>'所上传的文件有效',
            'path'=>$path,
        );

        return $ret;
    }

    /**
     * 删除上传文件
     *
     * @param $file
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function doDelete($file){
        $ret=array(
            'ec'=>500,
            'em'=>'删除失败'
        );

        if (is_file($file)) {
            if (unlink($file)) {
                $ret['ec']=200;
                $ret['em']='删除成功';
            }
        }else{
            $ret['em']='不是一个有效的文件';
        }

        return $ret;
    }

}