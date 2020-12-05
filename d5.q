data:read0`:d5.txt

step:{[move; range]
	
	diff:floor 0.5*range[1]-range[0];

	map:"FBLR"!(
	(range[0];range[0]+diff);
	(range[1]-diff; range[1]);
	(range[0];range[0]+diff);
	(range[1]-diff; range[1])
	);
	
	map[move]
}


getSeat:{[bp]
	i:0;
	rows:0 127;
	while[i<7;
		rows:step[bp[i]; rows];
		i+:1;
	];
	row:first rows;
	colms:0 7;
	while[i<10;
		colms:step[bp[i]; colms];
		i+:1;
	];
	colm:first colms;
	(row;colm)
}

getID:{x[1]+8*x[0]}

getSeatID:{[bp] getID getSeat bp}

.d5.p1:{
	max	getSeatID each data 
	}

/ .d5.p1[]

.d5.p2:{
	seats:8 cut asc getSeat each data;
	badRow:seats -1+first where not 0=last each first each seats;
	row:first first badRow;
	colm:first (til 7) except last each badRow;
	getID (row;colm)
	}

/ .d5.p2[]

