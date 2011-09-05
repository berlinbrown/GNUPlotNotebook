#!/bin/sh
OUTPUT_IMG_FILE=error_log_time.png

echo "set terminal pngcairo size 600,450
set output '${OUTPUT_IMG_FILE}'
set title 'Errors By RequestTime (Past Day)'
set size 1,1
set key left top
set autoscale
set xlabel 'OccurenceIndex'
set ylabel 'RequestTimeAtError (in millis)'
set style fill pattern
set style histogram clustered
set xtic rotate by -45 scale 0.8
plot 'LogScanCriticalErrorsParse_byWEEK.proc1.dat' u 1:2 t 'PageExp' w points, 'LogScanCriticalErrorsParse_byWEEK.proc2.dat' u 1:2 t 'InvalidUrl' w points, 'LogScanCriticalErrorsParse_byWEEK.proc3.dat' u 1:2 t 'NullPtr' w points,  'LogScanCriticalErrorsParse_byWEEK.proc4.dat' u 1:2 t 'SaveErr' w points

" > gnuplot_tmp_cmd.tmp
gnuplot gnuplot_tmp_cmd.tmp > /dev/null
