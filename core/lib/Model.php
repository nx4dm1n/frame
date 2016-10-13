<?php
/**
 * 模型基类
 * @author zhang qing <490702087@qq.com>
 * @since  2016/9/13 0013 下午 15:31
 */

namespace core\lib;

class Model extends \medoo{
    public $ctx;
    public $table;
    public $field;

    public function __construct($options=null, $classtable)
    {
        if ($options===null) {
            $options = [
                // 必须配置项
                'database_type' => C('DB_TYPE'),
                'database_name' => C('DB_NAME'),
                'server' => C('DB_HOST'),
                'username' => C('DB_USER'),
                'password' => C('DB_PWD'),
                'charset' => C('DB_CHARSET'),

                // 可选参数
                'port' => C('DB_PORT'),

                // 可选，定义表的前缀
                'prefix' => C('DB_PREFIX'),

                // 连接参数扩展, 更多参考 http://www.php.net/manual/en/pdo.setattribute.php
                'option' => [
                    \PDO::ATTR_CASE => \PDO::CASE_NATURAL
                ]
            ];
        }
        parent::__construct($options);

        $this->ctx=\Ctx::instance();

        $class_name=explode('\\', $classtable);
        $class_name=array_pop($class_name);
        $class_name=preg_replace('/([A-Z])/', '_${1}', $class_name);
        $this->table=str_replace('_model', '', ltrim(strtolower($class_name), '_'));
    }
}