#!/bin/sh
INPUT_PLOT_FILE=error_log_stats.txt.dat
OUTPUT_IMG_FILE=error_log_stats1.png
echo "set terminal pngcairo size 600,450
set output '${OUTPUT_IMG_FILE}'
set title 'Critical Errors By Type (Recently and Week)'
set size 1,1
set key left top
set autoscale
set xlabel 'Type Of Error'
set ylabel 'Number of Errors'
set style fill pattern
set style histogram clustered
set xtic rotate by -45 scale 0.8
plot '${INPUT_PLOT_FILE}' u 2:xtic(1) t 'Recently' w histograms, '' u 3 t 'Week' w histograms

" > gnuplot_tmp_cmd.tmp
gnuplot gnuplot_tmp_cmd.tmp > /dev/null
