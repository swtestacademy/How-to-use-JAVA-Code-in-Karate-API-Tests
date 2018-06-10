package examples;

import java.io.*;
import java.util.Map;
import java.util.Properties;

public class DataStorage {
    Properties prop = new Properties();
    OutputStream output = null;
    InputStream input = null;
    private static String FILE_NAME = "config.properties";

    public void write(Map<String, Object> config) throws IOException {

        String key = (String) config.get("key");
        output = new FileOutputStream(FILE_NAME);
        prop.setProperty("key", key);
        prop.store(output, null);
    }

    public String read(String key) throws IOException {

        input = new FileInputStream(FILE_NAME);
        prop.load(input);
        return prop.getProperty(key);
    }
}