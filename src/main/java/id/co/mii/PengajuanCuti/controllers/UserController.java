package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.models.Employee;
import id.co.mii.PengajuanCuti.repo.EmployeeRepo;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Juang Nasution
 */
@Controller
public class UserController {
//    String encodePw = new BCryptPasswordEncoder();

    @Autowired
    private EmployeeRepo repo;

//    @RequestMapping("/")
//    public void handleRequest() {
//        throw new RuntimeException("test exception");
//    }
    @RequestMapping(value = "/", method = {RequestMethod.POST, RequestMethod.GET})
    public String loginGet() {
        return "login";
    }

    @PostMapping("/")
    public String loginPost() {
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutGet(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping("/forgot")
    public String forgot(Model model) {
        model.addAttribute("attribute", "value");
        return "forgotpassword";
    }

    @PostMapping("/changepassword")
    public ModelAndView changepasswordPost(@RequestParam("currentpassword") String currentpass,
            @RequestParam("newpassword") String newpass,
            @RequestParam("confirmpassword") String confirmpass,
            HttpServletRequest req, ModelMap model) {
        HttpSession session = req.getSession();
        String email = session.getAttribute("email").toString();
        Employee e = repo.findByemail(email);
        BCryptPasswordEncoder bcpe = new BCryptPasswordEncoder();
        if (!bcpe.matches(currentpass, e.getPassword())) {
            model.addAttribute("error", "notfind");
            return new ModelAndView("redirect:/index", model);
        } else if (!newpass.trim().equals(confirmpass)) {
            model.addAttribute("error", "notmatch");
            return new ModelAndView("redirect:/index", model);
        } else {
            String passwordHash = bcpe.encode(newpass);
            repo.save(new Employee(e.getFirstname(), e.getLastName(), email, passwordHash, e.getPhoneNumber(), e.getRemainingDays(), e.getId(), e.getRole(), e.getDepartment(), e.getJob(), e.getManager()));
            model.addAttribute("error", "false");
            return new ModelAndView("redirect:/index", model);
        }
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String indexGet(Model model) {
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public ModelAndView indexPost(@RequestParam("inputPassword") String password, @RequestParam("inputEmailAddress") String emails, HttpServletRequest req, ModelMap model) {
        Employee emp = repo.findByemail(emails);
        BCryptPasswordEncoder bcpe = new BCryptPasswordEncoder();
        if (emp == null) {
            model.addAttribute("error", "true");
            return new ModelAndView("redirect:/", model);
        } else if (bcpe.matches(password, emp.getPassword())) {
            HttpSession session = req.getSession();
            session.setAttribute("fname", emp.getFirstname());
            session.setAttribute("lname", emp.getLastName());
            session.setAttribute("role", emp.getRole().getName());
            session.setAttribute("email", emp.getEmail());
            session.setAttribute("phone", emp.getPhoneNumber());
            session.setAttribute("managerf", emp.getManager().getLastName());
            session.setAttribute("managerl", emp.getManager().getFirstname());
            session.setAttribute("idkaryawan", emp.getId());
            session.setAttribute("jobkaryawan", emp.getJob().getName());
            session.setAttribute("departkaryawan", emp.getDepartment().getName());
            session.setAttribute("amount", emp.getRemainingDays());
            session.setAttribute("department", emp.getDepartment().getName());
            return new ModelAndView("redirect:/index");
        } else {
            model.addAttribute("error", "true");
            return new ModelAndView("redirect:/", model);
        }

    }

    @RequestMapping(value = "/request", method = RequestMethod.GET)
    public String requestGet(Model model) {
        return "requestpassword";
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String createGet(Model model) {
        return "createpassword";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createPOST(@RequestParam("inputPassword") String password, @RequestParam("emails") String emails, Model model) {
        BCryptPasswordEncoder bcpe = new BCryptPasswordEncoder();
        String passwordHash = bcpe.encode(password);
        Employee e = repo.findByemail(emails);
        repo.save(new Employee(e.getFirstname(), e.getLastName(), emails, passwordHash, e.getPhoneNumber(), e.getRemainingDays(), e.getId(), e.getRole(), e.getDepartment(), e.getJob(), e.getManager()));
        return "createpassword";
    }
}
