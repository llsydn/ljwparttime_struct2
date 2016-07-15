package lyw.itcast.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
//使用c3p0对数据库的操作。
public class JdbcUtils {
	private static ComboPooledDataSource ds=null;
	private static ThreadLocal<Connection> threadLocal=new ThreadLocal();
	
	static{
		ds=new ComboPooledDataSource();//这里是准备连接的数据库信息
	}
	
	public static Connection getConnection() throws SQLException{
		Connection conn=threadLocal.get();
		if(conn==null){
			conn=getDataSource().getConnection();
			threadLocal.set(conn);//绑定在当前的线程上去
		}
		return conn;
	}
	
	public static DataSource getDataSource(){//连接池，数据源
		return ds;
		
	}
	public static void startTransaction(){
		try{
			Connection conn=threadLocal.get();
			if(conn==null){
				conn=getConnection();
				threadLocal.set(conn);//把conn绑定在当前的线程上
			}
			conn.setAutoCommit(false);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public static void rollback(){
		try{
			Connection conn= threadLocal.get();
			if(conn!=null){
				conn.rollback();
			}
			
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public static void commit(){
		try{
			Connection conn=threadLocal.get();
			if(conn!=null){
				conn.commit();
			}
			
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public static void release(){
		try{
			Connection conn=threadLocal.get();
			if(conn!=null){
				conn.close();
				threadLocal.remove(); //解除当前线程的绑定conn
			}
			
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
