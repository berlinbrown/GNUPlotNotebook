#!/bin/sh
OUTPUT_IMG_FILE=request_log_time.png

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
#set xtics ('Jun28_7:23am' 317243, 'Jun28_19:44' 317800, 'Jun28_23:35' 318215)
set xtics ('Tue_Jun_28_06:49' 317209, 'Tue_Jun_28_13:07' 317587, 'Tue_Jun_28_15:27' 317727, 'Tue_Jun_28_19:08' 317948, 'Tue_Jun_28_20:03' 318003, 'Tue_Jun_28_20:09' 318009, 'Tue_Jun_28_20:42' 318042, 'Tue_Jun_28_23:34' 318214, 'Tue_Jun_28_00:56' 317576, 'Tue_Jun_28_13:05' 317585, 'Tue_Jun_28_13:28' 317608, 'Tue_Jun_28_18:04' 317884, 'Tue_Jun_28_18:24' 317904, 'Tue_Jun_28_19:05' 317945, 'Tue_Jun_28_20:08' 318008, 'Tue_Jun_28_20:24' 318024, 'Tue_Jun_28_20:59' 318059, 'Tue_Jun_28_22:29' 318149, 'Tue_Jun_28_22:53' 318173, 'Tue_Jun_28_22:57' 318177, 'Tue_Jun_28_00:09' 317529, 'Tue_Jun_28_00:25' 317545, 'Tue_Jun_28_00:49' 317569, 'Tue_Jun_28_13:08' 317588, 'Tue_Jun_28_20:25' 318025, 'Tue_Jun_28_22:07' 318127 )
plot 'LogScanTerms_All.csv.timeplot.dat'   \\
           u 3:5 t 'BegReq' w impulses,    \\
        '' u 3:6 t 'Critical' w impulses,  \\
        '' u 3:7 t 'Null' w impulses,      \\
        '' u 3:8 t 'Excep' w impulses 
" > gnuplot_tmp_cmd.tmp
gnuplot gnuplot_tmp_cmd.tmp > /dev/null
