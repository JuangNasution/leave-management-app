package id.co.mii.PengajuanCuti.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Juang Nasution
 */
@Controller
public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {

    @RequestMapping("/error")
    @ResponseBody
    public ModelAndView handleError(HttpServletRequest request) {
//        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
//        Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");
//        return String.format("<html><body><h2>Error Page</h2><div>Status code: <b>%s</b></div>"
//                + "<div>Exception Message: <b>%s</b></div><body></html>",
//                statusCode, exception == null ? "N/A" : exception.getMessage());
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        if (statusCode == 500) {
            return new ModelAndView("redirect:/error500");
        } else if (statusCode == 404) {
            return new ModelAndView("redirect:/error404");

        }
        return new ModelAndView("redirect:/error500");

    }

    @RequestMapping("/error500")
    public String error505() {
        return "error500";
    }

    @RequestMapping("/error404")
    public String error404() {
        return "error404";
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }

}
