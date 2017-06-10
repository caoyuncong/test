package jdbc;

/**
 * Created by Administrator on 2017/1/11.
 */
public class StaticBlockTest {
    static {
        System.out.println("static1...");
    }
    static {
        System.out.println("static2...");
    }
    {
        System.out.println("constructor block...");
    }

    public StaticBlockTest() {
        System.out.println("constructor...");
    }

    public static void main(String[] args) {
        System.out.println("main...");
        StaticBlockTest staticBlockTest=new StaticBlockTest();
    }

}
//静态代码块：用static声明，jvm加载类时执行，仅执行一次
//构造代码块：类中直接用{}定义，每一次创建对象时执行。
//执行顺序优先级：静态块,main(),构造块,构造方法。

/*     输出结果
* static1...
static2...
main...
constructor block...
constructor...
* */