<?php
/**
 * 设置
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/18 0018 下午 14:42
 */

namespace app\admin\controller;

class UploadController extends CommonController{
    public function __construct()
    {
        parent::__construct();

    }

    /**
     * 图片上传
     * @author zhang qing <490702087@qq.com>
     */
    public function uploadPic(){
        $ret=$this->ctx->UploadManager->savePic();
        $this->ajaxReturn($ret);
    }

    /**
     * 文件上传
     * @author zhang qing <490702087@qq.com>
     */
    public function uploadFile(){
        $ret=$this->ctx->UploadManager->saveFile();
        $this->ajaxReturn($ret);
    }

    /**
     * 视频上传
     * @author zhang qing <490702087@qq.com>
     */
    public function uploadVideo(){
        $ret=$this->ctx->UploadManager->saveVideo();
        $this->ajaxReturn($ret);
    }

    /**
     * 删除上传的文件
     * @author zhang qing <490702087@qq.com>
     */
    public function delete(){
        $ret=$this->ctx->UploadManager->delete();
        $this->ajaxReturn($ret);
    }

    /**
     * ueditor编辑器上传操作
     * @author zhang qing <490702087@qq.com>
     */
    public function ueditor(){
        $action=I('get.action');

        switch ($action) {
            case 'config' :
                $ret=array(
                    // 上传图片配置项
                    "imageActionName"   =>"uploadimage",
                    "imagePath"         =>C('UPLOAD_IMAGE_FOLDER'),
                    "imageFieldName"    =>"pic_up",
                    "imageMaxSize"      =>C('UPLOAD_IMAGE_MAXSIZE')*1024,
                    "imageAllowFiles"   =>$this->ctx->UploadManager->getUeditorUploadExt('IMAGE'),
                    "imageUrlPrefix"    =>WEBROOT_PATH,

                    // 涂鸦图片配置项
                    "scrawlActionName"   =>"uploadscrawl",
                    "scrawlPath"         =>C('UPLOAD_SCRAWL_FOLDER'),
                    "scrawlFieldName"    =>"scrawl_up",
                    "scrawlMaxSize"      =>C('UPLOAD_SCRAWL_MAXSIZE')*1024,
                    "scrawlUrlPrefix"    =>WEBROOT_PATH,

                    // 截图配置项
                    "snapscreenActionName"   =>"uploadsnapscreen",
                    "snapscreenPath"         =>C('UPLOAD_SNAPSCREEN_FOLDER'),
                    "snapscreenFieldName"    =>"snapscreen_up",
                    "snapscreenMaxSize"      =>C('UPLOAD_SNAPSCREEN_MAXSIZE')*1024,
                    "snapscreenUrlPrefix"    =>WEBROOT_PATH,

                    // 上传视频配置
                    "videoActionName"   =>"uploadvideo",
                    "videoPath"         =>C('UPLOAD_VIDEO_FOLDER'),
                    "videoFieldName"    =>"video_up",
                    "videoMaxSize"      =>C('UPLOAD_VIDEO_MAXSIZE')*1024,
                    "videoAllowFiles"   =>$this->ctx->UploadManager->getUeditorUploadExt('VIDEO'),
                    "videoUrlPrefix"    =>WEBROOT_PATH,

                    // 上传文件配置
                    "fileActionName"    =>"uploadfile",
                    "filePath"          =>C('UPLOAD_FILE_FOLDER'),
                    "fileFieldName"     =>"file_up",
                    "fileMaxSize"       =>C('UPLOAD_VIDEO_MAXSIZE')*1024,
                    "fileAllowFiles"    =>$this->ctx->UploadManager->getUeditorUploadExt('FILE'),
                    "fileUrlPrefix"     =>WEBROOT_PATH,

                    //列出指定目录下的图片 //TODO:列出上传的文件
                    "imageManagerActionName"    =>'list_image',
                    "imageManagerListPath"      =>C('UPLOAD_IMAGE_FOLDER'),
                    "imageManagerListSize"      =>20,
                    "imageManagerUrlPrefix"     =>WEBROOT_PATH,
                    "imageManagerAllowFiles"    =>$this->ctx->UploadManager->getUeditorUploadExt('IMAGE'),
                );
                $this->ajaxReturn($ret);
            case 'uploadimage' :    // 上传图片
                $ret=$this->ctx->UploadManager->saveUeditorUpload('pic_up', 'image');
                $this->ajaxReturn($ret);
            case 'uploadscrawl' :   // 上传涂鸦
                $ret=$this->ctx->UploadManager->saveUeditorScrawl('scrawl_up', 'scrawl');
                $this->ajaxReturn($ret);
            case 'uploadsnapscreen' :   // 截图
                $ret=$this->ctx->UploadManager->saveUeditorSnapscreen('snapscreen_up', 'snapscreen');
                $this->ajaxReturn($ret);
            case 'uploadvideo' :    // 上传视频
                $ret=$this->ctx->UploadManager->saveUeditorUpload('video_up', 'video');
                $this->ajaxReturn($ret);
            case 'uploadfile'  :    // 上传文件
                $ret=$this->ctx->UploadManager->saveUeditorUpload('file_up', 'file');
                $this->ajaxReturn($ret);
            case 'listimage' :
                //TODO:列出上传的文件
                $ret=$this->ctx->UploadManager->listimage(C('UPLOAD_IMAGE_FOLDER'), $this->ctx->UploadManager->getUeditorUploadExt('IMAGE'));
                $this->ajaxReturn($ret);
            default :
                break;
        }
    }
}