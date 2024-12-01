package com.example.springcrudproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Service
public class BoardService {

    @Autowired
    BoardDAO boardDAO;

    @RequestMapping(value = "/board/addok", method = RequestMethod.POST)
    public String addPostOK(BoardVO vo) {
        int i = boardDAO.insertBoard(vo);
        if (i == 0)
            System.out.println("데이터 추가 실패 ");
        else
            System.out.println("데이터 추가 성공!!!");
        return "redirect:list";
    }

//    @RequestMapping(value = "/board/editok/{id}", method = RequestMethod.POST)
//    public String editPostOK(BoardVO vo, @PathVariable int id) {
//        vo.setId(id);
//
//    }
}
