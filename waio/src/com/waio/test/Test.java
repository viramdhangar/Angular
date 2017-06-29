package com.waio.test;

import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.waio.service.impl.ProfileServiceImpl;

public class Test {

	public static void main(String[] args) {
// this is test commit to check
		//again test commit
		String host = "waiotech.com";
		System.out.println(host);
		/*		try {

			boolean sessionDebug = true;
			Properties props = System.getProperties();
			props.put("mail.smtp.starttls.enable", "true");

			props.put("mail.smtp.host", host);
			props.put("mail.transport.protocol.", "smtp");
			props.put("mail.smtp.user", "viram@waiotech.com"); // User name
			props.put("mail.smtp.password", "Ramkishan@1"); // password

			props.put("mail.smtp.auth", "true");
			// props.put("mail.smtp.", "true");
			props.put("mail.smtp.port", "587");

			Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("viram@waiotech.com", "Ramkishan@1");
				}
			});
			mailSession.setDebug(sessionDebug);
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress("viram@waiotech.com"));
			InternetAddress[] address = { new InternetAddress("waiosystem@gmail.com") };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject("Testing mail server vinod");
			msg.setSubject("Testing mail server vinod");
			BodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setText("HI GARI CODE IS WORKING NOW");
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			messageBodyPart = new MimeBodyPart();
			msg.setContent(multipart, "text/html"); // use setText if you want
													// to send text

			Transport.send(msg);
			System.out.println("sent");
			// WasEmailSent = true; // assume it was sent
		} catch (Exception err) {
			// WasEmailSent = false; // assume it's a fail
			System.out.println("Error" + err.getMessage());
		}*/
			
		ProfileServiceImpl pr = new ProfileServiceImpl();
		
		pr.getFeeDetails("1");
	}

}
