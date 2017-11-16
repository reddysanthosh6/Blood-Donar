package com.c2n.blooddonar;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	
	
		public static void Sendmail(String to,String Maillink) {
		 //Get the session object
			
		/*	String link="http://localhost:8080/LFWeb/UserName";
			sendmessage.concat(link);*/
		final String From="techfortdummy@gmail.com";
		final String FromPassword="40062299";
		//String to1="prathap93g@gmail.com";
		  Properties props = new Properties();  
		  props.put("mail.smtp.host", "smtp.gmail.com");  
		  props.put("mail.smtp.socketFactory.port", "465");  
		  props.put("mail.smtp.socketFactory.class",  
		            "javax.net.ssl.SSLSocketFactory");  
		  props.put("mail.smtp.auth", "true");  
		  props.put("mail.smtp.port", "465");  
		   
		  Session session = Session.getDefaultInstance(props,  
		   new javax.mail.Authenticator() {  
		   protected PasswordAuthentication getPasswordAuthentication() {  
		   return new PasswordAuthentication(From,FromPassword);//change accordingly  
		   }  
		  });  
		  
		   //Compose the message  
		    try {  
		     MimeMessage message = new MimeMessage(session);  
		     message.setFrom(new InternetAddress(From));  
		     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
		     message.setSubject("Email From US");  
		     message.setContent(Maillink, "text/html; charset=utf-8");
		     message.saveChanges(); 
		       
		    //send the message  
		     Transport.send(message);  
		  
		     System.out.println("message sent successfully...");  
		   
		     } catch (MessagingException e) {e.printStackTrace();}  

	 }	
	/*public static void main(String[] args) {
		SendEmail.Sendmail(to, sendmessage);
	}*/
	}
	 
		  
		 		  
		 

