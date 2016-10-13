<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/14 0014 下午 14:28
 */

namespace core\lib;

class Manager{
    public $ctx;

    public function __construct()
    {
        $this->ctx=\Ctx::instance();
    }
}