# plot the number of species vs releves
set datafile separator ","


set yrange [0:50]
set boxwidth .5


set xrange [ 0.5 : 4.50000 ]
set xtics 1 scale 0

unset key

set title "Species counts in relevés"
set xlabel "Number of species"
set ylabel "Number of relevés"

set style fill solid

set yrange [ 0.00000 : 45.0000 ]


plot "spp-vs-releve-count.csv" skip 1 u 1:2 with boxes lc rgb 0x7777ff, '' u 1:2:2 with labels offset char 0,1
