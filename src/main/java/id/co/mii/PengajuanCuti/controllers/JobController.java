package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.models.Job;
import id.co.mii.PengajuanCuti.repo.JobRepo;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Juang Nasution
 */
@Controller
public class JobController {

    @Autowired
    private JobRepo repo;

    @GetMapping()
    @RequestMapping(value = "/Job", method = RequestMethod.GET)
    public String index(Model model) {
        List<Job> job = repo.findAll();
//        List<Job> jobs = repo.findBystatus(true);
        model.addAttribute("jobs", job);
        return "JobView";
    }

    @PostMapping
    @RequestMapping(value = "/Job/crud", method = RequestMethod.POST)
    public String add(HttpServletRequest req) {
        String name = req.getParameter("name");
        System.out.println(name);
        String id = req.getParameter("id");
        boolean isDelete = Boolean.parseBoolean(req.getParameter("isDelete"));
        if (isDelete) {
            Job jobs = repo.getOne(id);
            repo.save(new Job(id, jobs.getName(), false));
        } else {
            if(id.isEmpty()) repo.save(new Job("0", name, true));
            else repo.save(new Job(id, name, true));
        }
        return "redirect:/Job";
    }

}
