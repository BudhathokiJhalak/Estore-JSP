/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.estore.dao.impl;

import com.leapfrog.estore.dao.ProductDAO;
import com.leapfrog.estore.dbutil.DbConnection;
import com.leapfrog.estore.util.Product;
import com.sun.corba.se.spi.presentation.rmi.StubAdapter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author zak
 */
public class ProductDAOImpl implements ProductDAO {

    DbConnection db = new DbConnection();

    @Override
    public int insert(Product product) throws ClassNotFoundException, SQLException {
        db.open();
        String sql = "INSERT INTO product(name, description, price, status) VALUES(?,?,?,?)";
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setString(1, product.getName());
        stmt.setString(2, product.getDescription());
        stmt.setDouble(3, product.getPrice());
        stmt.setBoolean(4, product.isStatus());
        int result = db.executeUpdate();
        db.close();
        return result;
    }

    @Override
    public int update(Product product) throws ClassNotFoundException, SQLException {
        db.open();
        String sql = "UPDATE product SET name=?, description=?, price=?, status=? WHERE product_id=?";
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setString(1, product.getName());
        stmt.setString(2, product.getDescription());
        stmt.setDouble(3, product.getPrice());
        stmt.setBoolean(4, product.isStatus());
        stmt.setInt(5, product.getId());
        int result = db.executeUpdate();
        db.close();
        return result;
    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        db.open();
        String sql = "DELETE FROM product WHERE product_id=?";
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);
        int result = db.executeUpdate();
        db.close();
        return result;
    }

    @Override
    public Product getById(int id) throws ClassNotFoundException, SQLException {
        Product product = null;
        db.open();
        String sql = "SELECT * FROM product WHERE product_id=?";
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            product = new Product();
            product.setId(rs.getInt("product_id"));
            product.setName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setStatus(rs.getBoolean("status"));
        }
        db.close();
        return product;
    }

    @Override
    public List<Product> getAll() throws ClassNotFoundException, SQLException {
        List<Product> productList = new ArrayList<>();
        db.open();
        String sql = "SELECT * FROM product";
        db.initStatement(sql);
        ResultSet rs = db.executeQuery();
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("product_id"));
            product.setName(rs.getString("name"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));;
            product.setStatus(rs.getBoolean("status"));
            productList.add(product);
        }
        db.close();
        return productList;
    }

}
