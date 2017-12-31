#! /usr/local/bin/gnuplot -p


#======3=====
#This script is to practice mtics














##======2======
##This script is to practice how to plot multi-panel plot
##
#reset

## wxt terminal
##set terminal wx size 350,262 enhanced font 'Verdana,10' persist
## png
##set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
##set output 'multiplot3.png'
## svg
##set terminal svg size 350,262 fname 'Verdana, Helvetica, Arial, sans-serif' \
##fsize '10'
##set output 'multiplot3.svg'

## color definitions
#set style line  1 lc rgb '#0060ad' pt 5 ps 0.2 lt 1 lw 2    # blue

#unset key

## Enable the use of macros
#set macros

## Functions (1/0 means not defined)
#a = 0.9
#f(x) = abs(x)<2*pi ? a*sin(x)           : 1/0
#g(x) = abs(x)<2*pi ? a*sin(x+pi/2)      : 1/0
#h(x) = abs(x)<2*pi ? a*sin(x+pi)        : 1/0
#k(x) = abs(x)<2*pi ? a*sin(x+3.0/2*pi)  : 1/0

#set tics scale 0.5
#set ytics 1
#set xrange [-2.5*pi:2.5*pi]
#set yrange [-1.5:1.5]

## MACROS
## x- and ytics for each row resp. column
#NOXTICS = "set xtics ('' -2*pi, '' -pi,'' 0, '' pi, '' 2*pi); \
          #unset xlabel"
#XTICS = "set xtics ('-2{/Symbol p}' -2*pi, '-{/Symbol p}' -pi,'0' 0, '{/Symbol p}' pi,\
		#'2{/Symbol p}' 2*pi); set xlabel 'x'"
#NOYTICS = "set format y ''; unset ylabel"
#YTICS = "set format y '%.0f'; set ylabel 'y'"
## Margins for each row resp. column
#TMARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.55"
#BMARGIN = "set tmargin at screen 0.55; set bmargin at screen 0.20"
#LMARGIN = "set lmargin at screen 0.10; set rmargin at screen 0.90"
#RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.95"
## Placement of the a,b,c,d labels in the graphs
#POS = "at graph 0.92,0.9 font ',8'"

#### Start multiplot (2x2 layout)
#set multiplot layout 1,2 rowsfirst
## --- GRAPH a
#@TMARGIN; @LMARGIN
#@NOXTICS; @YTICS
#set label 1 'a' @POS
#plot f(x) with lines ls 1
### --- GRAPH b
##@TMARGIN; @RMARGIN
##@NOXTICS; @NOYTICS
##set label 1 'b' @POS
##plot g(x) with lines ls 1
## --- GRAPH c
#@BMARGIN; @LMARGIN
#@XTICS; @YTICS
#set label 1 'c' @POS
#POS = "at graph 0.2,0.2 font ',8'"
#set label 2 'sdsdfsd' at graph 0.2,0.2 font '8'

#plot h(x) with lines ls 1
### --- GRAPH d
##@BMARGIN; @RMARGIN
##@XTICS; @NOYTICS
##set label 1 'd' @POS
##plot k(x) with lines ls 1
##unset multiplot
#### End multiplot


##=======1=======
#cat << eof > data
## This line is comment.
#1 23
#5 50
#10 2
#9 12
#6 3
#eof

#gnuplot -p << eof 
	##set yrange [0:100]
	##set xrange [0:10]
	#unset key
	#set title "1143 EXAM 1"
	#set xlabel "Score Percentage (%)"
	#set ylabel "#of students"
	
	#set xtics 0, 0.5, 6	#xtics labels where to set the tics.
	#set ytics 0, 15, 70
	
	##The first [a:b] means the xrange is from a to b, and the second [c:d] is to set the 
	##yrange from c to d.
	#plot [0:12] [1:70] "data" u 1:2 with boxes	#boxes means the plot is histogram.


#eof
