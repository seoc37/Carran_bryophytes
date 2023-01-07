# plot the ordinations per species for 4 groups

# plot points with size determined by column 6 (domin value) and colour by 25 (group)
# for empty values plot a default point of type 4 (unfilled square) in black
#plot "relevés_data_consolidated_with_analysis.csv" using 13:14 with points ps 1 pt 4 lc "black", ""  using 13:14:6:25  with points ps var pt 9 lc var

# uses CSV file "relevés_data_consolidated_with_analysis.csv" which has:
# 4group membership of relevé in column 24
# Domin score in column Cc=5,Cm=7,Rp=6,Rt=9,Cf=8
# ordination coordinates in columns 13, 14, 15
Cc_Domin = 5
Cm_Domin = 7
Rt_Domin = 9
Rp_Domin = 6
Cf_Domin = 8

Axis1 = 13
Axis2 = 14
Axis3 = 15

Group = 24 # column for the group membership

# set up colour mapping for the group codes from PC-ORD
# unused are just mapped to grey
# codes in data are 1, 2, 3, 5, 8, 17, 18, 29, 33, 36, 47, 53
# black is error - not set up in group codes here
# map_color(num) = ( \
#   num == 1 ? 0xff0000 : \
#   num == 2 ? 0x00ff00 : \
#   num == 3 ? 0x0000ff : \
#   num == 5 ? 0xffff00 : \
#   num == 8 ? 0xff00ff : \
#   num == 17 ? 0x00ffff : \
#   num == 18 ? 0xdddd00 : \
#   num == 29 ? 0x4169e1 : \
#   num == 33 ? 0xff7f50 : \
#   num == 36 ? 0xf0e68c : \
#   num == 47 ? 0xffc0c0 : \
#   num == 53 ? 0xd3d3d3 : \
#     0x000000 )

# set up point type mapping for the group codes from PC-ORD
# unused are just mapped to grey
# codes in data are 1, 2, 3, 5, 8, 17, 18, 29, 33, 36, 47, 53
# 0 with + is error -- not set up in group codes here
# map_point_type(n) = ( \
#   n == 1 ? 9 : \
#   n == 2 ? 11 : \
#   n == 3 ? 8 : \
#   n == 5 ? 10 : \
#   n == 8 ? 7 : \
#   n == 17 ? 6 : \
#   n == 18 ? 22 : \
#   n == 29 ? 21 : \
#   n == 33 ? 58 : \
#   n == 36 ? 57 : \
#   n == 47 ? 28 : \
#   n == 53 ? 27 : \
#     1 )

GA_pt = 9 #8
GB_pt = 9
GC_pt = 9 #10
GD_pt = 9 #11

map_4point_type(n) = ( \
  n == 1 ? GA_pt : \
  n == 3 ? GB_pt : \
  n == 17 ? GC_pt : \
  n == 29 ? GD_pt : \
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
set yrange [-2.1:2.1]
set xrange [-2.1:2.1]
set xlabel "Axis 1" offset first 2,2.25
set ylabel "Axis 2" offset first 2.4,2 rotate by 0


set terminal qt
set termoption enhanced

# Cc axes 1-2
set title "{/:Italic Calliergonella cuspidata}"
plot "relevés_data_consolidated_with_analysis.csv" \
     using 13:14:(map_bw(column(Cc_Domin))) notitle with points ps 1 pt 4 lc rgb var, \
""   using 13:14:(column(Cc_Domin)*size_mul):(map_4point_type(column(Group))):(map4color(column(Group))) \
       notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  4 ps 1 lc rgb "black" title "Relevés without {/:Italic Cc}", \
NaN with points pt GA_pt ps 4 lc rgb "red" title "Group A", \
NaN with points pt GB_pt ps 4 lc rgb "green" title "Group B", \
NaN with points pt GC_pt ps 4 lc rgb "blue" title "Group C", \
NaN with points pt GD_pt ps 4 lc rgb "magenta" title "Group D"

# Cm axes 1-2
set title "{/:Italic Ctenidium molluscum}"
plot "relevés_data_consolidated_with_analysis.csv" \
     using 13:14:(map_bw(column(Cm_Domin))) notitle with points ps 1 pt 4 lc rgb var, \
""   using 13:14:(column(Cm_Domin)*size_mul):(map_4point_type(column(Group))):(map4color(column(Group))) \
       notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  4 ps 1 lc rgb "black" title "Relevés without {/:Italic Cm}", \
NaN with points pt GA_pt ps 4 lc rgb "red" title "Group A", \
NaN with points pt GB_pt ps 4 lc rgb "green" title "Group B", \
NaN with points pt GC_pt ps 4 lc rgb "blue" title "Group C", \
NaN with points pt GD_pt ps 4 lc rgb "magenta" title "Group D"

# Rp axes 1-2
set title "{/:Italic Rhizomnium punctatum}"
plot "relevés_data_consolidated_with_analysis.csv" \
     using 13:14:(map_bw(column(Rp_Domin))) notitle with points ps 1 pt 4 lc rgb var, \
""   using 13:14:(column(Rp_Domin)*size_mul):(map_4point_type(column(Group))):(map4color(column(Group))) \
       notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  4 ps 1 lc rgb "black" title "Relevés without {/:Italic Rp}", \
NaN with points pt GA_pt ps 4 lc rgb "red" title "Group A", \
NaN with points pt GB_pt ps 4 lc rgb "green" title "Group B", \
NaN with points pt GC_pt ps 4 lc rgb "blue" title "Group C", \
NaN with points pt GD_pt ps 4 lc rgb "magenta" title "Group D"

# Rt axes 1-2
set title "{/:Italic Rhytidiadelphus triquetrus}"
plot "relevés_data_consolidated_with_analysis.csv" \
     using 13:14:(map_bw(column(Rt_Domin))) notitle with points ps 1 pt 4 lc rgb var, \
""   using 13:14:(column(Rt_Domin)*size_mul):(map_4point_type(column(Group))):(map4color(column(Group))) \
       notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  4 ps 1 lc rgb "black" title "Relevés without {/:Italic Rt}", \
NaN with points pt GA_pt ps 4 lc rgb "red" title "Group A", \
NaN with points pt GB_pt ps 4 lc rgb "green" title "Group B", \
NaN with points pt GC_pt ps 4 lc rgb "blue" title "Group C", \
NaN with points pt GD_pt ps 4 lc rgb "magenta" title "Group D"

# Cf axes 1-2
set title "{/:Italic Cinclidotus fontinaloides}"
plot "relevés_data_consolidated_with_analysis.csv" \
     using 13:14:(map_bw(column(Cf_Domin))) notitle with points ps 1 pt 4 lc rgb var, \
""   using 13:14:(column(Cf_Domin)*size_mul):(map_4point_type(column(Group))):(map4color(column(Group))) \
       notitle with points ps var pt var lc rgbcolor var, \
NaN with points pt  4 ps 1 lc rgb "black" title "Relevés without {/:Italic Cf}", \
NaN with points pt GA_pt ps 4 lc rgb "red" title "Group A", \
NaN with points pt GB_pt ps 4 lc rgb "green" title "Group B", \
NaN with points pt GC_pt ps 4 lc rgb "blue" title "Group C", \
NaN with points pt GD_pt ps 4 lc rgb "magenta" title "Group D"
