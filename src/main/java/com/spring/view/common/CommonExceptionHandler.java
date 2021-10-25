package com.spring.view.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("com.springbook.view")
public class CommonExceptionHandler {
	@ExceptionHandler(ArithmeticException.class)
	public ModelAndView handlerArithMathicException(Exception e){
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception",e);
		mav.setViewName("error/arithmeticError");
		return mav;
	}
	
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView handlerNullPointerException(Exception e){
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception",e);
		mav.setViewName("error/nullPointerError");
		return mav;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handlerException(Exception e){
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception",e);
		mav.setViewName("error/error");
		return mav;
	}

}
