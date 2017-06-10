package ip;

/**
 * Created by Administrator on 2017/1/13.
 */
public class StringTest {
    public static void main(String[] args) {
        String s="abcd     1245  中国 &*()";
        String[] strings=s.split("\\s+");
        System.out.println(strings.length);
        System.out.println(strings[0]);
        System.out.println(strings[1]);
//        System.out.println(strings[2]);

        System.out.println(s.replace(strings[0],"").replace(strings[1],"").trim());
        // trim()  返回字符串的副本，忽略前导空白和尾部空白。
    }
}
