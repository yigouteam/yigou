package com.yigou.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

/**SMTP则是负责邮件服务器与邮件服务器之间的寄信的通讯协定(发送邮件需要开启)*/
public class MailUitls {
	
	public static void sendEmail(String receiver, String code) throws Exception{
		Properties prop = new Properties();
		// 开启debug调试，以便在控制台查看
		prop.setProperty("mail.debug", "true"); 
		// 设置邮件服务器主机名
		prop.setProperty("mail.host", "smtp.qq.com");
		// 发送服务器需要身份验证
		prop.setProperty("mail.smtp.auth", "true");
		// 发送邮件协议名称
		prop.setProperty("mail.transport.protocol", "smtp");

		// 开启SSL加密，否则会失败
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.socketFactory", sf);

		// 创建session
		Session session = Session.getInstance(prop);
		// 通过session得到transport对象
		Transport ts = session.getTransport();
		// 连接邮件服务器：邮箱类型，帐号，授权码代替密码（更安全）
		ts.connect("smtp.qq.com","1194575930", "mupbmpknibqvbacj");//后面的字符是授权码，用qq密码反正我是失败了（用自己的，别用我的，这个号是我瞎编的，为了。。。。）
		// 创建邮件
		Message message = createSimpleMail(session, receiver, code);
		// 发送邮件
		ts.sendMessage(message, message.getAllRecipients());
		ts.close();
		
	}

	public static MimeMessage createSimpleMail(Session session, String receiver, String code)
			throws Exception {
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress("1194575930@qq.com"));
		// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
		// 邮件的标题
		message.setSubject("易购网账号激活");
		
		String htmltext = " <h1> 尊敬的用户, </h1> <br><p style=\"font-size: 20px;\">您已成功注册，您的激活码是："+code+"<br>请复制您的激活码，点击以下链接进行账号激活：" + "<a href=\"http://localhost:8080/yigou/registerSuccess\" >是兄弟就来点我</a></p>";
		message.setContent(htmltext, "text/html;charset=UTF-8");
		// 返回创建好的邮件对象
	
		return message;
	}
}
