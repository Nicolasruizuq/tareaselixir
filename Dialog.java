import javax.swing.JOptionPane;

public class Dialog {
    public static void main(String[] args) {
        String message = args.length > 0 ? args[0] : "Mensaje por defecto";
        JOptionPane.showMessageDialog(null, message, "Notificación", JOptionPane.INFORMATION_MESSAGE);
    }
}