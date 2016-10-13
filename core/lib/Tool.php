<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/10/8 0008 上午 11:57
 */

namespace core\lib;

class Tool{
    protected $ctx;

    public function __construct()
    {
        $this->ctx=\Ctx::instance();
    }
}