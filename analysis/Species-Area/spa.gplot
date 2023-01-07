# GNUplot commands to plot the species-area curve

set datafile separator ","
set grid
set title 'Species-Area curve for Carran Turlough sampling' font "Charter,12"
set ylabel 'Mean species count per relevé' font "Charter,12"
set xlabel 'Relevé area (m^2)' font "Charter,12"
set xtics 0.1 font "Charter,10"
set ytics 0.1 font "Charter,10"
#set pointsize 2
set linetype 1 lw 2 lc rgb "blue"
unset key
#set style line 1 lt 2 lw 2 pt 3 ps 0.5

# output to PDF file
set terminal pdfcairo
set output 'carran-species-area-curve.pdf'

plot [0:1.1] [1:2] 'species-area.csv' using "Area":"Count" with linespoints pt 5 ps 1
