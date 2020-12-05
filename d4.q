musts:`byr`iyr`eyr`hgt`hcl`ecl`pid

data:read0`:d4.txt;

getKey:{`$first ":" vs x}

getVal:{last ":" vs x}

validKeys:{
	all each musts in/: raze each (0,where ""~/:data) cut getKey''[" " vs/: data]
}

.d4.p1:{
	sum validKeys[]
	}

/.d4.p1[] 

checkPair:{all {.chk[first x] last x} each x}
.d4.p2:{

	keyz:raze each (0,where ""~/:data) cut getKey''[" " vs/: data];
	values:enlist''[raze each (0,where ""~/:data) cut getVal''[" " vs/: data]];

	pairs:keyz,''values;

	validPairs:pairs where validKeys[];
	validPairs:(enlist first validPairs),1_/:1_validPairs;

	sum checkPair each validPairs

}

/ .d4.p2[]

/ checking functions 

.chk.yr:{if[not 4=count x; :0b]; ("J"$x) within y};
.chk.byr:.chk.yr[;1920 2002];
.chk.iyr:.chk.yr[;2010 2020];
.chk.eyr:.chk.yr[;2020 2030];
.chk.hgt:{if[not (unit:`$-2#x) in `cm`in;:0b]; val:"J"$-2_x; if[unit=`cm; :val within 150 193]; if[unit=`in; :val within  59 76]};
.chk.hcl:{if[not "#"=first x; :0b]; all (1_x) in "abcdef",.Q.n}
.chk.ecl:{(`$x) in `amb`blu`brn`gry`grn`hzl`oth};
.chk.pid:{9=count x};
.chk.cid:{1b}
