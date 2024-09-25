package kr.ac.kopo.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {

    // 1. 회원 가입
    public void insertMember(MemberVO member) {
        StringBuilder sql = new StringBuilder();
        sql.append("insert into table_member (id, password, name, birth_date, phone, email, role) ");
        sql.append(" values (?, ?, ?, ?, ?, ?, ?) ");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getBirthDate());
            pstmt.setString(5, member.getPhone());
            pstmt.setString(6, member.getEmail());
            pstmt.setString(7, member.getRole());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }		
    }	// 1. end of insertMember()

    
    // 2. 회원 정보 조회 (로그인)
    public MemberVO loginMember(String id, String password) {
        MemberVO member = null;

        StringBuilder sql = new StringBuilder();
        sql.append("select id, name ");
        sql.append("	, to_char(birth_date, 'yyyy-mm-dd') birth_date ");
        sql.append("	, phone, email, role ");
        sql.append(" from table_member ");
        sql.append(" where id = ? and password = ? ");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, id);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                member = new MemberVO();
                member.setId(rs.getString("id"));
                member.setName(rs.getString("name"));
                member.setBirthDate(rs.getString("birth_date"));
                member.setPhone(rs.getString("phone"));
                member.setEmail(rs.getString("email"));
                member.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return member;
    }	// 2. end of loginMember()

    
    // 3. 마이페이지 (특정 회원 조회)
    public MemberVO selectMemberById(String id) {
        MemberVO member = null;

        StringBuilder sql = new StringBuilder();
        sql.append("select id, name ");
        sql.append("	, to_char(birth_date, 'yyyy-mm-dd') birth_date ");
        sql.append("	, phone, email, role ");
        sql.append(" from table_member ");
        sql.append(" where id = ? ");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, id);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                member = new MemberVO();
                member.setId(rs.getString("id"));
                member.setName(rs.getString("name"));
                member.setBirthDate(rs.getString("birth_date"));
                member.setPhone(rs.getString("phone"));
                member.setEmail(rs.getString("email"));
                member.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return member;
    }	// 3. end of selectMemberById()
    
    
	 	// 4. 회원 정보 수정
	    public int updateMember(MemberVO member) {
	        StringBuilder sql = new StringBuilder();
	        sql.append("update table_member ");
	        sql.append(" set password = ?, name = ?, birth_date = ?, phone = ?, email = ? ");
	        sql.append(" where id = ? ");
	        
	        int result = 0;
	
	        try (
	            Connection conn = new ConnectionFactory().getConnection();
	            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	        ) {
	            pstmt.setString(1, member.getPassword());
	            pstmt.setString(2, member.getName());
	            pstmt.setString(3, member.getBirthDate());
	            pstmt.setString(4, member.getPhone());
	            pstmt.setString(5, member.getEmail());
	            pstmt.setString(6, member.getId());
	
	            result = pstmt.executeUpdate();  // update한 행의 수를 반환한다는 점을 활용
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return result; // 따라서 0이면 수정에 실패한 것!!
	    } // 4. end of updateMember()


    
    // 5. 회원 탈퇴
    public int deleteMember(String id) {
        StringBuilder sql = new StringBuilder();
        sql.append("delete from table_member ");
        sql.append(" where id = ? ");
        
        int result = 0;

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ){
            pstmt.setString(1, id);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


    // 6. 전체회원조회 (관리자 전용)
    public List<MemberVO> selectAllMembers() {
        List<MemberVO> members = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append("select id, name ");
        sql.append("	, to_char(birth_date, 'yyyy-mm-dd') birth_date ");
        sql.append("	, phone, email, role ");
        sql.append(" from table_member ");

        try (
            Connection conn = new ConnectionFactory().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                MemberVO member = new MemberVO();
                member.setId(rs.getString("id"));
                member.setName(rs.getString("name"));
                member.setBirthDate(rs.getString("birth_date"));
                member.setPhone(rs.getString("phone"));
                member.setEmail(rs.getString("email"));
                member.setRole(rs.getString("role"));

                members.add(member);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return members;
    }	

	
}

