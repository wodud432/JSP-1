package mybean.index;

import java.util.List;
import java.util.ArrayList;

public class ParkingBean {
	private ArrayList list = new ArrayList();
	
	public void setEnter(String plateNumber){
		CarDto car = new CarDto(plateNumber, System.currentTimeMillis());
		list.add(car);
	}
	
	public void setExit(String plateNumber){
		CarDto dto;
		for(int i=0; i<list.size(); i++){
			dto = (CarDto)list.get(i);
			if(plateNumber.equals(dto.getPlateNumber())){
				list.remove(i);
				break;
			}
		}
	}
	
	public int	getTotal(){
		return list.size();
	}
	
	public CarDto getCarDto(String plateNumber){
		return null;
	}
	
	/*
	public CarDto[] getCarDto(){
		CarDto[] cars = new CarDto[list.size()];
		for(int i=0; i<cars.length; i++){
			cars[i] = (CarDto)list.get(i);
		}
		
		return cars;
	}
	*/
	
	public List getCarDto(){
		return list;
	}
}
