package dao;

import bean.sysuser;
import util.*;

import javax.annotation.processing.RoundEnvironment;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class sysuserdao {
    public int add(sysuser user) throws SQLException {
        String sql="select * from sysuser where username='"+user.getUsername()+"'";
        List<Map> map=DBUtil.executeQuery(sql);
        if(map.size()>0)
            return -1;
        String insert=String.format("insert into sysuser(username,userpwd,number,dept,truename,role,status,createtime) values('%s','%s','%s','%s','%s','用户',0,'%s')"
                ,user.getUsername(),user.getUserpwd(),user.getNumber(),user.getDept(),user.getTruename(),user.getCreatetime());
        DBUtil.executeSQL(insert);
        return 1;
    }
    public sysuser Login(String username,String userpwd,String role) throws SQLException {
        String sql="select * from sysuser where username=? and userpwd=? and role=?";
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        sysuser u=null;
        try {

            conn=DBUtil.CreateConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,userpwd);
            ps.setString(3, role);
            rs=ps.executeQuery();
            if(rs.next()) u= ResultToBean(rs);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }

        return  u;

    }
    public sysuser Get(String id) throws SQLException {
        String sql="select * from sysuser where id=?";
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        sysuser u=null;
        try {

            conn=DBUtil.CreateConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1,id);

            rs=ps.executeQuery();
            if(rs.next()) u= ResultToBean(rs);

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }

        return  u;

    }
    public int update(sysuser user) throws SQLException {

        String sql=String.format("update sysuser set username='%s',userpwd='%s',number='%s',dept='%s',truename='%s',role='%s',status=%s,createtime='%s' where id=%s"
                ,user.getUsername(),user.getUserpwd(),user.getNumber(),user.getDept(),user.getTruename(),user.getRole(),user.getStatus(),user.getCreatetime(),user.getId());
        DBUtil.executeSQL(sql);
        return 1;
    }
    public int del(String id) throws SQLException {

        String sql=String.format("delete from sysuser where id=%s",id);
        DBUtil.executeSQL(sql);
        return 1;
    }

    public List<sysuser> GetList(String where,int pageIndex,int pageSize) throws SQLException {
            List<sysuser> list=new ArrayList<>();
        String sql="select * from sysuser where 1=1 "+where;
        sql+=" order by id desc limit "+(pageIndex-1)*pageSize+","+pageSize;
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        sysuser u=null;
        try {

            conn=DBUtil.CreateConnection();
            ps=conn.prepareStatement(sql);

            rs=ps.executeQuery();
            while (rs.next())
            {
                list.add(ResultToBean(rs));
            }

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }

        return  list;
    }
    public int GetCount(String where) throws SQLException {
        int count=0;
        String sql="select count(0) counts from sysuser where 1=1 "+where;
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        sysuser u=null;
        try {

            conn=DBUtil.CreateConnection();
            ps=conn.prepareStatement(sql);

            rs=ps.executeQuery();
            rs.next();
            count=rs.getInt("counts");

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }

        return  count;
    }

    private sysuser ResultToBean(ResultSet rs) throws SQLException {
        sysuser u=new sysuser();
        u.setId(rs.getInt("id"));
        u.setCreatetime(rs.getString("createtime"));
        u.setDept(rs.getString("dept"));
        u.setNumber(rs.getString("number"));
        u.setRole(rs.getString("role"));
        u.setStatus(rs.getBoolean("status"));
        u.setTruename(rs.getString("truename"));
        u.setUsername(rs.getString("username"));
        u.setUserpwd(rs.getString("userpwd"));
        return u;

    }
}
