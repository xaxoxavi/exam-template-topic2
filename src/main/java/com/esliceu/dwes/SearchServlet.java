package com.esliceu.dwes;

import com.esliceu.dwes.model.CameraName;
import com.esliceu.dwes.model.Photos;
import com.esliceu.dwes.model.RoverName;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/searchForm")
public class SearchServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

       Rovers roverApi = (Rovers) Context.getContext().getBean("roversApi");

       //Faig aixo perque no vull acoblar el tipus RoverName ni CameraName amb la vista
       List<String> cameraNames = new ArrayList<>();
       roverApi.getAllCameraNames().forEach(cameraName -> cameraNames.add(cameraName.name()));

       List<String> roverNames = new ArrayList<>();
       roverApi.getAllRoverNames().forEach(roverName -> roverNames.add(roverName.name()));

       req.setAttribute("cameras",cameraNames);
       req.setAttribute("rovers",roverNames);

       req.getRequestDispatcher("search.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cameraName = req.getParameter("camera");
        String rover = req.getParameter("rover");
        String sol = req.getParameter("sol");
        String page = req.getParameter("page");

        req.setAttribute("rover",rover);
        req.setAttribute("sol",sol);
        req.setAttribute("camera",cameraName);

        Rovers roverApi = (Rovers) Context.getContext().getBean("roversApi");
        Photos photos = roverApi.getPhotos(RoverName.valueOf(rover),Integer.parseInt(sol),CameraName.valueOf(cameraName),page != null ? Integer.parseInt(page) : null);

        req.setAttribute("photos",photos);
        req.setAttribute("size",photos.getSize());
        req.getRequestDispatcher("album.jsp").forward(req,resp);

    }
}
