package ip;

import com.mysql.jdbc.Driver;

import java.sql.*;
import java.util.Scanner;

/**
 * Created by Administrator on 2017/1/14.
 */
public class IP {
    private static final String URL = "jdbc:mysql:///db_ip?user=root&password=system";
    private static final String SQL = "SELECT * FROM db_ip.ip WHERE inet_aton(?) BETWEEN inet_aton(min) AND inet_aton(max)";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("input IP: ");
        String ip = scanner.nextLine();
        System.out.println(ip + "location: "+getGeo(ip));
    }

    private static String getGeo(String ip) {
        try {
            new Driver();
            try (
                    Connection connection = DriverManager.getConnection(URL);
                    PreparedStatement preparedStatement = connection.prepareStatement(SQL)
            ) {
                preparedStatement.setString(1, ip);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    resultSet.next();
                    return resultSet.getString("geo");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
