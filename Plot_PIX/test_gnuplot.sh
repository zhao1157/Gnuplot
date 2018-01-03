#!/bin/bash

#This script is to plot the photoionization cross section for just one transition level.

m=120
k=15

gnuplot  <<eof
set terminal postscript enhanced color
set output '${m}_${k}.eps'
set title '${m}\_${k}'
set xlabel 'Photon Energy (ev)'
set ylabel 'Photoionization Cross Section (Mb)'
set logscale y
set format y '%.1e'
set style line 1 lt 1 lw 2 lc rgb 'red' pt 0
unset key
plot "${m}\_${k}" using 1:3 with linespoints ls 1

eof
open ${m}_${k}.eps
