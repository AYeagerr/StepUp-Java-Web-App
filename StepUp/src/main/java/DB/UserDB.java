package DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Model.User;

public class UserDB {
	private Connection con;
	private String query;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDB(Connection con) {
		this.con = con;
	}

	public User userLogin(String email, String pass) {
		User u = null;
		try {
			query = "select * from users where email = ? and password = ?";
			pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setActive(rs.getBoolean(5));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return u;

	}

	public boolean isAdmin(String email, String pass) {
		return email.equals("admin@gmail.com") && pass.equals("admin");
	}

	public boolean registerUser(User user) {
		try {
			String query = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());

			int result = pstmt.executeUpdate();
			return result > 0;
		} catch (SQLException e) {
			System.out.println("Error inserting user: " + e.getMessage());
			return false;
		}
	}

	public boolean checkUserExists(String email) {
		try {
			String query = "SELECT COUNT(*) FROM users WHERE email = ?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) > 0;
			}
		} catch (SQLException e) {
			System.out.println("Error checking user exists: " + e.getMessage());
		}
		return false;
	}
	
	public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try {
            query = "SELECT * FROM users";
            pstmt = this.con.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setActive(rs.getBoolean("active"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
	
	public boolean deactivateUser(int userId) {
        try {
            query = "UPDATE users SET active = 0 WHERE id = ?";
            pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, userId);

            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error deactivating user: " + e.getMessage());
            return false;
        }
    }

    public boolean activateUser(int userId) {
        try {
            query = "UPDATE users SET active = 1 WHERE id = ?";
            pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, userId);

            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.out.println("Error activating user: " + e.getMessage());
            return false;
        }
    }
    
}