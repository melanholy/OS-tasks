#!/bin/bash
slozhenie () {
	ostatok=0
	res2=""
	for z in `seq $((${#s2}+1)) ${#s1}`; do
		s2=0$s2
	done
	for u in `seq $((${#s1}-1)) -1 0`; do
		let ch=${s1:$u:1}+${s2:$u:1}+$ostatok
		if ! [ "${ch:1}" == "" ]; then
			res2+=${ch:1}
			ostatok=${ch:0:1}
		else 
			res2+=$ch
			ostatok=0
		fi
	done
	if ! (( $ostatok==0 )); then
		res2+=$ostatok
	fi
	echo $res2>temp2
	res=`rev temp2`
}


a=`echo $1 | sed -e 's/1/ 1 /g'| sed -e 's/2/ 2 /g'| sed -e 's/3/ 3 /g'| sed -e 's/4/ 4 /g'| sed -e 's/5/ 5 /g'| sed -e 's/6/ 6 /g'| sed -e 's/7/ 7 /g'| sed -e 's/8/ 8 /g'| sed -e 's/9/ 9 /g'| sed -e 's/0/ 0 /g'`
echo $a >temp
ha=-1
for x in `rev temp`; do
	str=""
	f=0
	for y in `rev temp`; do
		let y=$x*$y+$f
		if ! [ "${y:1}" == "" ]; then
			str+=${y:1}
			f=${y:0:1}
		else 
			str+=$y
			f=0
		fi
	done
	str+=$f
	echo $str>temp1
	str=`rev temp1`
	for u in `seq 0 $ha`; do
		str+=0
	done
	s2=$res
	s1=$str
	slozhenie
	let ha+=1
done
echo $res
