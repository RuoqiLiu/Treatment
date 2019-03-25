package controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

import java.io.IOException;
import java.sql.SQLException;

@Controller
//@RequestMapping("/hwj")
public class HelloController {

    @RequestMapping("/main")
    public ModelAndView mymain() {
        ModelAndView mav = new ModelAndView("main");
        return mav;
    }

    @RequestMapping("/SearchName")
    public void getName(HttpServletRequest request,
                        HttpServletResponse response) {
        //获得ajax传来的参数
        String parameter = request.getParameter("text");
        response.setContentType("text/JavaScript; charset=utf-8");

        ApplicationContext context =
                new ClassPathXmlApplicationContext("dispatcher-servlet.xml");
        myJDBC jdbc = (myJDBC) context.getBean("jdbc");
        Gson gson = new Gson();

        try {
            response.getWriter().write(gson.toJson(jdbc.getWords(parameter)));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @RequestMapping("/Search")
    public void getPrescription(HttpServletRequest request,
                                HttpServletResponse response){

        String parameter = request.getParameter("text");
        response.setContentType("text/JavaScript; charset=utf-8");
        Gson gson = new Gson();
        ApplicationContext context =
                new ClassPathXmlApplicationContext("dispatcher-servlet.xml");
        myJDBC jdbc = (myJDBC) context.getBean("jdbc");

        try {
            response.getWriter().write(gson.toJson(jdbc.getOne(parameter)));
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


}

