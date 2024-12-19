package com.jelly.www.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddressVO {    		
    	int addressId;
    	int userId;
    	String addressLine1;
    	String addressLine2;
    	String postalCode;
    	Boolean isDefault;
    	Timestamp createdAt;
    	Timestamp updatedAt;

}

