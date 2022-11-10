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
		
		// ※ 주 업무(core concern) 처리 과정에서 예외가 발생할 수 있는 상황을 만들기 위해
		//    예외 객체를 생성하여 처리할 수 있도록 구성
		//    - try ~ catch ~ finally : 예외 발생 시 자체적으로 처리
		//    - throws : 예외 발생 시 호출한 객체에 예외를 넘기는 처리
		//    - throw  : 예외를 인위적으로 발생시키는 처리
		
		if (x >= 100 || y >= 200)
		{
			throw new IllegalArgumentException("100보다 큰 인자를 전달한 예외 발생~!!");
		}
		
		
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
