package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.models.Department;
import id.co.mii.PengajuanCuti.repo.DepartmentRepo;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
public class DepartmentController {

    @Autowired
    private DepartmentRepo repo;

    @RequestMapping(value = "/Department", method = RequestMethod.GET)
    public String page(Model model) {
        List<Department> department = repo.findAll();
        model.addAttribute("departments", department);
        return "DepartmentView";
    }

    @RequestMapping(value = "/Department/add", method = RequestMethod.POST)
    public String add(HttpServletRequest req) {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        repo.save(new Department(id, name));
        return "redirect:/Department";
    }

    @RequestMapping(value = "/Department/delete", method = RequestMethod.POST)
    public String delete(HttpServletRequest req) {
        String id = req.getParameter("id");
        repo.deleteById(id);
        return "redirect:/Department";
    }

}
