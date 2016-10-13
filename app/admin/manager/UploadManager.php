<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/14 0014 下午 13:52
 */

namespace app\admin\manager;

use core\lib\Manager;

class UploadManager extends Manager{

    /**
     * 保存图片
     *
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function savePic(){
        $ret        = array();
        $varname    = I('post.varname');
        $file       = $_FILES[$varname];

        if (is_string($file['tmp_name'])) {
            $upret=$this->ctx->UploadTool->doUpload($file, 'image');
            if ($upret['ec']!=200) {
                $ret['error']=$upret['em'];
            }else{
                $map=array(
                    'caption'   =>$upret['name'],
                    'size'      =>$upret['size'],
                    'url'       =>$upret['path'],
                    'type'      =>$upret['type']
                );

                // 入库
                $dbret=$this->ctx->UploadModel->addRecord($map);
                if ($dbret['ec']!=200) {
                    $ret['error']=$dbret['em'];
                    return $ret;
                }

                // 返回客户端展现
                $httppath=WEBROOT_PATH.$upret['path'];
                $ret['initialPreview'][] = "<img src='{$httppath}' class='kv-preview-data file-preview-image' title='{$upret['name']}' alt='{$upret['name']}' style='width:auto;height:160px;'>";
                $ret['initialPreviewConfig'][]  = array(
                    'caption'   =>$upret['name'],
                    'filetype'  =>$upret['type'],
                    'size'      =>$upret['size'],
                    'extra'     =>array(
                        'id'        =>$dbret['id']
                    ),
                );
                $ret['append']                  = false;

                // 删除旧图片
                $pic=I('post.pic');
                if ($pic) {
                    $delret=$this->delete($pic);
                    if (isset($delret['error'])) {
                        return $delret;
                    }
                }

            }
        }elseif(is_array($file['tmp_name'])){
            foreach ($file['tmp_name'] as $key=>$val) {
                $tmp=array();
                $tmp['name']    =$file['name'][$key];
                $tmp['type']    =$file['type'][$key];
                $tmp['tmp_name']=$file['tmp_name'][$key];
                $tmp['error']   =$file['error'][$key];
                $tmp['size']    =$file['size'][$key];

                $upret=$this->ctx->UploadTool->doUpload($tmp, 'image');
                if ($upret['ec']!=200) {
                    $ret['error']=$upret['em'];
                }else{
                    $map=array(
                        'caption'   =>$upret['name'],
                        'size'      =>$upret['size'],
                        'url'       =>$upret['path'],
                        'type'      =>$upret['type']
                    );

                    // 入库
                    $dbret=$this->ctx->UploadModel->addRecord($map);
                    if ($dbret['ec']!=200) {
                        $ret['error']=$dbret['em'];
                        return $ret;
                    }

                    // 返回客户端展现
                    $httppath=WEBROOT_PATH.$upret['path'];
                    $ret['initialPreview'][]        = "<img src='{$httppath}' class='kv-preview-data file-preview-image' title='{$upret['name']}' alt='{$upret['name']}' style='width:auto;height:160px;'>";
                    $ret['initialPreviewConfig'][]  = array(
                        'caption'   =>$upret['name'],
                        'filetype'  =>$upret['type'],
                        'size'      =>$upret['size'],
                        'key'       =>$dbret['id'],
                        'extra'     =>array(
                            'id'        =>$dbret['id'],
                        ),
                    );
                }
            }
        }

        return $ret;
    }

    /**
     * 保存文件
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function saveFile(){
        $ret        = array();
        $varname    = I('post.varname');
        $file       = $_FILES[$varname];

        $upret=$this->ctx->UploadTool->doUpload($file, 'file');
        if ($upret['ec']!=200) {
            $ret['error']=$upret['em'];
        }else{
            $map=array(
                'caption'   =>$upret['name'],
                'size'      =>$upret['size'],
                'url'       =>$upret['path'],
                'type'      =>$upret['type']
            );

            // 入库
            $dbret=$this->ctx->UploadModel->addRecord($map);
            if ($dbret['ec']!=200) {
                $ret['error']=$dbret['em'];
                return $ret;
            }

            // 返回客户端展现
            //$httppath=WEBROOT_PATH.$upret['path'];
            //if ($type=='image') {
                $ret['initialPreview'][] = '<div class="file-preview-other"><span class="file-other-icon"><i class="fa fa-file text-primary"></i></span></div>';
            //}
            $ret['initialPreviewConfig'][]  = array(
                'caption'   =>$upret['name'],
                'filetype'  =>$upret['type'],
                'size'      =>$upret['size'],
                'extra'     =>array(
                    'id'        =>$dbret['id']
                ),
            );
            $ret['append']                  = false;

            // 删除旧文件
            $pic=I('post.file');
            if ($pic) {
                $delret=$this->delete($pic);
                if (isset($delret['error'])) {
                    return $delret;
                }
            }

        }

        return $ret;
    }

    /**
     * 保存视频
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function saveVideo(){
        $ret        = array();
        $varname    = I('post.varname');
        $file       = $_FILES[$varname];

        $upret=$this->ctx->UploadTool->doUpload($file, 'video');
        if ($upret['ec']!=200) {
            $ret['error']=$upret['em'];
        }else{
            $map=array(
                'caption'   =>$upret['name'],
                'size'      =>$upret['size'],
                'url'       =>$upret['path'],
                'type'      =>$upret['type']
            );

            // 入库
            $dbret=$this->ctx->UploadModel->addRecord($map);
            if ($dbret['ec']!=200) {
                $ret['error']=$dbret['em'];
                return $ret;
            }

            // 返回客户端展现
            $httppath=WEBROOT_PATH.$upret['path'];
            $ret['initialPreview'][]        = "<video class='kv-preview-data' controls=''><source src='{$httppath}' type='{$upret['type']}'><div class='file-preview-other'><span class='file-other-icon'><i class='glyphicon glyphicon-file'></i></span></div></video>";
            $ret['initialPreviewConfig'][]  = array(
                'caption'   =>$upret['name'],
                'filetype'  =>$upret['type'],
                'size'      =>$upret['size'],
                'extra'     =>array(
                    'id'        =>$dbret['id']
                ),
            );
            $ret['append']                  = false;

            // 删除旧文件
            $pic=I('post.video');
            if ($pic) {
                $delret=$this->delete($pic);
                if (isset($delret['error'])) {
                    return $delret;
                }
            }

        }

        return $ret;
    }


    /**
     * 保存
     *
     * @param $varname
     * @param $type
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function saveUeditorUpload($varname, $type){
        $ret        = array();
        $file       = $_FILES[$varname];

        $upret=$this->ctx->UploadTool->doUpload($file, $type);
        if ($upret['ec']!=200) {
            $ret['state']=$upret['em'];
        }else{
            $map=array(
                'caption'   =>$upret['name'],
                'size'      =>$upret['size'],
                'url'       =>$upret['path'],
                'type'      =>$upret['type']
            );

            // 入库
            $dbret=$this->ctx->UploadModel->addRecord($map);
            if ($dbret['ec']!=200) {
                $ret['error']=$dbret['em'];
                return $ret;
            }

            // 返回客户端展现
            $ret=array(
                'state'     =>'SUCCESS',
                'url'       =>$upret['path'],
                'title'     =>$upret['name'],
                'original'  =>$upret['name']
            );
        }

        return $ret;
    }

    /**
     * 保存
     *
     * @param $varname
     * @param $type
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function saveUeditorScrawl($varname, $type){
        $ret        = array();
        $file       = I($varname);
        if (!empty($file)) {
            $filename   = uniqid();
            $title      = 'ueditor涂鸦';
            $path       = C('UPLOAD_'.$type.'_FOLDER').date('Y-m-d').DIRECTORY_SEPARATOR.$filename.'.'.C('UPLOAD_SCRAWL_EXT');

            if (false===is_dir(dirname(ROOT_PATH.$path)) && false===mkdir(dirname(ROOT_PATH.$path),0777,true)) {
                $ret['state']='创建目录失败';
                return $ret;
            }

            file_put_contents($path, base64_decode($file));

            $map=array(
                'caption'   =>$title,
                'size'      =>filesize($path),
                'url'       =>$path,
                'type'      =>image_type_to_mime_type(exif_imagetype($path))
            );

            // 入库
            $dbret=$this->ctx->UploadModel->addRecord($map);
            if ($dbret['ec']!=200) {
                $ret['state']=$dbret['em'];
                return $ret;
            }

            // 返回客户端展现
            $ret=array(
                'state'     =>'SUCCESS',
                'url'       =>$path,
                'title'     =>$title,
                'original'  =>$title
            );

        }else{
            $ret['state']='尚未作画，白纸一张~';
        }



        return $ret;
    }

    /**
     * 保存截图
     *
     * @param $varname
     * @param $type
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function saveUeditorSnapscreen($varname, $type){
        $ret        = array();
        $file       = I($varname);
        if (!empty($file)) {
            $filename   = uniqid();
            $title      = 'ueditor截图';
            $path       = C('UPLOAD_'.$type.'_FOLDER').date('Y-m-d').DIRECTORY_SEPARATOR.$filename.'.'.C('UPLOAD_SNAPSCREEN_EXT');

            if (false===is_dir(dirname(ROOT_PATH.$path)) && false===mkdir(dirname(ROOT_PATH.$path),0777,true)) {
                $ret['state']='创建目录失败';
                return $ret;
            }

            file_put_contents($path, base64_decode($file));

            $map=array(
                'caption'   =>$title,
                'size'      =>filesize($path),
                'url'       =>$path,
                'type'      =>image_type_to_mime_type(exif_imagetype($path))
            );

            // 入库
            $dbret=$this->ctx->UploadModel->addRecord($map);
            if ($dbret['ec']!=200) {
                $ret['state']=$dbret['em'];
                return $ret;
            }

            // 返回客户端展现
            $ret=array(
                'state'     =>'SUCCESS',
                'url'       =>$path,
                'title'     =>$title,
                'original'  =>$title
            );

        }else{
            $ret['state']='还没有截图呢~';
        }



        return $ret;
    }

    /**
     * 删除上传的文件及数据库里记录
     *
     * @param string $id
     *
     * @return array
     * @author zhang qing <490702087@qq.com>
     */
    public function delete($id=''){
        $data=array();

        $id = $id ? $id : I('post.id/d');
        if ($id) {
            $where=array(
                'id'=>$id
            );
            $path=$this->ctx->UploadModel->getField('url', $where);
            // 删除磁盘文件
            $ret=$this->ctx->UploadTool->doDelete(ROOT_PATH.$path);
            if ($ret['ec']!=200) {
                $data['error']=$ret['em'];
            }
            //删除数据库记录
            $dbret=$this->ctx->UploadModel->delRecord($where);
            if ($dbret['ec']!=200) {
                $data['error']=$dbret['em'];
            }
        }else{
            $data['error']='非法操作';
        }

        return $data;
    }

    public function listimage($path, $allowFiles){
        $files = $this->getfiles($path, $allowFiles);
        return array(
            "state" => "no match file",
            "list" => $files,
            "start" => 1,
            "total" => 100
        );
    }

    public function getUeditorUploadExt($type){
        $upload_ext=explode('|', C('UPLOAD_'.strtoupper($type).'_EXT'));
        array_walk($upload_ext, function(&$val){
            $val='.'.$val;
        });

        return $upload_ext;
    }
}