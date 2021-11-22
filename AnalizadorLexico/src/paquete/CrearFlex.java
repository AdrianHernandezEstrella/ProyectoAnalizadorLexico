package paquete;
import java.io.*;
import java.nio.file.*;


public class CrearFlex {
    public static void generar() throws IOException, Exception {   
        
           
        String rutaProy = "C:\\Users\\TOSHIBA\\Desktop\\AnalizadorLexico";
        String[] ruta1 = {rutaProy + "/src/paquete/lex.flex"};
        String[] ruta2 = {rutaProy + "/src/paquete/LexerCup.flex"};
        String[] rutaS = {"-parser", "Sintax", rutaProy + "/src/paquete/Sintax.cup"};
        jflex.Main.generate(ruta1);
        jflex.Main.generate(ruta2);
        java_cup.Main.main(rutaS);
        Path rutaSym = Paths.get(rutaProy + "/src/paquete/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
            Paths.get(rutaProy + "/sym.java"),
            Paths.get(rutaProy + "/src/paquete/sym.java")
        );
        Path rutaSin = Paths.get(rutaProy + "/src/paquete/Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get(rutaProy + "/Sintax.java"),
                Paths.get(rutaProy + "/src/paquete/Sintax.java")
        );
    }
    
    public static void main(String[] args) throws Exception {
        try {
            generar();
        } catch (Exception ex) {
            throw new Exception("Error de Archivo Lexer" + ex);
        }
    }
}
