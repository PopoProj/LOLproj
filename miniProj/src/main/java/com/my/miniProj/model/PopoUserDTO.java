package com.my.miniProj.model;

import java.sql.Date;

import lombok.Data;

@Data
public class PopoUserDTO {
	

	 int popoNum;
	 String popoId; 
	 String popoPw;
	 String popoName;
	 String popoTel; 
	 String popoEmail;
	 String popoNickname;
	 int popoMain;
	 int popoSub;
	 Date popoDate;
	 int popoQuit;
	 int popoBan;
	 
}
