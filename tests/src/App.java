import java.util.UUID;


public class App {
    public static void main(String[] args) throws Exception {
        
        String fileExt = ".jpg";
        UUID uuid = UUID.randomUUID();
        String fileCode = "";
        
        fileCode = uuid.toString().replaceAll("-", "");
        String fileName = fileCode + fileExt;

        System.out.println(fileCode);
        System.out.println(fileName);

        




    }
}
