<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
      
/**
 * ThinkPHP 普通模式定义
 */
return array(
    // 配置文件
    'config'    =>  array(
        CORE_PATH.'config'.DIRECTORY_SEPARATOR.'convention.php',   // 系统惯例配置
        MODULE_COMMON_PATH.'config'.DIRECTORY_SEPARATOR.'config.php',      // 应用公共配置
    ),


    // 函数和类文件
    'core'      =>  array(
        CORE_PATH.'common'.DIRECTORY_SEPARATOR.'functions.php',
    )
);
