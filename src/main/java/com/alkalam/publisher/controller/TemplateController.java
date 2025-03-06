package com.alkalam.publisher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class TemplateController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("username", "John Doe");
        //return "pages/home";
        return "layout/dashboard";
    }

    @GetMapping("/dashboard")
    public String dashboard() {
        return "layout/dashboard";
    }

    @GetMapping("/settings")
    public String settings() {
        return "layout/settings";
    }


    @GetMapping("/team")
    public String team(Model model) {
        List<String> teamMembers = List.of("Alice", "Bob", "Charlie", "David");
        model.addAttribute("teamMembers", teamMembers);
        return "pages/team";
    }

    @GetMapping("/projects")
    public String projects(Model model) {
        model.addAttribute("username", "John Doe");
        List<String> projects = List.of("Project A", "Project B", "Project C");
        model.addAttribute("projects", projects);
        return "pages/projects";
    }


}
