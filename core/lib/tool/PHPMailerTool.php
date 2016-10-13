<?php
/**
 *
 * @author zhang qing <490702087@qq.com>
 * @since  2016/10/8 0008 上午 11:40
 */
namespace core\lib\tool;
use core\lib\Tool;

class PHPMailerTool extends Tool{

    public function sendResetPasswordLink($userid, $email, $username){
        $data=array(
            'ec'        => 500,
            'em'        => '发送失败'
        );

        $site_name      =C('SITE_NAME');
        $webroot_path   =WEBROOT_PATH;
        $expire         =NOW_TIME+(60*60);  // 确认链接过期时间 1 小时
        $expire_time    =date('Y-m-d H:i', $expire);
        $reset_code     =uniqid();

        $mail=$this->ctx->PHPMailer;
        $mail->setLanguage('zh_cn');
        $mail->CharSet='UTF-8';

        //$mail->SMTPDebug = 3;                               // Enable verbose debug output

        $mail->isSMTP();                                      // Set mailer to use SMTP
        $mail->Host     = C('MAIL_SMTP_HOST');  // Specify main and backup SMTP servers
        $mail->SMTPAuth = true;                               // Enable SMTP authentication
        $mail->Username = C('MAIL_SMTP_USERNAME');                 // SMTP username
        $mail->Password = C('MAIL_SMTP_PASSWORD');                           // SMTP password
        $mail->SMTPSecure = C('MAIL_SMTP_SMTPSECURE');                            // Enable TLS encryption, `ssl` also accepted
        $mail->Port = C('MAIL_SMTP_PORT');                                    // TCP port to connect to

        $mail->setFrom(C('MAIL_SMTP_USERNAME'), $site_name);
        $mail->addAddress($email, $username);     // Add a recipient

        $mail->isHTML(true);                                  // Set email format to HTML

        $mail->Subject = '密码找回';
        $mail->Body    = <<<CON
亲爱的用户 {$username}：您好！<br><br>
您在访问<b>{$site_name}</b>网站时点击了“<span style="color:red;">找回密码</span>”链接，这是一封密码重置确认邮件。假如这不是您本人所申请, 请不用理会这封电子邮件。<br><br>
要使用新的密码, 请使用以下链接启用密码。<br><br>
<a href="{$webroot_path}admin/public/reset_password/userid/{$userid}/code/{$reset_code}.html" target="_blank">{$webroot_path}admin/public/reset_password/userid/{$userid}/code/{$reset_code}.html</a><br><br>(如果无法点击该URL链接地址，请将它复制并粘帖到浏览器的地址输入框，然后单击回车即可。该链接使用后将立即失效。)<br><br>
注意:请您在收到邮件1个小时内({$expire_time}前)使用，否则该链接将会失效。<br><br>
CON;

        if(!$mail->send()) {
            $data['em']=$mail->ErrorInfo;
        } else {
            $option=array(
                'expire'=>$expire,
                'prefix'=>'resetpwd_code_',
            );
            S($reset_code, $reset_code, $option);
            $data['ec']=200;
            $data['em']="请进入 {$email} 邮箱确认操作";
        }

        return $data;
    }
}