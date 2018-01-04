#! /usr/local/bin/gnuplot -p

#set term postscript eps size 6.5,4.62 enhanced color font 'Helvetica,20' linewidth 2
set term postscript eps enhanced color linewidth 2
set out "rm_fac_kramer.eps"
set logscale y
set format y "10^{%L}"
set mytics 5
set mxtics 5
set ytics 1e-5, 10, 1e3
#set ytics ('10^{-3}' 10**-3, '10^{-2}' 10**-2, '10^{-1}' 10**-1, '10^0' 1, '10^1' 10, \
			'10^2' 10**2, '10^3' 10**3, '10^4' 10**4)
set ylabel "{/Symbol s}_{PI} (Mb)"
#set yrange [10**-3:10**3]

#set xrange [30:110]

#Set the location where the plots are going to be plotted.
VERTICAL_P_1 = "set tmargin at screen 0.97; set bmargin at screen 0.57"
HORIZONTAL_P_1_2 = "set lmargin at screen 0.10; set rmargin at screen 0.90"
VERTICAL_P_2 = "set tmargin at screen 0.49; set bmargin at screen 0.09"

#===========MULTIPLOT==========
set multiplot layout 1,2 rowsfirst

@VERTICAL_P_1; @HORIZONTAL_P_1_2;
#unset xlabel
#set xtics add ('' 70, '' 75, '' 80, '' 85, '' 90, '' 95, '' 100, '' 105, '' 110)
#set label 1 'Fe XVII (2s^22p^53p ^1S^e)' at graph 0.02,0.9 
set label 1 'Fe XVII (2s^22p^53p ^1S_o)' at graph 0.2,0.9
plot [0:550] [10**-3:10**3]'kramer_3_RM' u 1:3 title '60 CC BPRM' with lines lc rgb 'black',\
			 'kramer_3_fac' u 1:3 title 'RDW' with lines lc rgb 'red',\
			 'kramer_3_kramer' u 1:2 title 'Kramers rule' with lines lc rgb 'blue'

@VERTICAL_P_2; @HORIZONTAL_P_1_2;
set xlabel "Photon Energy (Ry)"
#set xtics 70, 5, 110
#set label 1 'Fe XVII (2s^22p^53d ^1D^o)' at graph 0.02,0.9 
set label 1 'Fe XVII (2s^22p^54p ^3P_e)' at graph 0.2,0.9
plot [0:550] [10**-5:10**3] 'kramer_5_RM' u 1:3 title '60 CC BPRM' with lines lc rgb 'black',\
			 'kramer_5_fac' u 1:3 title 'RDW' with lines lc rgb 'red',\
			 'kramer_5_kramer' u 1:2 title 'Kramers rule' with lines lc rgb 'blue'

