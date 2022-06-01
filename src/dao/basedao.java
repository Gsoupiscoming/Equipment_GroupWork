package dao;

import bean.sysuser;
import util.DBUtil;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class basedao<T> {
    public boolean add(T tClass) throws IllegalAccessException, InstantiationException, SQLException {

        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
         try {
             Object obj = tClass.getClass().newInstance();
             String name=obj.getClass().getSimpleName();
             Field[] fields = obj.getClass().getDeclaredFields();
             List<String> fileds=new ArrayList<>();
             List<String> vfileds=new ArrayList<>();
             List<Object> objects=new ArrayList<>();
             for (int i = 0; i < fields.length; i++) {
                 fields[i].setAccessible(true);
                 Object obj2=fields[i].get(tClass);
                 if(obj2!=null)
                 {
                     String fname=fields[i].getName();
                     if(!fname.equals("id"))
                     {

                         fileds.add("`"+fname+"`");
                         vfileds.add("?");
                         objects.add(obj2);
                     }


                 }
             }
             String sql="insert into "+name+"("+String.join(",",fileds)+") values ("+String.join(",",vfileds)+")";
             conn= DBUtil.CreateConnection();
             ps=conn.prepareStatement(sql);

             for (int i = 0; i < objects.size(); i++) {
                 ps.setObject(i+1, objects.get(i));

             }


             return ps.execute();


        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }
        return false;
    }
    public boolean update(T tClass) throws IllegalAccessException, InstantiationException, SQLException {

        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            Object obj = tClass.getClass().newInstance();
            String name=obj.getClass().getSimpleName();
            Field[] fields = obj.getClass().getDeclaredFields();
            List<String> fileds=new ArrayList<>();
            List<Object> objects=new ArrayList<>();
            String id="";
            for (int i = 0; i < fields.length; i++) {
                fields[i].setAccessible(true);
                Object obj2=fields[i].get(tClass);
                if(obj2!=null)
                {
                    String fname=fields[i].getName();
                    if(!fname.equals("id"))
                    {

                        fileds.add(fname+"=?");
                        objects.add(obj2);
                    }
                    else {
                        id=obj2.toString();
                    }


                }
            }
            String sql="update "+name+" set "+String.join(",",fileds)+" where id="+id;
            conn= DBUtil.CreateConnection();
            ps=conn.prepareStatement(sql);
            for (int i = 0; i < objects.size(); i++) {
                ps.setObject(i+1, objects.get(i));

            }


            return ps.execute();


        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }
        return false;
    }
    public T Get(String id) throws SQLException {

        String sql=String.format("select * from %s where id=?",getTClass().getSimpleName());
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        sysuser u=null;
        Object newEntity=null;
        try {

            conn=DBUtil.CreateConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1,id);

            rs=ps.executeQuery();
            if(rs.next())
            {
                Field[] fields = getTClass().getDeclaredFields();
                //通过class对象拿到实例对象,虽然此时它是Object类型
                newEntity = getTClass().newInstance();
                Field[] fieldss = newEntity.getClass().getDeclaredFields();
                for (int i = 0; i < fields.length; i++) {

                    fields[i].setAccessible(true);
                    fieldss[i].setAccessible(true);

                    String fname=fields[i].getName();
                    Object obj= rs.getObject(fname);
                    fieldss[i].set(newEntity,obj);//反射给字段赋值
                }

            }

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }

        return  (T)newEntity;
    }
    public int del(String id) throws SQLException {
        String sql=String.format("delete from %s where id=%s",getTClass().getSimpleName(),id);
        DBUtil.executeSQL(sql);
        return 1;
    }
    public List<T> GetList(String where,int pageIndex,int pageSize) throws SQLException {
        List<T> list=new ArrayList<>();
        String sql="select * from "+getTClass().getSimpleName()+" where 1=1 "+where;
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
                Field[] fields = getTClass().getDeclaredFields();
                //通过class对象拿到实例对象,虽然此时它是Object类型
                Object newEntity = getTClass().newInstance();
                Field[] fieldss = newEntity.getClass().getDeclaredFields();
                for (int i = 0; i < fields.length; i++) {

                    fields[i].setAccessible(true);
                    fieldss[i].setAccessible(true);

                    String fname=fields[i].getName();
                    Object obj= rs.getObject(fname);
                    fieldss[i].set(newEntity,obj);//反射给字段赋值
                }
                list.add((T)newEntity);
            }

        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } finally {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
            if(rs!=null) rs.close();
        }

        return  list;
    }
    public int GetCount(String where) throws SQLException {
        int count=0;
        String sql="select count(0) counts from "+getTClass().getSimpleName()+" where 1=1 "+where;
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
    public Class<T> getTClass()
    {
        @SuppressWarnings("unchecked")
        Class<T> tClass = (Class<T>)((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        return tClass;
    }
}
