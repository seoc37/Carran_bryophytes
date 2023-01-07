# gnuplot commands for ISA graph
#set terminal pdfcairo
#set output "isa.pdf"
set title "Indicator species analysis of Carran data"
set ytics nomirror
set xrange [0:12]
set y2range [0:5]
set y2tics 1
set y2range [0:6]
set xtics 1
set xlabel "Number of groups"
set ylabel "Mean probability for indicators"
set y2label "Number of significant indicators"
plot "isa.dat" using 1:2 title "Mean p" with linespoints pt 5 axis x1y1, "" using 1:3 title "Number of indicators" with linespoints pt 7 axis x1y2
