import javax.swing.JOptionPane;

public class InputDialog {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.err.println("Uso: java InputDialog <mode> <message>");
            System.exit(1);
        }

        String mode = args[0];
        String message = args[1];

        switch (mode) {
            case "message":
                JOptionPane.showMessageDialog(null, message);
                break;
            case "input":
                String input = JOptionPane.showInputDialog(null, message);
                if (input != null) {
                    System.out.println(input);
                }
                break;
            default:
                System.err.println("Modo no soportado: " + mode);
        }
    }
}
