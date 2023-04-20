package com.kgisl.employeeproject;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class EmployeeFileController {

    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("document[]") MultipartFile file) throws URISyntaxException {
        System.out.println("hiii");
        if (!file.isEmpty()) {
            try {
                // Get the file bytes and create a Path object for the file
                byte[] bytes = file.getBytes();
                // Path path = Paths.get("classpath:/uploads/" + file.getOriginalFilename());
                Path path = Paths.get("C:/uploads/" + file.getOriginalFilename());
                // Write the file bytes to the Path object
                Files.write(path, bytes);
                // Return success response
                return "redirect:/success";
            } catch (IOException e) {
                // Handle file write error
                return "redirect:/error";
            }
        } else { // Handle empty file error
            return "redirect:/error";
        }
    }

    @GetMapping("/success")
    public String success() {
        return "success";
    }

    @GetMapping("/error")
    public String error() {
        return "error";
    }
}
