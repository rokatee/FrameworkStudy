package com.test.spr;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main
{
	public static void main(String[] args)
	{
		//MemberList member = new MemberList();
		
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		
		MemberList member = context.getBean("member", MemberList.class);
		
		member.print();
	}
}
