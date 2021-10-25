package com.spring.biz.user;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class UserVO {
	private String id;
	private String password;
	private String name;
	private String role;
	private String mail;
	private Date regDate;
	private String mailConfirm;
	private String mangerRequest;
	private Date requestDate;
}
