package jdbc;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/1/10.
 */
public class UpdateTest {
    private static final String URL = "jdbc:mysql:///db_student?user=root&password=system";
    private static final String SQL = "UPDATE db_student.student SET age= ? WHERE id = ?";

    public static void main(String[] args) {
        try {
            new Driver();
            try (
                    Connection connection = DriverManager.getConnection(URL);
                    PreparedStatement preparedStatement = connection.prepareStatement(SQL)
            ) {
                preparedStatement.setInt(1, 20);
                preparedStatement.setInt(2, 5);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
