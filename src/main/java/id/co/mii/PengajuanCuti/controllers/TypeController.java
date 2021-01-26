package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.models.*;
import id.co.mii.PengajuanCuti.repo.*;
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
public class TypeController {

    @Autowired
    private TypeRepo repo;

    @RequestMapping(value = "/Type", method = RequestMethod.GET)
    public String index(Model model) {
        List<Type> type = repo.findAll();
        model.addAttribute("types", type);
        return "TypeView";
    }

    @RequestMapping(value = "/Type/add", method = RequestMethod.POST)
    public String add(HttpServletRequest req) {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        int amount = Integer.parseInt(req.getParameter("amount")) ;
        String categoryId = req.getParameter("categoryId");
//        repo.save(new Type(id, name,amount, new Category(categoryId)));
        return "redirect:/Type";
    }

    @RequestMapping(value = "/Type/delete", method = RequestMethod.POST)
    public String delete(HttpServletRequest req) {
        String id = req.getParameter("id");
        repo.deleteById(id);
        return "redirect:/Type";
    }

}
