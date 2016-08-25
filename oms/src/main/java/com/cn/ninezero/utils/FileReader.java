package com.cn.ninezero.utils;

/**
 * Created by 615146292 on 2015/6/25.
 */
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class FileReader {
    private File file;
    private String encoding;
    private BufferedReader reader;
    private InputStreamReader inputStreamReader;

    public FileReader(String filePath) {
        this((File)(new File(filePath)));
    }

    public FileReader(String filePath, String encoding) {
        this((File)(new File(filePath)), encoding);
    }

    public FileReader(File file) {
        this.encoding = "UTF-8";
        this.file = file;
    }

    public FileReader(File file, String encoding) {
        this.encoding = "UTF-8";
        this.file = file;
        this.encoding = encoding;
    }

    protected InputStreamReader getInputStreamReader() throws IOException {
        if(this.inputStreamReader == null) {
            this.inputStreamReader = new InputStreamReader(new FileInputStream(this.file), this.encoding);
        }

        return this.inputStreamReader;
    }

    private BufferedReader getReader() throws IOException {
        if(this.reader == null) {
            this.reader = new BufferedReader(this.getInputStreamReader());
        }

        return this.reader;
    }

    public String readLine() throws IOException {
        return this.getReader().readLine();
    }

    public String readFileContents() throws IOException {
        StringBuilder sb = new StringBuilder();

        String line;
        while((line = this.readLine()) != null) {
            sb.append(line);
        }

        this.close();
        return sb.toString();
    }

    public void close() throws IOException {
        if(this.inputStreamReader != null) {
            this.inputStreamReader.close();
        }

        if(this.reader != null) {
            this.reader.close();
        }

    }
}
