package utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourceUtils {
	private static DataSource dataSource = new ComboPooledDataSource();
	private static ThreadLocal<Connection> tl =new ThreadLocal<Connection>();
	
	public static DataSource getDataSource() {
		return dataSource;
	}
	/**
	* When DBUtils need to control transactions manually,
	* call this method to get a connection
	*
	* @return
	* @throws SQLException
	*/
	
	public static Connection getConnection() throws SQLException {
		Connection con = tl.get();
		if (con == null) {
			con = dataSource.getConnection();
			tl.set(con);
		}
		return con;
	}
	
	/**
	* start transaction
	*
	* @throws SQLException
	*/
	public static void startTransaction() throws SQLException {
		Connection con = getConnection();
		if (con != null)
			con.setAutoCommit(false);
	}
	
	
	/**
	* hreadLocal release resource and close connection
	*
	* @throws SQLException
	*/
	public static void releaseAndCloseConnection() throws SQLException {
		Connection con = getConnection();
		if (con != null) {
			con.commit();
			tl.remove();
			con.close();
		}
	}
	
	
	/**
	* roll back transaction
	* @throws SQLException
	*/
	public static void rollback() throws SQLException {
		Connection con = getConnection();
		if (con != null) {
			con.rollback();
		}
	}

}
