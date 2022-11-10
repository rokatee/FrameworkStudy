/*===========================================
	Main.java
	- main() 메소드가 포함된 테스트 클래스
============================================*/

package com.test.spr;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main
{
	public static void main(String[] args)
	{
		// 주 업무 실행에 대한 테스트 → Spring AOP 기법 적용 후
		// 너가 해야할 일 정리해놨으니, 그거 먼저 읽어봐 → config.xml
		
		ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
		
		// 원래 인스턴스 생성 우리가 직접했는데,
		//Calculator cal = new CalculatorImpl();
		// 이제는 직접 안하고, 이제는 Spring이 만든 객체 정보 수신해서 쓸거임
		// 객체 정보 줄 때는 Object type으로 주니까 (Calculator)로 형변환해서 쓸거임
		// 정보 얻으려면 『getBean()』 사용하면 됨
		// Calculator cal = (Calculator)객체수신;
		//Calculator cal = (Calculator)context.getBean("proxy");
		// 위의 구문은 아래처럼 할 수도 있음
		Calculator cal = context.getBean("proxy", Calculator.class);
		
		int add = cal.add(10, 20);
		System.out.println(add);
		
		int sub = cal.sub(10, 20);
		System.out.println(sub);
		
		int mul = cal.mul(10, 20);
		System.out.println(mul);
		
		int div = cal.div(10, 20);
		System.out.println(div);
		
		// 예외 상황이 발생할 수 있도록 값을 구성하는(넘기는) 처리 추가
		int add2 = cal.add(100, 200);
		System.out.println(add2);

		
	}
}
