package ip;

import java.io.*;

/**
 * Created by Administrator on 2017/1/19.
 */
public class FormatData {
    public static void main(String[] args) {
        // 1.2.3.4      5.6.7.8      some location...
        // 1.2.3.4|5.6.7.8       some location...
        // 1.2.3.4|5.6.7.8|some location...
        try (
                BufferedReader reader = new BufferedReader(new FileReader("e:/IP.txt"));
                BufferedWriter writer = new BufferedWriter(new FileWriter("e:/IP2.txt"))
        ) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.replaceFirst("\\s+", "|").replaceFirst("\\s+", "|");
                writer.write(line + "\n");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
