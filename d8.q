data:read0`:d8.txt 

data:flip ("SJ";" ") 0: data

run:{[data]

	inds:();
	currInd:0;
	acc:0;
	nInd:count data;

	while[not currInd in inds;
		
		inds,:currInd;

		inst:data[currInd];
		op:inst 0;
		val:inst 1;

		$[op=`nop;
				currInd:(currInd+1) mod nInd;
		  op=`acc;
		  	[
		  		acc+:val;
		  		currInd:(currInd+1) mod nInd;
		  	];
		  op=`jmp;
		  	[
		  		currInd:(currInd+val) mod nInd;
		  	]
		];


	];

	acc 

};

testProg:{[data]

	inds:();
	currInd:0;
	acc:0;
	nInd:count data;
	status:`broke;

	while[not currInd in inds;
		
		inds,:currInd;
		
		inst:data[currInd];
		op:inst 0;
		val:inst 1;

		$[op=`nop;
				currInd:(currInd+1) mod nInd;
		  op=`acc;
		  	[
		  		acc+:val;
		  		currInd:(currInd+1) mod nInd;
		  	];
		  op=`jmp;
		  	[
		  		currInd:(currInd+val) mod nInd;
		  	]
		];

		if[currInd=-1+nInd;
			status:`worked;
			:(status;acc)
		]:
	];

	(status;acc)

};

.d8.p1:{
	run data
}

/ .d8.p1[]

.d8.p2:{

	tests:(where data[;0] in `nop`jmp) inter (where not data[;1]=0);
	
	while[not 0=count tests;

		changedData:data;
		changedData[first tests]:((`jmp`nop!`nop`jmp) first data[first tests]),last data[first tests];

		res:testProg changedData;
		if[`worked=first res;
			:res 
		];

		tests:1_tests;
	];

	res
}

/ .d8.p2[]

