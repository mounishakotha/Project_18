package dbs_project;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class LoginMain {

	public static Connection getConnection(){
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","anila");
		}
		catch(Exception e){
			System.out.println(e);
		}
		return con;
	}
	
	public int check(String user, String pass){
		int status = 0;
		try{
			Connection con= getConnection();
			Statement st = con.createStatement();
			ResultSet rs= st.executeQuery("select * from user");
			while(rs.next()){
				if(rs.getString(1).equals(user) && rs.getString(2).equals(pass)){
					status=1;
					break;
				}
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
	
	public int insert(String user, String pass, String email, String num,String pos){
		int status= 0;
		try{
			Connection con= getConnection();
			PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?,?)");
			ps.setString(1,user);
			ps.setString(2,pass);
			ps.setString(3,email);
			ps.setString(4,num);
			ps.setString(5,pos);
			status= ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
	
	public int send_req(String req, String user, String type, String rem){
		int status= 0;
		try{
			Connection con= getConnection();
			PreparedStatement ps = con.prepareStatement("insert into request values(?,?,?,?,?,?)");
			ps.setString(1,req);
			ps.setString(2,user);
			ps.setString(3,type);
			ps.setString(4,rem);
			ps.setString(5,null);
			ps.setString(6,null);
			status= ps.executeUpdate();
		}
		catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
}
