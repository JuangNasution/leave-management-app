package id.co.mii.PengajuanCuti.controllers;

import id.co.mii.PengajuanCuti.models.Leavedata;
import id.co.mii.PengajuanCuti.repo.LeaveDataRepo;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author VINTHERA
 */
@Controller
public class LeaveDataController {
    
   @Autowired
    private LeaveDataRepo repo;

    @GetMapping("/updateamount")
    public ModelAndView updateamount(ModelMap model) {
        int month = Calendar.getInstance().get(Calendar.MONTH);
        int day = Calendar.getInstance().get(Calendar.DATE);
        if(month == 4 && (day>=1 || day<=14)){
            model.addAttribute("status", "update");
            return new ModelAndView("redirect:/test", model);
        }else{
            return new ModelAndView("redirect:/test");
        }
    }
    @GetMapping("/test")
    public String test(){
        return "updateamount";
    }
    
}
