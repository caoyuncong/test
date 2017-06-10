package ip;

import com.mysql.jdbc.Driver;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/1/13.
 */
//  将一组参数添加到此 PreparedStatement 对象的批处理命令中。
// 使所有上一次提交/回滚后进行的更改成为持久更改，并释放此 Connection 对象当前持有的所有数据库锁。
// 此方法只应该在已禁用自动提交模式时使用。
public class DumpData {
    private static final String FILE_NAME = "e:/IP.txt";
    private static final String URL = "jdbc:mysql:///db_ip?user=root&password=system";
    private static final String SQL = "INSERT INTO db_ip.ip VALUES (?,?,?)";
    private static int counter;

    public static void main(String[] args) throws SQLException {
        new Driver();
        Connection connection = DriverManager.getConnection(URL);
        connection.setAutoCommit(false);
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);

        try(BufferedReader bufferedReader=new BufferedReader(new FileReader(FILE_NAME))){
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] strings = line.split("\\s+");
                String min = strings[0];
                String max = strings[1];

                String geo=line.replaceFirst(min,"").replaceFirst(max,"").trim();
                try {
                    preparedStatement.setString(1, min);
                    preparedStatement.setString(2, max);
                    preparedStatement.setString(3, geo);
                    preparedStatement.addBatch();
                    System.out.println(++counter);

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            preparedStatement.executeBatch();
            connection.commit();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

