package jdbc;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/1/10.
 */
public class DeleteTest {
    private static final String URL = "jdbc:mysql:///db_student?user=root&password=system";
    private static final String SQL = "DELETE FROM db_student.student WHERE id=?";

    public static void main(String[] args) {
        try {
            new Driver();
            try (Connection connection = DriverManager.getConnection(URL);
                 PreparedStatement preparedStatement = connection.prepareStatement(SQL)
            ) {
                preparedStatement.setInt(1, 5);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
