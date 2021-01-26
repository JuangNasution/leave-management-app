package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.repo.CategoryRepo;
import id.co.mii.PengajuanCuti.models.Category;
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
public class CategoryController {

    @Autowired
    private CategoryRepo repo;

    @RequestMapping(value = "/Category", method = RequestMethod.GET)
    public String page(Model model) {
        List<Category> category = repo.findAll();
        model.addAttribute("categories", category);
        return "CategoryView";
    }
    @RequestMapping(value = "/Category/add", method = RequestMethod.POST)
    public String add(HttpServletRequest req) {
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        repo.save(new Category(id, name));
        return "redirect:/Category";
    }

    @RequestMapping(value = "/Category/delete", method = RequestMethod.POST)
    public String delete(HttpServletRequest req) {
        String id = req.getParameter("id");
        repo.deleteById(id);
        return "redirect:/Category";
    }
}
