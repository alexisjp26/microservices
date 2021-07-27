package com.ucreativa.servicesuma;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileRepo {
    public static void salvar(String texto, String archivo) {
        try {
            String folder = "resultado";
            File directory = new File(folder);
            if (!directory.exists()){
                directory.mkdir();
            }
            archivo = folder.concat("/").concat(archivo);
            BufferedWriter writer = new BufferedWriter(new FileWriter(archivo, true));
            writer.append(texto + "\n");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
