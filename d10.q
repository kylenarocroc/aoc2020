data:asc "J"$read0 `:d10.txt

.d10.p1:{
	data,:last[data]+3;
	prd value count each group deltas data
	}

d:group deltas data
(0,d 3) cut data 

/ .d10.p1[]

fact:{prd[1+til x]};
choose:{fact[x]%(fact[y]*fact(x-y))};
jumps:{floor $[x>0;(x-1);1]%3};


/ for answer display
\P 0

.d10.p2:{
	op:0,data,last[data]+3;
	gaps:(where not 1=deltas op) cut op;
	totJump:{last[x]-first x} each gaps;
	nNums:count each gaps;
	
	sizes:til each totJump where nNums>2;
	picks:(jumps each totJump where nNums>2)_'sizes;
	
	prd sum each (choose@/:last each sizes)@''picks
	}

/ .d10.p2[]
