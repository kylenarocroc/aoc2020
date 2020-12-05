data:" " vs/: read0`:d2.txt;

.d2.p1:{
	chars:-1_/:data[;1];
	nums:value each ssr[;"-";" "] each data[;0];
	first sum ((count''[group each data[;2]])@'chars) within' nums
}

/ .d2.p1[]

.d2.p2:{
	chars:-1_/:data[;1];
	nums:value each ssr[;"-";" "] each data[;0];
	first sum 1=sum''[(1+/:(group each data[;2])@'chars) in' nums]
}

/ .d2.p2[]
