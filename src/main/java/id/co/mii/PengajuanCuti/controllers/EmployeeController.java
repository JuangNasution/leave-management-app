/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.models.*;
import id.co.mii.PengajuanCuti.repo.EmployeeRepo;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author VINTHERA
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeRepo repo;

    @RequestMapping(value = "/Employee", method = RequestMethod.GET)
    public String page(Model model) {
        List<Employee> employee = repo.findAll();
        model.addAttribute("employees", employee);
        return "EmployeeView";
    }

    @RequestMapping(value = "/Employee/update", method = RequestMethod.POST)
    public String add(HttpServletRequest req) {
        List<Employee> e = repo.findAll();
        boolean isUpdate = Boolean.valueOf(req.getParameter("status"));
        for (Employee emp : e) {
            String id = emp.getId();
            String firstName = emp.getFirstname();
            String lastName = emp.getLastName();
            String email = emp.getEmail();
            String password = emp.getPassword();
            String phoneNumber = emp.getPhoneNumber();
            int remainingDays = emp.getRemainingDays();
            Role role = emp.getRole();
            Department department = emp.getDepartment();
            Employee manager = emp.getManager();
            Job job = emp.getJob();
            if (remainingDays < 24 && isUpdate) {
                repo.save(new Employee(firstName, lastName, email, password, phoneNumber, remainingDays + 12, id, role, department, job, manager));
            } else if (!isUpdate && remainingDays > 12) {
                repo.save(new Employee(firstName, lastName, email, password, phoneNumber,12, id, role, department, job, manager));
            }
        }
        return "redirect:/Employee";
    }

    @RequestMapping(value = "/Employee/delete", method = RequestMethod.POST)
    public String delete(HttpServletRequest req) {
        String id = req.getParameter("id");
        repo.deleteById(id);
        return "redirect:/Employee";
    }
}
