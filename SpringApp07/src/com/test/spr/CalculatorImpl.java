/*==============================================
	CalculatorImpl.java
	- 클래스
	- Calculator 인터페이스를 구현하는 클래스
	- 주 업무, 보조 업무가 함께 처리되는 형태
===============================================*/

package com.test.spr;

public class CalculatorImpl implements Calculator
{
	// 인터페이스로부터 상속받은 메소드 재정의를 통해
	// 주 업무(core concern) 진행(수행)을 위한 메소드 구현
	
	@Override
	public int add(int x, int y)
	{
		// 반환할 결과값
		int result = 0;
		
		// 주 업무(core concern) 실행 내용
		result = x + y;
		System.out.printf("%d + %d = %d\n", x, y, result);
		
		// 최종 결과값 반환
		return result;
	}

	@Override
	public int sub(int x, int y)
	{
		// 반환할 결과값
		int result = 0;
		
		// 주 업무(core concern) 실행 내용
		result = x - y;
		System.out.printf("%d - %d = %d\n", x, y, result);
		
		// 최종 결과값 반환
		return result;
	}

	@Override
	public int mul(int x, int y)
	{
		// 반환할 결과값
		int result = 0;
		
		// 주 업무(core concern) 실행 내용
		result = x * y;
		System.out.printf("%d * %d = %d\n", x, y, result);

		// 최종 결과값 반환
		return result;
	}

	@Override
	public int div(int x, int y)
	{
		// 반환할 결과값
		int result = 0;
		
		// 주 업무(core concern) 실행 내용
		result = x / y;
		System.out.printf("%d / %d = %d\n", x, y, result);
		
		// 최종 결과값 반환
		return result;
	}
	
}
