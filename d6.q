data:read0`:d6.txt

.d6.p1:{
	sum count each distinct each raze each (0,where ""~/:data) cut data
}

/ d6.p1[]

.d6.p2:{
	qs:(enlist first qs),1_/:1_qs:(0,where ""~/:data) cut data;
	sum count each (inter/) each qs
}

/ .d6.p2[]
