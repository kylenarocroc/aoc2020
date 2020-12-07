data:read0`:d7.txt;

process:{
	map:" contain " vs/: data;
	contains:"JSS"$/:/:3#/:/:" " vs/:/: ", " vs/: map[;1];
	dict:{(` sv/: -2#/:x)!1#/:x} each contains;
	bags:` sv/: `$2#/:" " vs/: map[;0];
	bags!dict 
	}

data:process[];

.d7.p1:{
	lastHead:`;
	head:key[data] where `shiny.gold in/: key each value data;
	while[not head~lastHead;
		lastHead:head;
		head,:key[data] where any each head in/: key each value data;
		head:distinct head;
		];

	count head
	}

/ .d7.p1[]

processPath:{[k]
	$[`other.bags.~first key data k; 
		:1;
	  not `other.bags.~first key data k;
		:first 1+sum (value data[k])*processPath each key data[k];
		'"nyi"
	];

	}

.d7.p2:{
	-1+processPath`shiny.gold
	}	

/ .d7.p2[]
