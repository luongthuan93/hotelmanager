/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

/**
 *
 * @author lamde
 */
@Service
public class EmailService {

    private final TemplateEngine templateEngine;

    private final JavaMailSender javaMailSender;

    public EmailService(TemplateEngine templateEngine, JavaMailSender javaMailSender) {
        this.templateEngine = templateEngine;
        this.javaMailSender = javaMailSender;
    }

    public String sendMail(BookingEntity booking, String confirmationUrl) throws MessagingException, UnsupportedEncodingException {
        Context context = new Context();
        context.setVariable("booking", booking);
        context.setVariable("confirmationUrl", confirmationUrl);
        String subject = "Thank you for your reservation!!!";
        String senderName = "HOTEL LMT";
        String process = templateEngine.process("email", context);
        javax.mail.internet.MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);
        helper.setFrom("lam570872@gmail.com", senderName);
        helper.setSubject(subject);
        helper.setText(process, true);
        helper.setTo(booking.getEmail());
        javaMailSender.send(mimeMessage);
        return "Sent";
    }

}
