package mybean;

import java.util.Random;

/*
 * name				r/w			data type			desc
 * -------------------------------------------------------
 * randomNumber		r			int				임의의 수를 발생
 * maxNumber		r/w			int				최대 크기의 숫자
 * minNumber		r/w			int				최소 크기의 숫자
 */
public class DiceGame {
	private Random random = new Random();
	private int max;
	private int min;
	
	public int getRandomNumber(){
		//return random.nextInt(6)+1;
		return random.nextInt(max-min+1)+min;
	}
	
	public int getMaxNumber(){
		return max;
	}
	
	public void setMaxNumber(int max){
		this.max = max;
	}
	
	public int getMinNumber(){
		return min;
	}
	
	public void setMinNumber(int min){
		this.min = min;
	}
}
