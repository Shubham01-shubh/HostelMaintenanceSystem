package com.hostel.dao;

import com.hostel.model.Complaint;
import com.hostel.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ComplaintDAO {

    // 1. Method to Raise a Complaint (Updated to use try-with-resources)
    public boolean raiseComplaint(int userId, int categoryId, String title, String description, String roomNo) {
        boolean status = false;
        String sql = "INSERT INTO complaints (user_id, category_id, title, description, room_no) VALUES (?, ?, ?, ?, ?)";
        
        // Auto-closes Connection and PreparedStatement
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            ps.setInt(2, categoryId);
            ps.setString(3, title);
            ps.setString(4, description);
            ps.setString(5, roomNo);

            int rows = ps.executeUpdate();
            if (rows > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // 2. Method to Count Complaints (No changes needed, already efficient)
    public int getCount(int userId, String status) {
        int count = 0;
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM complaints WHERE user_id = ?");
        
        if (status != null) {
            sql.append(" AND status = ?");
        }

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {
            
            ps.setInt(1, userId);
            if (status != null) {
                ps.setString(2, status);
            }
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    // 3. Method to Fetch All Complaints (Added NULL check for list safety)
    public List<Complaint> getComplaintsByUser(int userId) {
        List<Complaint> list = new ArrayList<>();
        String sql = "SELECT c.*, cat.name as category_name FROM complaints c " +
                     "JOIN categories cat ON c.category_id = cat.category_id " +
                     "WHERE c.user_id = ? ORDER BY c.created_at DESC";
                     
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Complaint c = new Complaint();
                    c.setComplaintId(rs.getInt("complaint_id"));
                    c.setCategoryName(rs.getString("category_name"));
                    c.setTitle(rs.getString("title"));
                    c.setStatus(rs.getString("status"));
                    c.setCreatedAt(rs.getTimestamp("created_at"));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}