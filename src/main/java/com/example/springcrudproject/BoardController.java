package com.example.springcrudproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

    @Autowired
    BoardDAO boardDAO;

    @RequestMapping(value = "/board/list", method = RequestMethod.GET)
    public String boardlist(Model model) {
        model.addAttribute("list", boardDAO.getBoardList());
        return "post";
    }

    @RequestMapping(value = "/board/add", method = RequestMethod.GET)
    public String addPost() {
        return "/board/add";
    }

    @RequestMapping(value = "/board/editpost/{id}", method = RequestMethod.GET)
    public String editPost(@PathVariable("id") int id, Model model) {
        BoardVO boardVO = boardDAO.getBoard(id);
        model.addAttribute("boardVO", boardVO);
        return "/board/editpost/{id}";
    }
}
