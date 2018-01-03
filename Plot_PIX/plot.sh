#!/usr/local/bin/bash

#This script is to plot all the 454 sets of photoionization cross section.

line=0

if [ -f total.ps ]
then
	rm total.ps
fi

for i in $(seq 1 454)
do
	echo $i
	
	data_line=($(sed -n $((line+14))p fe17.px.60cc.fac))
	
	J2=${data_line[1]}
	Pi=${data_line[2]}
	Level=${data_line[3]}
	
	sed -n $((line+17)),$((line+24668))p fe17.px.60cc.fac > RM_data
	sed -n $((line+24668)),$((line+24767))p fe17.px.60cc.fac > FAC_data
	
	if [ -f Kramer_data ]
	then 
		rm Kramer_data
	fi
#if [ $i == 5 ]	
#then
	data_line=($(sed -n 1p FAC_data))
	printf "%17s %15s\n" ${data_line[0]} ${data_line[2]} >> Kramer_data
	
	#Apply Kramer's rule to generate the data at high-energy range
	en_0=${data_line[0]/E+/*10^}
	en_0=${en_0/E-/*10^-}
	sigma_0=${data_line[2]/E+/*10^}
	sigma_0=${sigma_0/E-/*10^-}
	
	for line_fac in $(seq 2 100)
	do
		data_line=($(sed -n ${line_fac}p FAC_data))
		
		en=${data_line[0]/E+/*10^}
		en=${en/E-/*10^-}
		
		sigma=$( echo "${sigma_0}*((${en_0})/(${en}))^3"|bc -l )
		
		printf "%17s %15.3E\n" ${data_line[0]} ${sigma} >> Kramer_data
	done
#fi	

	
	gnuplot <<eof
		set terminal postscript color enhanced
		set out 'tem.ps'
		set title '${J2}\_${Pi}\_${Level}'
		set logscale y
		set format y "%T"
		set ylabel 'log10(PI)'
		set xlabel 'Photon Energy (Ry)' 
		
		plot 'RM_data' u 1:3 title '30 CC BPRM' with lines lc rgb 'black',\
			 'FAC_data' u 1:3 title 'DW' with lines lc rgb 'red',\
			 'Kramer_data' u 1:2 title 'Kramer' with lines lc rgb 'blue'
eof
	cat tem.ps >> total.ps
	line=$((line+24767))
done

open total.ps
