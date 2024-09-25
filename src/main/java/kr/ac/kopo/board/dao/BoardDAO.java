package kr.ac.kopo.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {
	
    // 1. 게시글 상세 조회
    public BoardVO selectBoard(int no) {
        BoardVO board = null;
        StringBuilder sql = new StringBuilder();
        sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
        sql.append(" from table_board where no = ? ");

        try(
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setInt(1, no);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                String title = rs.getString("title");
                String writer = rs.getString("writer");
                String content = rs.getString("content");
                int viewCnt = rs.getInt("view_cnt");
                String regDate = rs.getString("reg_date");

                board = new BoardVO(no, title, writer, content, viewCnt, regDate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return board;
    }   // end of selectBoard

    
    // 2. 게시글 작성
    public void insertBoard(String title, String id, String content) {
        StringBuilder sql = new StringBuilder();
        sql.append("insert into table_board(no, title, writer, content) ");
        sql.append(" values(seq_table_board_no.nextval, ?, ?, ?) ");

        try(
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, title);
            pstmt.setString(2, id);
            pstmt.setString(3, content);

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }	// end of insertBoard

    
        // 3. 전체 게시글 조회
        public List<BoardVO> selectAllBoards() {
            List<BoardVO> list = new ArrayList<>();

            StringBuilder sql = new StringBuilder();
            sql.append("select no, title, writer, content, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date ");
            sql.append(" from table_board ");
            sql.append(" order by no ");

            try(
                Connection conn = new ConnectionFactory().getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql.toString());
            ) {
                ResultSet rs = pstmt.executeQuery();
                while(rs.next()) {
                    int no = rs.getInt("no");
                    String title = rs.getString("title");
                    String writer = rs.getString("writer");
                    String content = rs.getString("content");
                    String regDate = rs.getString("reg_date");

                    BoardVO board = new BoardVO(no, title, writer, content, regDate);
                    list.add(board);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return list;
        }   // end of selectAllBoards


    // 4. 게시글 수정
    public void updateBoard(BoardVO board) {
        StringBuilder sql = new StringBuilder();
        sql.append("update table_board ");
        sql.append(" set title = ?, content = ? ");
        sql.append(" where no = ? ");

        try(
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getNo());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }   // end of updateBoard

    
    // 5. 게시글 삭제
    public void deleteBoard(int no) {
        StringBuilder sql = new StringBuilder();
        sql.append("delete from table_board ");
        sql.append(" where no = ? ");

        try(
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setInt(1, no);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }   // end of deleteBoard
}

