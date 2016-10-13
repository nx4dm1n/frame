## 前言

自己业余时间写的简单MVC模式的CMS框架，适用于企业网站的快速开发。部分代码借鉴了[ThinkPHP](http://www.thinkphp.cn/ "ThinkPHP")，请各位大哼给小弟补补课~~~

模板文件部分素材和代码有参考[Quirk](http://themetrace.com/demo/quirk/templates/index.html "Quirk")，此模板素材和程序并非开源，倘若您使用本套程序作为商业用途但模板素材或程序未经[Quirk](http://themetrace.com/demo/quirk/templates/index.html "Quirk")授权时，一切法律纠纷与本人无关，哈哈

下面提供了演示地址，本人穷吊丝，只能用得起国外廉价服务器，响应速度太……将就着用吧

前台地址：[http://frame.zhangqing.tech/](http://frame.zhangqing.tech/ "http://frame.zhangqing.tech/")

后台地址：[http://frame.zhangqing.tech/admin/](http://frame.zhangqing.tech/admin/ "http://frame.zhangqing.tech/admin/")，账号密码都是 **admin**


## 安装步骤

1. 下载源文件到服务器目录
2. 执行`composer install`下载需要的库文件
3. 为了性能考虑，最好也执行一次`composer dump-autoload -o`
3. 导入`frame.sql`到数据库
4. 修改`app/common/config/config.php`里的`DB_TYPE`、`DB_HOST`、`DB_PORT`、`DB_USER`、`DB_PWD`（这些配置第一次配置完后，可登录网站后台在后台操作）
5. 设置`upload`、`app/common`目录权限为`777`
6. 修改nginx配置，`sudo vi /etc/nginx/sites-enabled/default`修改或添加以下：

```shell

    location / {
        if (!-e $request_filename){
            rewrite ^/(.*)$ /index.php?s=/$1 last;  # 这里的 “s” 变量名与配置文件里的配置文件里的“VAR_PATHINFO”值一致
        }
    }

```

> 服务器需要安装Memcache，否则部分功能受到影响

## URL组成部分

如：`http://frame.zhangqing.tech/admin/manager_setting/index.html`

- `admin` 指定应用模块，系统默认模块为`home`（可在后台配置）
- `manager_setting` 指定`ManagerSetting`控制器，系统默认控制器为`index`（可在后台配置）
- `index`指定方法名，系统默认方法为`index`（可在后台配置）

> url统一小写，多个单词用下划线`_`分隔

## 命名规范

### 文件夹命名

统一小写，多个单词用下划线`_`分隔

### 文件命

- `类文件`文件名与类名保持一致，多个单词首字母大写，以.php结尾
- `模板文件`统一小写，以控制器名做子目录（多个单词用下划线“_”分隔），方法名做文件名（多个单词用下划线“_”分隔），以.twig（可在后台配置）结尾
- `其它`统一小写，多个单词用下划线“_”分隔，以.php结尾

### 程序编写

- `class`       每个单词的首字母大写
- `action`      以驼峰方式
- `function`    小写，多个单词以“_”分隔；特殊通用函数如：C()，以大写为主，多个单词用“_”分隔
- `常量`         常量名大写，多个单词以“_”分隔
- `变量`         变量名小写，多个单词以“_”分隔

## 关于配置文件的加载先后顺序，后面配置会覆盖前面同名的配置

> `core/config/convention.php` \> `app/common/config/config.php` \> `app/模块（如：admin）/config/config.php` \> `运行时配置`

## 部分页面截图

### 后台登录页面

![后台登录页面](http://resource.zhangqing.tech/frame_demo_image/login.jpg "后台登录页面")

### 后台首页

![后台首页](http://resource.zhangqing.tech/frame_demo_image/admin_index.jpg "后台首页")

### 文章管理页面

![文章管理页面](http://resource.zhangqing.tech/frame_demo_image/admin_article_index.jpg "文章管理页面")

### 文章添加/修改页面

![文章添加/修改页面](http://resource.zhangqing.tech/frame_demo_image/admin_article_show.jpg "文章添加/修改页面")

### 资料下载添加/修改页面

![资料下载添加/修改页面](http://resource.zhangqing.tech/frame_demo_image/admin_download_show.jpg "资料下载添加/修改页面")

### 友情链接添加/修改页面

![友情链接添加/修改页面](http://resource.zhangqing.tech/frame_demo_image/admin_link_show.jpg "友情链接添加/修改页面")

### 产品添加/修改页面

![产品添加/修改页面](http://resource.zhangqing.tech/frame_demo_image/admin_product_show.jpg "产品添加/修改页面")

### 视频添加/修改页面

![视频添加/修改页面](http://resource.zhangqing.tech/frame_demo_image/admin_video_show.jpg "视频添加/修改页面")

### 后台菜单设置页面

![后台菜单设置页面](http://resource.zhangqing.tech/frame_demo_image/admin_menu.jpg "后台菜单设置页面")

### 系统设置页面

![系统设置页面](http://resource.zhangqing.tech/frame_demo_image/admin_setting.jpg "系统设置页面")

### 用户管理页面

![用户管理页面](http://resource.zhangqing.tech/frame_demo_image/admin_user_index.jpg "用户管理页面")


