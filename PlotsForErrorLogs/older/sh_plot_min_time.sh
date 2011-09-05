#!/bin/sh
OUTPUT_IMG_FILE=request_log_min_time.png

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
set xtics ('Fri_Jul_01_01:09' 32406 )
plot 'LogScanTerms_All.csv.minuteplot.dat'  \\
           u 4:6 t 'BegReq' w points,     \\
        '' u 4:7 t 'Critical' w points,   \\
        '' u 4:8 t 'Null' w points,       \\
        '' u 4:9 t 'Excep' w points,       \\
        '' u 4:10 t 'TermFound' w impulses 
" > gnuplot_tmp_cmd.tmp
gnuplot gnuplot_tmp_cmd.tmp > /dev/null
