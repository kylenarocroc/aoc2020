data:"J"$read0`:d1.txt;

.d1.p1:{
	prd first pairs where 2020=sum each pairs:data cross data
}

/ .d1.p1[]

.d1.p2:{
	pairSum:sum each pairs:data cross data;
	correctSets:triples where 2020=sum each triples:data cross pairSum;
	prd correctSets[0;0],first pairs where pairSum=correctSets[1;1]
}

/ .d1.p2[]
