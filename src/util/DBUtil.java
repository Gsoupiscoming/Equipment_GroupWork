package util;


import java.sql.*;
import java.util.*;

/**
 * 数据库执行帮助类
 */
public class DBUtil {

 public static  Connection CreateConnection() throws ClassNotFoundException, SQLException {
     Class.forName(dbconfig.driver);
     return DriverManager.getConnection(dbconfig.url,dbconfig.user,dbconfig.password);
 }
    /**
     * 执行SQL语句
     * @param sql
     * @param map
     * @return
     */
    public static boolean executeSQL(String sql, HashMap<Integer,Object> map) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        HashMap<Integer,Object> test=new HashMap<>();
        try {
            conn=CreateConnection();
            ps=conn.prepareStatement(sql);
            if(map!=null)
            {
                for(Integer i:map.keySet())
                {

                    ps.setObject(i,map.get(i));
                }
            }

            return ps.execute();

        } catch (Exception  throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
        }

        return  false;
    }
    public static boolean executeSQL(String sql) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        HashMap<Integer,Object> test=new HashMap<>();
        try {
            conn=CreateConnection();
            ps=conn.prepareStatement(sql);
            return ps.execute();

        } catch (Exception  throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
        }

        return  false;
    }
    /**
     * 执行SQL语句 返回结果集
     * @param sql
     * @param map
     * @return
     */
    public static List<Map> executeQuery(String sql, HashMap<Integer,Object> map) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        List<Map> list = new ArrayList<>();
        try {

            conn=CreateConnection();
            ps=conn.prepareStatement(sql);
            if(map!=null){
                for(Integer i:map.keySet())
                {
                    ps.setObject(i,map.get(i));
                }
            }
            
            rs=ps.executeQuery();
            ResultSetMetaData md = rs.getMetaData();//获取键名
            int columnCount = md.getColumnCount();//获取列的数量
            while (rs.next()) {
                Map<String,Object> rowData = new HashMap<>();//声明Map
                for (int i = 1; i <= columnCount; i++) {
                    rowData.put(md.getColumnName(i), rs.getObject(i));//获取键名及值
                }
                list.add(rowData);
            }

        } catch (Exception  throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }

        return  list;
    }

    /**
     * 执行SQL语句返回结果集
     * @param sql
     * @return
     * @throws SQLException
     */
    public static List<Map> executeQuery(String sql) throws SQLException {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        List<Map> list = new ArrayList<>();
        try {

            conn=CreateConnection();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            ResultSetMetaData md = rs.getMetaData();//获取键名
            int columnCount = md.getColumnCount();//获取列的数量
            while (rs.next()) {
                Map<String,Object> rowData = new HashMap<>();//声明Map
                for (int i = 1; i <= columnCount; i++) {
                    rowData.put(md.getColumnName(i), rs.getObject(i));//获取键名及值
                }
                list.add(rowData);
            }

        } catch (Exception  throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }

        return  list;
    }
}
