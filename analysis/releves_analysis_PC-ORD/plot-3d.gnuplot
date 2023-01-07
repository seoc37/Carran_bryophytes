# Plot ordination of 4 groups in 3d after cluster analysis

# Set up colour mapping for the group codes from PC-ORD
# when all 12 groups are used
# unused are just mapped to grey
# codes in data are 1, 2, 3, 5, 8, 17, 18, 29, 33, 36, 47, 53
# black is error - not set up in group codes here
map_color(num) = ( \
  num == 1 ? 0xff0000 : \
  num == 2 ? 0x00ff00 : \
  num == 3 ? 0x00ffff : \
  num == 5 ? 0xff00ff : \
  num == 8 ? 0x0000ff : \
  num == 17 ? 0x808080 : \
  num == 18 ? 0x800000 : \
  num == 29 ? 0x808000 : \
  num == 33 ? 0x008000 : \
  num == 36 ? 0x008080 : \
  num == 47 ? 0x800080 : \
  num == 53 ? 0x808080 : \
    0x000000 )

# colours as used when there are four groups: 1=red, 3=green, 17=cyan, 29=magenta
map4color(n) = ( \
  n ==  1 ? 0xff0000 : \
  n ==  3 ? 0x00ff00 : \
  n == 17 ? 0x00ffff : \
  n == 29 ? 0xff00ff : \
            0x000000 )
    
set xyplane at 0

set xlabel "Axis 1"
set ylabel "Axis 2"
set zlabel "Axis 3" offset first 0,0,1.5

set xrange[-2:2]
set zrange[-2:1]
set yrange[-2:2]

set datafile sep ','
set termoption enhanced

set title "Four groups from cluster analysis in 3D ordination space"
set key box

# 13:14:15 == Axes 1, 2 ,3
# 23 = group values for 4 groups after cluster analysis

splot 'relevés_data_consolidated_with_analysis.csv' using 13:14:15:(map4color(column(24))) notitle with points pt 7 lc rgb var ps 3, \
NaN with points pt 9 ps 3 lc rgb "red" title "Group A", \
NaN with points pt 9 ps 3 lc rgb "green" title "Group B", \
NaN with points pt 9 ps 3 lc rgb "cyan" title "Group C", \
NaN with points pt 9 ps 3 lc rgb "magenta" title "Group D"

