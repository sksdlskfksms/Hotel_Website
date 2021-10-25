package com.spring.biz.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.spring.biz.user.UserVO;


public class MailUtil {
	public void mailSendNaver(UserVO vo) {

		String host = "smtp.naver.com";  // 메일전송서버주소
		String adminUser = "alapo@naver.com"; // 관리자 계정
		String adminPassword = "azak87531a!"; // 관리자 PW

		// SMTP 서버 설정.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(adminUser, adminPassword);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(adminUser));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(adminUser));//수신자 email주소

			// 송신 제목
			message.setSubject("[Tourist] "+ vo.getId() + "님이 매니저 권한을 요청했습니다.");

			// 메일 내용
			String cont = "사용자 : " + vo.toString();
			// message.setText(vo.toString());
			// 메일 내용형식 설정		
			message.setContent(cont, "text/html; charset=UTF-8");
			
			// 전송처리
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}
}