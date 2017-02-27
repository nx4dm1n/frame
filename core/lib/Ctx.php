<?php

/**
 * 通用context对象
 *
 * @property app\admin\manager\UserManager          $UserManager
 * @property app\admin\manager\SettingManager       $SettingManager
 * @property app\admin\manager\ArticleCategoryManager       $ArticleCategoryManager
 * @property app\admin\manager\VideoCategoryManager       $VideoCategoryManager
 * @property app\admin\manager\DownloadCategoryManager       $DownloadCategoryManager
 * @property app\admin\manager\NewsCategoryManager       $NewsCategoryManager
 * @property app\admin\manager\ProductCategoryManager       $ProductCategoryManager
 * @property app\admin\manager\CaseCategoryManager       $CaseCategoryManager
 * @property app\admin\manager\ArticleManager       $ArticleManager
 * @property app\admin\manager\VideoManager       $VideoManager
 * @property app\admin\manager\DownloadManager       $DownloadManager
 * @property app\admin\manager\NewsManager       $NewsManager
 * @property app\admin\manager\ProductManager       $ProductManager
 * @property app\admin\manager\CaseManager       $CaseManager
 * @property app\admin\manager\PageManager       $PageManager
 * @property app\admin\manager\LinkManager       $LinkManager
 * @property app\admin\manager\AdManager       $AdManager
 * @property app\admin\manager\UploadManager       $UploadManager
 * @property app\admin\manager\VoteManager       $VoteManager
 *
 * @property app\admin\model\UserModel              $UserModel
 * @property app\admin\model\MenuModel              $MenuModel
 * @property app\admin\model\ArticleModel              $ArticleModel
 * @property app\admin\model\VideoModel              $VideoModel
 * @property app\admin\model\DownloadModel              $DownloadModel
 * @property app\admin\model\ProductModel              $ProductModel
 * @property app\admin\model\NewsModel              $NewsModel
 * @property app\admin\model\CaseModel              $CaseModel
 * @property app\admin\model\PageModel              $PageModel
 * @property app\admin\model\LinkModel              $LinkModel
 * @property app\admin\model\AdModel              $AdModel
 * @property app\admin\model\ArticleCategoryModel              $ArticleCategoryModel
 * @property app\admin\model\VideoCategoryModel              $VideoCategoryModel
 * @property app\admin\model\DownloadCategoryModel              $DownloadCategoryModel
 * @property app\admin\model\NewsCategoryModel              $NewsCategoryModel
 * @property app\admin\model\CaseCategoryModel              $CaseCategoryModel
 * @property app\admin\model\ProductCategoryModel              $ProductCategoryModel
 * @property app\admin\model\UploadModel              $UploadModel
 * @property app\admin\model\VoteModel              $VoteModel
 *
 * @property core\lib\tool\UploadTool               $UploadTool
 * @property core\lib\tool\PHPMailerTool               $PHPMailerTool
 * @property \PHPMailer               $PHPMailer
 */

//namespace core\lib;

class Ctx{
    protected $component = array();         // 组件集合
    static private $instance    = null;     // ctx实例对象

    private function __construct() {
    }

    /**
     * 返回ctx单例
     * @return Ctx|null
     * @author zhang qing <490702087@qq.com>
     */
    static public function instance(){
        if (is_null(self::$instance)){
            self::$instance=new self;
        }

        return self::$instance;
    }

    /**
     * 提供属性方式访问
     * @param $key
     * @return mixed
     */
    public function __get($key) {
        if (!isset($this->component[$key])) {
            $func = "get" . ucfirst($key);
            if (method_exists($this, $func)) {
                $this->component[$key] = $this->$func();
            } else {
                if (stripos($key, 'Model') !== false) {
                    $class="\\app\\".MODULE."\\model\\{$key}";
                    $this->component[$key] = new $class();
                }else if(stripos($key, 'Manager') !== false) {
                    $class="\\app\\".MODULE."\\manager\\{$key}";
                    $this->component[$key] = new $class();
                }else if(stripos($key, 'Tool') !== false) {
                    $class="\\core\\lib\\tool\\{$key}";
                    $this->component[$key] = new $class();
                }
            }
        }

        return isset($this->component[$key]) ? $this->component[$key] : null;
    }

    /**
     * 邮件库实例
     * @return PHPMailer
     * @author zhang qing <490702087@qq.com>
     */
    public function getPHPMailer(){
        return new PHPMailer();
    }
}