package me.doshou.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

/**
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/28
 * Time: 10:46
 */
@Controller
@RequestMapping(value = "/upload")
public class FileUploadController {

    private static final String STATIC_PATH = "static/images/upload";

    @Autowired
    private ServletContext sc;

    @RequestMapping(value="", method=RequestMethod.GET)
    public String provideUploadInfo() {
        return "upload";
    }

    @RequestMapping(value="", method= RequestMethod.POST)
    public @ResponseBody
    String handleFileUpload(@RequestParam("file") MultipartFile file){
        String name = "";
        if (!file.isEmpty()) {
            try {
                //String rootPath = sc.getRealPath("/");
                String rootPath = this.getClass().getClassLoader().getResource("").getPath();
                String path = rootPath + STATIC_PATH;
                name = java.util.UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(path + File.separator + name)));
                stream.write(bytes);
                stream.close();
                return "You successfully uploaded " + name + " into " + name + "-uploaded !";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }
    }
}
