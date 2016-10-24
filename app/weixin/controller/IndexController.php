<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 上午 11:18
 */

namespace app\weixin\controller;

use core\lib\Controller;

class IndexController extends Controller{

    public function __construct()
    {
        parent::__construct();
    }


    public function index(){
        $echoStr = $_GET["echostr"];
        if($this->checkSaddignature()){
            echo $echoStr;
            exit;
        }
    }

    private function checkSignature()
    {
        $signature  = $_GET["signature"];
        $timestamp  = $_GET["timestamp"];
        $nonce      = $_GET["nonce"];

        $token = 'jKGU5LN7MZjJgA1Dnfdw6KX6F70O1zYe';
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );

        if( $tmpStr == $signature ){
            return true;
        }else{
            return false;
        }
    }
}