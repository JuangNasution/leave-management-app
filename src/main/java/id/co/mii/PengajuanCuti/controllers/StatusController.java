package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.repo.StatusRepo;
import id.co.mii.PengajuanCuti.models.Status;
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
public class StatusController {

    @Autowired
    private StatusRepo repo;

    @RequestMapping(value = "/Status", method = RequestMethod.GET)
    public String index(Model model) {
        List<Status> status = repo.findAll();
        model.addAttribute("status", status);
        return "StatusView";
    }
    @RequestMapping(value = "/Status/add", method = RequestMethod.POST)
    public String add(HttpServletRequest req) {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        repo.save(new Status(id, name));
        return "redirect:/Status";
    }
    
    @RequestMapping(value = "/Status/delete", method = RequestMethod.POST)
    public String delete(HttpServletRequest req) {
        String id = req.getParameter("id");
        repo.deleteById(id);
        return "redirect:/Status";
    }
}
