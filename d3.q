data:read0 `:d3.txt;
data:raze each count[data]#/:enlist each data;

calcTrees:{[slope]
	trees:0;
	run:1;

	while[not " "=sq:data . run*slope;
		if[sq="#";
			trees+:1
			];
		run+:1;
	];
	
	:trees;
};

.d3.p1:{

	:calcTrees 1 3;
	
	}

/ .d3.p1[]

.d3.p2:{
	/ put the slopes backwards by mistake
	prd calcTrees each reverse each (1 1;3 1;5 1;7 1;1 2)
}

/ .d3.p2[]
