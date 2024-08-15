package model;
import java.sql.*;

public class UserDAO {
	
	Connection con = Database.CON;
	
	//사용자 정보
	public UserVO read(String uid) {
		UserVO vo =new UserVO();
		try {
			String sql = "select * from users where uid=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, uid);
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				vo.setUid(rs.getString("uid"));
				vo.setUpass(rs.getString("upass"));
				vo.setUname(rs.getString("uname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress1(rs.getString("address1"));
				vo.setAddress2(rs.getString("address2"));
			}
		}catch(Exception e) {
			System.out.println("사용자정보!"+ e.toString());
		}
		
		
	return vo;	
	}
	
	//회원가입
		public void insert(UserVO vo) {
			try {
				String sql="insert into users (uid, upass, uname, address1, address2) values(?,?,?,?,?)";
				PreparedStatement ps= con.prepareStatement(sql);
				ps.setString(1, vo.getUid());
				ps.setString(2, vo.getUpass());
				ps.setString(3, vo.getUname());
				ps.setString(4,vo.getAddress1());
				ps.setString(5, vo.getAddress2());
				ps.execute();
			}catch(Exception e) {
				System.out.println("회원가입:"+ e.toString());
			}
		}
		
		//비밀번호 수정
		public void update(String uid, String npass) {
			try {
				String sql="update users set upass=? where uid=?";
				PreparedStatement ps= con.prepareStatement(sql);
				ps.setString(1, npass);
				ps.setString(2, uid);
				ps. execute();
			}catch(Exception e) {
				System.out.println("비밀번호수정:"+ e.toString());
			}
		}
		
		//정보수정
		public void update(UserVO vo) {
			try {
				String sql="update users set uname=?,phone=?,address1=?,address2=? where uid=?";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, vo.getUname());
				ps.setString(2, vo.getPhone());
				ps.setString(3, vo.getAddress1());
				ps.setString(4, vo.getAddress2());
				ps.setString(5, vo.getUid());
				ps.execute();
			}catch(Exception e) {
				System.out.println("update:" + e.toString());
			}
		}
		
		
	
}
