package csdn;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * Created by Administrator on 2017/1/15.
 */
public class Csdn {
    public static void main(String[] args) {
        try (BufferedReader reader = new BufferedReader(new FileReader("E:/CSDN-6million/www.csdn.net.sql"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
