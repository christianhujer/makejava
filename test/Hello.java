import static java.lang.System.loadLibrary;

public class Hello {
    static {
        loadLibrary("Hello");
    }
    public static void main(final String... args) {
        hello();
    }
    private static native void hello();
}
