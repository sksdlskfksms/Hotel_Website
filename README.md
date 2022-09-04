# [프로젝트] 호텔 예약 사이트
#### 자바기반 응용SW 개발자 양성과정에서 5명이 한 팀으로 호텔 예약이 가능한 사이트를 구현한 프로젝트
<img src="https://user-images.githubusercontent.com/93129951/188330477-3b124b93-fe29-412b-8bde-db858579db39.png" width="80%"/>
<br>

## 🌟 담당 개발 내용
- 프로젝트 Framework 구축
- 프론트엔드 화면 개발
- 호텔 예약 관련 CRUD 및 이와 관련된 상세기능
- 사용자 권한(관리자, 호스트, 게스트)에 따라 다른 화면 구성
- 마이페이지
<br> 

## 📸 페이지
 <img src="https://user-images.githubusercontent.com/93129951/188331382-6da46141-46ba-4fc4-8dac-c9c925d3c669.PNG" width="80%"/>

## 📍 사용기술
\# Java \# Spring Framework \# ApacheTomcat \# Maven \# Mybatis \# MVC \# HTML5 \# CSS3 \# JAVASCRIPT
<br> 

## 💡 프로젝트 구조

```
src/main/  
│   
├── java/com/spring              # 백엔드    
│   ├─ biz/                         # Controller
│   └─ view/                        # Model
└── resources/                      # 리소스
│   ├─ config/
│   ├─ lib/        
│   ├─ mappings/        
│   ├─ message/    
│   ├─ SQL/
│   ├─ log4j.xml   
│   └─ mybatis-config.xml
└── webapp/                      # 프론트엔드 
    ├─ resources/
    ├─ WEB-INF/
    |  ├─ spring/
    │  |    ├─ servlet-context.xml 
    |  |    └─ root-context.xml
    |  ├─ views/                    #View
    |  └─ web.xml   
    └─  welcome.jsp
```
