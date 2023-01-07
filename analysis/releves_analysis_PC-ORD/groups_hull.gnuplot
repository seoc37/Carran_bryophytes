# Four Groups of relevés plotted against all axis pairs
# and with/without convex hulls
# (six plots altogether)

# uses CSV file "Group4_relevés_data_consolidated_with_analysis.csv"
# which has the rows sorted by group membership in the last column


map_4point_type(n) = ( \
  n == 1 ? 8 : \
  n == 3 ? 9 : \
  n == 17 ? 10 : \
  n == 29 ? 11 : \
    1 )

# colours as used when there are four groups: 1=red, 3=green, 17=blue, 29=magenta
# NB PC-ORD uses cyan, not blue, but it's hard to see
map4color(n) = ( \
  n ==  1 ? 0xff0000 : \
  n ==  3 ? 0x00ff00 : \
  n == 17 ? 0x0000ff : \
  n == 29 ? 0xff00ff : \
            0x000000 )
    
    
# map zero to white and others to black for plotting empty relevés
map_bw(x) = ( \
   (x == 0) ? 0x000000 : 0xffffff\
   )

    
set datafile separator "," # CSV file
set pointsize 1.5
size_mul = 0.7 # multiply the Domin abundance by this scale factor to get point size not too big
set zeroaxis lt 1 lw 2 lc "black"
set border 31 lc "black" lw 3 # all four borders, black
set ytics axis
set xtics axis


set style fill transparent solid 0.1
unset grid


set terminal qt
set termoption enhanced

# groups ordination axes 1 and 2
set xlabel "Axis 1" offset first 2,1.25
set ylabel "Axis 2" offset first 2.4,1.5 rotate by 0
set xrange [-2.1:2.1]
set yrange [-1.1:2.1]
plot "Group4_relevés_data_consolidated_with_analysis.csv" every ::3::39 \
using 18:19:((column(21)==1?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" using 18:19:((column(21)==3?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" using 18:19:((column(21)==17?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" using 18:19:((column(21)==29?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  8 ps 4 lc rgb "red" title "Group A", \
NaN with points pt  9 ps 4 lc rgb "green" title "Group B", \
NaN with points pt 10 ps 4 lc rgb "blue" title "Group C", \
NaN with points pt 11 ps 4 lc rgb "magenta" title "Group D"


# groups ordination axes 1 and 2 with convex hulls
set xlabel "Axis 1" offset first 2,1.25
set ylabel "Axis 2" offset first 2.4,1.5 rotate by 0
set xrange [-2.1:2.1]
set yrange [-1.1:2.1]
plot "Group4_relevés_data_consolidated_with_analysis.csv" every ::3::39 \
using 18:19 convexhull notitle with filledcurves lc rgbcolor "red", \
"" using 18:19:((column(21)==1?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" every ::40::48 using 18:19 convexhull notitle with filledcurves lc rgbcolor "green", \
"" using 18:19:((column(21)==3?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" every ::49::54 using 18:19 convexhull notitle with filledcurves lc rgbcolor "blue", \
"" using 18:19:((column(21)==17?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" every ::55::56 using 18:19 convexhull notitle with filledcurves lc rgbcolor "magenta", \
"" using 18:19:((column(21)==29?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  8 ps 4 lc rgb "red" title "Group A", \
NaN with points pt  9 ps 4 lc rgb "green" title "Group B", \
NaN with points pt 10 ps 4 lc rgb "blue" title "Group C", \
NaN with points pt 11 ps 4 lc rgb "magenta" title "Group D"

# groups ordination axes 1 and 3
set xlabel "Axis 1" offset first 2.0,2.25
set ylabel "Axis 3" offset first 2.4,2 rotate by 0
set xrange [-2.1:2.1]
set yrange [-2.1:2.1]
plot "Group4_relevés_data_consolidated_with_analysis.csv" every ::3::39 \
using 18:20:((column(21)==1?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" using 18:20:((column(21)==3?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" using 18:20:((column(21)==17?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" using 18:20:((column(21)==29?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  8 ps 4 lc rgb "red" title "Group A", \
NaN with points pt  9 ps 4 lc rgb "green" title "Group B", \
NaN with points pt 10 ps 4 lc rgb "blue" title "Group C", \
NaN with points pt 11 ps 4 lc rgb "magenta" title "Group D"


# groups ordination axes 1 and 3 with convex hulls
set xlabel "Axis 1" offset first 2.0,2.25
set ylabel "Axis 3" offset first 2.4,2 rotate by 0
set xrange [-2.1:2.1]
set yrange [-2.1:2.1]
plot "Group4_relevés_data_consolidated_with_analysis.csv" every ::3::39 \
using 18:20 convexhull notitle with filledcurves lc rgbcolor "red", \
"" using 18:20:((column(21)==1?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" every ::40::48 using 18:20 convexhull notitle with filledcurves lc rgbcolor "green", \
"" using 18:20:((column(21)==3?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" every ::49::54 using 18:20 convexhull notitle with filledcurves lc rgbcolor "blue", \
"" using 18:20:((column(21)==17?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" every ::55::56 using 18:20 convexhull notitle with filledcurves lc rgbcolor "magenta", \
"" using 18:20:((column(21)==29?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  8 ps 4 lc rgb "red" title "Group A", \
NaN with points pt  9 ps 4 lc rgb "green" title "Group B", \
NaN with points pt 10 ps 4 lc rgb "blue" title "Group C", \
NaN with points pt 11 ps 4 lc rgb "magenta" title "Group D"

# groups ordination axes 2 and 3
set xlabel "Axis 2" offset first 2.0,2.25
set ylabel "Axis 3" offset first 2.4,2 rotate by 0
set xrange [-2.1:2.1]
set yrange [-2.1:2.1]
plot "Group4_relevés_data_consolidated_with_analysis.csv" every ::3::39 \
using 19:20:((column(21)==1?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" using 19:20:((column(21)==3?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" using 19:20:((column(21)==17?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" using 19:20:((column(21)==29?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  8 ps 4 lc rgb "red" title "Group A", \
NaN with points pt  9 ps 4 lc rgb "green" title "Group B", \
NaN with points pt 10 ps 4 lc rgb "blue" title "Group C", \
NaN with points pt 11 ps 4 lc rgb "magenta" title "Group D"


# groups ordination axes 2 and 3 with convex hulls
set xlabel "Axis 2" offset first 2.0,2.25
set ylabel "Axis 3" offset first 2.4,2 rotate by 0
set xrange [-2.1:2.1]
set yrange [-2.1:2.1]
plot "Group4_relevés_data_consolidated_with_analysis.csv" every ::3::39 \
using 19:20 convexhull notitle with filledcurves lc rgbcolor "red", \
"" using 19:20:((column(21)==1?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" every ::40::48 using 19:20 convexhull notitle with filledcurves lc rgbcolor "green", \
"" using 19:20:((column(21)==3?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" every ::49::54 using 19:20 convexhull notitle with filledcurves lc rgbcolor "blue", \
"" using 19:20:((column(21)==17?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
"" every ::55::56 using 19:20 convexhull notitle with filledcurves lc rgbcolor "magenta", \
"" using 19:20:((column(21)==29?2:0)):(map_4point_type(column(21))):(map4color(column(21))) \
        notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  8 ps 4 lc rgb "red" title "Group A", \
NaN with points pt  9 ps 4 lc rgb "green" title "Group B", \
NaN with points pt 10 ps 4 lc rgb "blue" title "Group C", \
NaN with points pt 11 ps 4 lc rgb "magenta" title "Group D"
