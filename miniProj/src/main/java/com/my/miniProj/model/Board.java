package com.my.miniProj.model;


import java.sql.Date;

import lombok.Data;

@Data
public class Board {

	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private String boardWriter;
	private int boardLike;
	private int boardViews;
	
}
