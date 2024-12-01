package com.example.springcrudproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

    @RequestMapping(value = "/board/list", method = RequestMethod.GET)
    public String boardlist(Model model) {
        model.addAttribute("list", boardService.getPostList());
        return "board/list";
    }

    @RequestMapping(value = "/board/add", method = RequestMethod.GET)
    public String addPostForm() {
        return "board/add";
    }

    @RequestMapping(value = "/board/addok", method = RequestMethod.POST)
    public String addPost(BoardVO vo) {
        if (boardService.addPost(vo)) {
            System.out.println("게시글 작성 성공!");
        } else {
            System.out.println("게시글 작성 실패!");
        }
        return "redirect:/board/list";
    }

    @RequestMapping(value = "/board/edit/{id}", method = RequestMethod.GET)
    public String editPostForm(@PathVariable("id") int id, Model model) {
        BoardVO boardVO = boardService.getPost(id);
        model.addAttribute("boardVO", boardVO);
        return "board/edit";
    }

    @RequestMapping(value = "/board/editok", method = RequestMethod.POST)
    public String editPost(BoardVO vo) {
        if (boardService.editPost(vo)) {
            System.out.println("게시글 수정 성공!");
        } else {
            System.out.println("게시글 수정 실패!");
        }
        return "redirect:/board/list";
    }

    @RequestMapping(value = "/board/delete/{id}", method = RequestMethod.GET)
    public String deletePsot(@PathVariable("id") int id) {
        if (boardService.deletePost(id)) {
            System.out.println("게시글 삭제 성공!");
        } else {
            System.out.println("게시글 삭제 실패!");
        }
        return "redirect:/board/list";
    }

    @RequestMapping(value = "/board/view/{id}", method = RequestMethod.GET)
    public String viewPost(@PathVariable("id") int id, Model model) {
        BoardVO boardVO = boardService.getPost(id);
        model.addAttribute("boardVO", boardVO);
        return "board/view";
    }

    @RequestMapping(value = "/board/search", method = RequestMethod.GET)
    public String searchPosts(@RequestParam("keyword") String keyword, Model model) {
        model.addAttribute("list", boardService.searchPosts(keyword));
        return "board/list";
    }
}
