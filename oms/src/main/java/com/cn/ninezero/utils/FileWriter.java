package com.cn.ninezero.utils;

/**
 * Created by 615146292 on 2015/6/25.
 */
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

public class FileWriter {
    private File file;
    private String encoding;
    private OutputStreamWriter outputStreamWriter;

    public FileWriter(String filePath) {
        this((File)(new File(filePath)));
    }

    public FileWriter(File file) {
        this.encoding = "UTF-8";
        this.file = file;
    }

    public FileWriter(String filePath, String encoding) {
        this((File)(new File(filePath)), encoding);
    }

    public FileWriter(File file, String encoding) {
        this.encoding = "UTF-8";
        this.file = file;
        this.encoding = encoding;
    }

    protected OutputStreamWriter getOutputStreamWriter() throws IOException {
        if(this.outputStreamWriter == null) {
            this.outputStreamWriter = new OutputStreamWriter(new FileOutputStream(this.file), this.encoding);
        }

        return this.outputStreamWriter;
    }

    public void writer(String content) throws IOException {
        this.getOutputStreamWriter().write(content);
    }

    public void close() throws IOException {
        this.outputStreamWriter.flush();
        this.outputStreamWriter.close();
    }
}