package jdbc;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/1/11.
 */
public class InsertTest2 {
    private static final String URL = "jdbc:mysql:///db_student?user=root&password=system";
    private static final String SQL="INSERT INTO db_student.student(name) VALUES (?)";
    public static void main(String[] args) {
        try {
            new Driver();
            try (
                    Connection connection = DriverManager.getConnection(URL);
                    PreparedStatement preparedStatement=connection.prepareStatement(SQL)
            ) {
                preparedStatement.setString(1,"jdbc...");
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
