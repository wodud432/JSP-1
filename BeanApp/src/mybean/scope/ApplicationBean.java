package mybean.scope;

public class ApplicationBean {
	int count;
	
	public void setNewVisit(int count){
		this.count = count;
	}
	
	public void setRestart(boolean b){
		count = 0;
	}
	
	public int getVisitCount(){
		count++;
		return count;
	}
}
