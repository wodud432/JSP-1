package mvc.exam1;

import java.util.ArrayList;

public class DepartAdvice {
	public ArrayList getAdvice(String param){
		ArrayList advice = new ArrayList();
		if(param.equals("kor")){
			advice.add("1. ��� ���ؾ� �Ѵ�.");
			advice.add("2. ��� ����ؾ� �Ѵ�.");
		}
		else if(param.equals("eng")){
			advice.add("1. ��� ���ؾ� �Ѵ�.");
			advice.add("2. ��� ����ؾ� �Ѵ�.");
		}
		else if(param.equals("com")){
			advice.add("1. ��ǻ�͸� ���ؾ� �Ѵ�.");
			advice.add("2. ��ǻ�͸� ����ؾ� �Ѵ�.");
		}
		else if(param.equals("bus")){
			advice.add("1. �濵�� ���ؾ� �Ѵ�.");
			advice.add("2. �濵�� ����ؾ� �Ѵ�.");
		}
		
		return advice;
	}
}
