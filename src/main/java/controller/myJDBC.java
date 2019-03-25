package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

@Component("jdbc")
public class myJDBC{
    @Autowired
    private JdbcTemplate jdbcTemplate;


    public prescription getOne(String text) throws SQLException {

        String sql = "select * from  prescription WHERE name ='"+text+"'";

        prescription pre = jdbcTemplate.queryForObject(sql,new RowMapper<prescription>() {
            @Override
            public prescription mapRow(ResultSet resultSet, int i) throws SQLException {
                prescription pre = new prescription();
                pre.setName(resultSet.getString("name"));
                pre.setMclass(resultSet.getString("mclass"));
                pre.setSclass(resultSet.getString("sclass"));
                pre.setComponent(resultSet.getString("component"));
                pre.setEffect(resultSet.getString("effect"));
                pre.setSymptom(resultSet.getString("symptom"));
                return pre;
            }
        });

//        User user = new User();
//        Connection con = dataSource.getConnection();
//        Statement st = con.createStatement();
//        ResultSet rs = st.executeQuery(sql);
//        if (rs.next()) {
//            user.setId(rs.getInt("id"));
//            user.setUsername(rs.getString("username"));
//            user.setPassword(rs.getString("password"));
//            user.setType(rs.getString("type"));
//        }

        return pre;

    }


    public ArrayList<String> getWords(String text) throws SQLException{

        String sql="select name from  prescription WHERE name LIKE '%"+text+"%'";
        final ArrayList<String> list = new ArrayList<String>();

        jdbcTemplate.query(sql, new RowCallbackHandler() {//将结果集中的数据映射到List中

            public void processRow(ResultSet rs) throws SQLException {

                list.add(rs.getString("name"));
            }
        });

        return list;
    }


//    public static void main(String[] args) {
//
//        DriverManagerDataSource dataSource = new DriverManagerDataSource();
//        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
//        dataSource.setUrl("jdbc:mysql://39.105.199.61/test?useSSL=false");
//        dataSource.setUsername("root");
//        dataSource.setPassword("126126");
//
//        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
//        try {
//            prescription pre2=getOne("select * from  prescription WHERE name='丁香散'",jdbcTemplate);
//            System.out.println(pre2.effect);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        try {
//          System.out.println(getWords("丁香",jdbcTemplate));
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//
//    }

}

