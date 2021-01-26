package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.models.*;
import id.co.mii.PengajuanCuti.repo.*;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Juang Nasution
 */
@Controller
public class RequestController {

    @Autowired
    private TypeRepo repo;
    @Autowired
    private LeaveDataRepo repoLeave;
    @Autowired
    private EmployeeRepo repoEmployee;

    @RequestMapping("/requestleave")
    public String page(Model model) {
        List<Type> types = repo.findAll();
        model.addAttribute("types", types);
        return "requestleave";
    }

    @RequestMapping(value = "/response", method = RequestMethod.GET)
    public String approvePage(HttpServletRequest req, Model model) {
        HttpSession session = req.getSession();
        List<Leavedata> leavedatas = repoLeave.findBystatus(new Status("S01"));
        session.setAttribute("datas", leavedatas);
        return "response";
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String historyPage(HttpServletRequest req, Model model) {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("email");
        Employee emp = repoEmployee.findByemail(email);
        List<Leavedata> leavedatas = repoLeave.findByemployee(emp);
        Collections.reverse(leavedatas);
        session.setAttribute("dataHistory", leavedatas);
        return "history";
    }

}
