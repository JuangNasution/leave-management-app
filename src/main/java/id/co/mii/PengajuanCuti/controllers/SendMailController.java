package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.models.*;
import id.co.mii.PengajuanCuti.repo.*;
import java.io.StringWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Juang Nasution
 */
@Controller
public class SendMailController {

    @Autowired
    private EmployeeRepo repoEmployee;
    @Autowired
    private TypeRepo repo;
    @Autowired
    private LeaveDataRepo repoLeave;

    @RequestMapping(value = "/sendmail", method = RequestMethod.GET)
    public String forgotGet(Model model) {
        return "createpassword";
    }

    @RequestMapping(value = "/sendmail", method = RequestMethod.POST)
    public ModelAndView forgotPost(@RequestParam("inputEmailForgot") String email, ModelMap model) {
        Employee emp = repoEmployee.findByemail(email);
        if (emp == null) {
            model.addAttribute("error", "true");
            return new ModelAndView("redirect:/forgot", model);
        } else {
            sendForgot(email, "http://localhost:8084/create?email=" + email, emp.getFirstname(), "resetPassword.vm", "Reset Password ");
            model.addAttribute("error", "false");
            return new ModelAndView("redirect:/forgot", model);
        }
    }

    @RequestMapping(value = "/request", method = RequestMethod.POST)
    public ModelAndView requestPost(@RequestParam("inputEmailAddress") String email, ModelMap model) {
        Employee emp = repoEmployee.findByemail(email);
        if (emp != null) {
            model.addAttribute("email", email);
            sendForgot(email, "http://localhost:8084/create?email=" + email, emp.getFirstname(), "resetPassword.vm", "Create Password");
            model.addAttribute("error", "false");
            return new ModelAndView("redirect:/request", model);
        } else {
            model.addAttribute("error", "true");
            return new ModelAndView("redirect:/request", model);
        }
    }

    @RequestMapping(value = "/requestleave/crud", method = RequestMethod.POST)
    public String add(HttpServletRequest req) throws ParseException {
        String email = req.getParameter("email");
        String type = req.getParameter("type");
        String startdate = req.getParameter("startdate");
        String enddate = req.getParameter("enddate");
        String detail = req.getParameter("detail");
        Type type1 = repo.findByname(type);
        String id = req.getParameter("id");
        String status = req.getParameter("status");
        String detailM = req.getParameter("detailM");
        boolean isInsert = Boolean.parseBoolean(req.getParameter("isInsert"));
        try {
            if (isInsert) {
                Employee emp = repoEmployee.findByemail(email);
                sendForgot(email, "http://localhost:8084/", emp.getManager().getFirstname(), "sendApproval.vm", "Request Leave ");
                repoLeave.save(new Leavedata("0", toDate(startdate), toDate(enddate), detail, null, new Status(status), new Employee(emp.getId()), new Employee(emp.getManager().getId()), new Type(type1.getId())));
            } else {
                Leavedata l = repoLeave.getOne(id);
                Employee emp = l.getEmployee();
                Long temp = l.getEndDate().getTime() - l.getStartDate().getTime();
                if (status.equals("S02")) {
                    int amountLeave = (int) (temp / 86400000);
                    int remainingLeave = emp.getRemainingDays();
                    int remainingNow = remainingLeave - amountLeave;
                    repoEmployee.save(new Employee(emp.getFirstname(), emp.getLastName(), emp.getEmail(), emp.getPassword(), emp.getPhoneNumber(), remainingNow, emp.getId(), emp.getRole(), emp.getDepartment(), emp.getJob(), emp.getManager()));
                }

                repoLeave.save(new Leavedata(id, l.getStartDate(), l.getEndDate(), l.getNote(), detailM, new Status(status), l.getEmployee(), l.getManager(), l.getType()));

            }
        } catch (ParseException ex) {
            Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:/";
    }

    public static void send(String from, String password, String to, String sub, String filename) {
        //Get properties object    
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        //get Session   
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });
        //compose message    
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            Address address = new InternetAddress(from);
            message.setFrom(address);
            message.setSubject(sub);
            message.setContent(filename, "text/html; charset=utf-8");
            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void sendForgot(String to, String path, String name, String file, String title) {
        VelocityEngine ve = new VelocityEngine();
        ve.setProperty(RuntimeConstants.RESOURCE_LOADER, "classpath");
        ve.setProperty("classpath.resource.loader.class", ClasspathResourceLoader.class.getName());
        ve.init();
        Date date = new Date();
        long time = date.getTime();
        Timestamp ts = new Timestamp(time);
        VelocityContext context = new VelocityContext();
        context.put("lastname", name);
        context.put("resetPasswordLink", path);
        context.put("date", "30 minutes");
        org.apache.velocity.Template t = ve.getTemplate(file);
        StringWriter writer = new StringWriter();
        t.merge(context, writer);
        String htmlFile = writer.toString();
        send("bootcamp34mii@gmail.com", "Bootcamp34", to, title + time, htmlFile);
    }

    public java.sql.Date toDate(String date) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");
        java.util.Date date1 = sdf.parse(date);
        java.sql.Date sqldate = new java.sql.Date(date1.getTime());
        return sqldate;
    }
}
