<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 上午 11:18
 */

namespace app\home\controller;

use core\lib\Controller;

class IndexController extends Controller{

    public function __construct()
    {
        parent::__construct();
    }


    public function index(){
        $this->display();
    }
}