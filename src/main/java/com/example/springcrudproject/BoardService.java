package com.example.springcrudproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    @Autowired
    BoardDAO boardDAO;

    public boolean addPost(BoardVO vo) {
        int result = boardDAO.insertBoard(vo);
        return result > 0;
    }

    public boolean editPost(BoardVO vo) {
        int result = boardDAO.updateBoard(vo);
        return result > 0;
    }

    public boolean deletePost(int id) {
        int result = boardDAO.deleteBoard(id);
        return result > 0;
    }

    public BoardVO getPost(int id) {
        boardDAO.increaseCount(id);
        return boardDAO.getBoard(id);
    }

    public List<BoardVO> getPostList() {
        return boardDAO.getBoardList();
    }

    public List<BoardVO> searchPosts(String keyword) {
        return boardDAO.searchBoard(keyword);
    }

}
