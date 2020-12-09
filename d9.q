data:"J"$read0`:d9.txt


preamble:25;

.d9.p1:{
	i:preamble;
	size:count[data];
	n:0;
	while[not i=(size-1);

		nums:data n+preamble-1+til preamble;
		if[not data[i] in sum each nums cross nums;
			:data[i]
			];

		i+:1;
		n+:1;
	];
	
	};

/ .d9.p1[]

res:.d9.p1[];
.d9.p2:{

	copy:data;
	i:0;
	final:();
	while[not res in final:sums copy;
		copy:1_copy;
		i+:1;
	];
	
	:sum (min;max)@\:data i+til 1+first where res=final;
 
	};

.d9.p2[]