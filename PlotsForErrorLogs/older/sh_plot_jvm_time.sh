#!/bin/sh
OUTPUT_IMG_FILE=request_log_jvm_time.png

echo "set terminal pngcairo size 1024,768
set output '${OUTPUT_IMG_FILE}'
set title 'Critical Errors By RequestTime (Past Day)'
set size 1,1
set key left top
set autoscale
set xlabel 'OccurenceIndex'
set ylabel 'RequestTimeAtError (in millis)'
set style fill pattern
set style histogram clustered
set xtic rotate by -45 scale 0.8   
set log y  
plot  \\
 'LogScanTerms_All.csv.rsprod26_1.minuteplot.dat' u 4:6 t '1' w points,     \\
 'LogScanTerms_All.csv.rsprod26_2.minuteplot.dat' u 4:6 t '2' w points,  \\
 'LogScanTerms_All.csv.rsprod26_3.minuteplot.dat' u 4:6 t '3' w points,  \\
 'LogScanTerms_All.csv.rsprod26_4.minuteplot.dat' u 4:6 t '4' w points  \\
" > gnuplot_tmp_cmd.tmp
gnuplot gnuplot_tmp_cmd.tmp > /dev/null
