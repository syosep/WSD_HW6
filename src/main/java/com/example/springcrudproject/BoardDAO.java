package com.example.springcrudproject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BoardDAO {

    // Connection conn = null;
    // PreparedStatement stmt = null;
    // ResultSet rs = null;

    @Autowired
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    private final String BOARD_INSERT = "INSERT INTO BOARD (title, writer, content) VALUES (?, ?, ?)";
    private final String BOARD_UPDATE = "UPDATE BOARD SET title=?, writer=?, content=? WHERE seq=?";
    private final String BOARD_DELETE = "DELETE FROM BOARD WHERE seq=?";
    private final String BOARD_GET = "SELECT * FROM BOARD WHERE seq=?";
    private final String BOARD_LIST = "SELECT * FROM BOARD ORDER BY seq DESC";
    private final String BOARD_SEARCH = "SELECT * FROM BOARD WHERE title LIKE ? OR writer LIKE ? ORDER BY seq DESC";
    private final String BOARD_UPDATE_COUNT = "UPDATE BOARD SET cnt = cnt + 1 WHERE seq=?";

    public int insertBoard(BoardVO vo) {
        return template.update(BOARD_INSERT, new Object[]{vo.getTitle(), vo.getWriter(), vo.getContent()});
    }

    public int deleteBoard(int id) {
        return template.update(BOARD_DELETE, id);
    }

    public int updateBoard(BoardVO vo) {
        return template.update(BOARD_UPDATE, new Object[]{vo.getTitle(), vo.getWriter(), vo.getContent(), vo.getSeq()});
    }

    public BoardVO getBoard(int seq) {
        return template.queryForObject(BOARD_GET, new Object[] {seq}, new BeanPropertyRowMapper<>(BoardVO.class));
    }

    public List<BoardVO> getBoardList() {
        return template.query(BOARD_LIST, new RowMapper<BoardVO>() {

            @Override
            public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                BoardVO data = new BoardVO();
                data.setSeq(rs.getInt("seq"));
                data.setTitle(rs.getString("title"));
                data.setWriter(rs.getString("writer"));
                data.setRegdate(rs.getString("regdate"));
                data.setCnt(rs.getInt("cnt"));
                return data;
            }
        });
    }

    public List<BoardVO> searchBoard(String keyword) {
        String searchKeyword = "%" + keyword + "%";
        return template.query(BOARD_SEARCH, new Object[] {searchKeyword}, new BeanPropertyRowMapper<>(BoardVO.class));
    }

    public int increaseCount(int seq) {
        return template.update(BOARD_UPDATE_COUNT, seq);
    }
}
