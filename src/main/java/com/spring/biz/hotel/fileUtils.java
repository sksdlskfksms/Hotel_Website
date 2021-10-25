package com.spring.biz.hotel;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

//업로드할 파일들을 조작하고 업로드 기능들을 처리할 클래스
//해당 기능은 공통으로 사용하므로 클래스 생성하여 처리함
@Component("fileUtils") //xml의 Bean으로 fileUtils를 등록한다.
public class fileUtils {
	//@Resource(name="uploadPath") //context설정에서 설정한 디렉토리를 담음
    static String uploadPath="C:\\upload\\";
    
public static List<Map<String, Object>> parseFileInfo(MultipartFile[] file, HotelVO vo) throws Exception {
        
   
        List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
        //가공된 파일들을 담을 곳
 
        File target = new File(uploadPath);
        if(!target.exists()) target.mkdirs();
        //파일을 저장할 경로가 존재하지 않으면 폴더를 생성함
        
        for(int i=0; i<file.length; i++) {
 
            String orgFileName = file[i].getOriginalFilename();           
            System.out.println("================== file start ==================");
            System.out.println("파일 실제 이름: "+orgFileName);
            System.out.println("content type: "+file[i].getContentType());
            System.out.println("================== file   END ==================");
 
            target = new File(uploadPath, orgFileName);  //서버에 실제 파일을 저장한다.(임시디렉토리에 업로드)
            file[i].transferTo(target); //임시 디렉토리에 업로드된 파일 데이터를 지정한 폴더에 저장한다.
            
            //파일의 정보를 각각의 이름으로 fileinfo에 담은 뒤, fileList에 담아준다.
            Map<String, Object> fileInfo = new HashMap<String, Object>();
            
            fileInfo.put("P_CODE", vo.getNum());
            fileInfo.put("ORG_FILE_NAME", orgFileName);
            fileList.add(fileInfo);
            
        } //파일 정보 반환
        return fileList; 
    }

}
