package mybean.scope;

/*
elapsedTime					r		long		타이머 리셋 후 경과 시간
restart						w		boolean		타이머 리셋
elapsedTimeAfterInst		r		long		객체 생성 후 경과시간
elapsedTimeAfterLastAccess	r		long		마지막 접근 후 경과시간
 */

public class SessionBean {
	private long startTime;
	private long instTime;
	private long lastAccessTime;
	
	public SessionBean(){
		startTime = System.currentTimeMillis();
		instTime = startTime;
		lastAccessTime = startTime;
	}
	
	// 타이머가 리셋 후 경과된 시간을 알려 줌
	public long getElapsedTime(){
		lastAccessTime = System.currentTimeMillis();
		return (lastAccessTime - startTime)/1000;
	}
	
	// 타이머를 리셋
	public void setRestart(boolean b){
		startTime = System.currentTimeMillis();
		lastAccessTime = System.currentTimeMillis();
	}
	
	// 타이머가 시작된 뒤에 경과된 총 시간
	public long getElapsedTimeAfterInst(){
		lastAccessTime = System.currentTimeMillis();
		return (lastAccessTime - instTime)/1000;
	}
	
	// bean의 property를 마지막으로 접근한 뒤에 경과된 시간
	public long getElapsedTimeAfterLastAccess(){
		long current = System.currentTimeMillis();
		long elapsed = (current - lastAccessTime)/1000;
		lastAccessTime = System.currentTimeMillis();
		return elapsed;
	}
}
