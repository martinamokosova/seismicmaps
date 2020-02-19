library(rgdal)          # to read shapefile in R
library(rgeos)          # to find polygon centroids - gCentroid() function
library(plyr)           # to join the data frames
library(tidyverse)      # includes stringr and ggplot packages
library(shadowtext)
library(RColorBrewer)
library(jcolors)
library(gridExtra)

###############################################    D A T A   I M P O R T    ###############################################

eumap <- readOGR(dsn = "C:\\Users\\mbgnwmab.DS\\ndsha\\R work mapping", layer ="NUTS_RG_10M_2016_4326_LEVL_0" )

#.............................................................. M U S S O N ..............................................................#

godlay_musson_ext_mw4_ext_2q1stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw4_ext_2q1stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_ext_mw4_ext_2q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw4_ext_2q3stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_ext_mw4_ext_2q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw4_ext_2q9stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_ext_mw4_ext_3q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw4_ext_3q3stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_ext_mw4_ext_3q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw4_ext_3q9stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_ext_mw5_ext_2q1stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw5_ext_2q1stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_ext_mw5_ext_2q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw5_ext_2q3stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_ext_mw5_ext_2q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw5_ext_2q9stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_ext_mw5_ext_3q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw5_ext_3q3stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_ext_mw5_ext_3q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw5_ext_3q9stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)

godlay_musson_pt_mw4_pt_2q1stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw4_pt_2q1stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_pt_mw4_pt_2q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw4_pt_2q3stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_pt_mw4_pt_2q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw4_pt_2q9stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_pt_mw4_pt_3q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw4_pt_3q3stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_pt_mw4_pt_3q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw4_pt_3q9stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_pt_mw5_pt_2q1stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw5_pt_2q1stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_pt_mw5_pt_2q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw5_pt_2q3stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_pt_mw5_pt_2q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw5_pt_2q9stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_pt_mw5_pt_3q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw5_pt_3q3stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_musson_pt_mw5_pt_3q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/pt/mw5_pt_3q9stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)

#.............................................................. S H A R E ..............................................................#

# godlay_share_ext_mw4_ext_2q1stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw4_ext_share_2q1stp.txt", 
#                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_share_ext_mw4_ext_2q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw4_ext_share_2q3stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_share_ext_mw4_ext_2q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw4_ext_share_2q9stp.txt", 
                                               quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_ext_mw4_ext_3q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw4_ext_share_3q3stp.txt", 
#                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_ext_mw4_ext_3q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw4_ext_share_3q9stp.txt", 
#                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_ext_mw5_ext_2q1stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw5_ext_share_2q1stp.txt", 
#                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_ext_mw5_ext_2q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw5_ext_share_2q3stp.txt", 
#                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_ext_mw5_ext_2q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw5_ext_share_2q9stp.txt", 
#                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_ext_mw5_ext_3q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw5_ext_share_3q3stp.txt", 
#                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_ext_mw5_ext_3q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/ext/mw5_ext_share_3q9stp.txt", 
#                                                quote="\"", comment.char="", stringsAsFactors=FALSE)

# godlay_share_pt_mw4_pt_2q1stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw4_pt_share_2q1stp.txt", 
#                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_share_pt_mw4_pt_2q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw4_pt_share_2q3stp.txt", 
                                             quote="\"", comment.char="", stringsAsFactors=FALSE)
godlay_share_pt_mw4_pt_2q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw4_pt_share_2q9stp.txt", 
                                             quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_pt_mw4_pt_3q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw4_pt_share_3q3stp.txt", 
#                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_pt_mw4_pt_3q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw4_pt_share_3q9stp.txt", 
#                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_pt_mw5_pt_2q1stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw5_pt_share_2q1stp.txt", 
#                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_pt_mw5_pt_2q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw5_pt_share_2q3stp.txt", 
#                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_pt_mw5_pt_2q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw5_pt_share_2q9stp.txt", 
#                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_pt_mw5_pt_3q3stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw5_pt_share_3q3stp.txt", 
#                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
# godlay_share_pt_mw5_pt_3q9stp <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/share/pt/mw5_pt_share_3q9stp.txt", 
#                                              quote="\"", comment.char="", stringsAsFactors=FALSE)

#.............................................................. M I S L A Y ..............................................................#

mislay_ext_mw4_ext_musc_31fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/ext/mw4_ext_musc_31fps_ms1.txt", 
                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_ext_mw4_ext_musc_44fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/ext/mw4_ext_musc_44fps_ms1.txt", 
                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_ext_mw4_ext_musc_44fps_ms9 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/ext/mw4_ext_musc_44fps_ms9.txt", 
                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_ext_mw4_ext_musold_31fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/ext/mw4_ext_musold_31fps_ms1.txt", 
                                              quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_ext_mw5_ext_musc_31fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/ext/mw5_ext_musc_31fps_ms1.txt", 
                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_ext_mw5_ext_musc_44fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/ext/mw5_ext_musc_44fps_ms1.txt", 
                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_ext_mw5_ext_musc_44fps_ms9 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/ext/mw5_ext_musc_44fps_ms9.txt", 
                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_ext_mw5_ext_musold_31fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/ext/mw5_ext_musold_31fps_ms1.txt", 
                                                  quote="\"", comment.char="", stringsAsFactors=FALSE)

mislay_pt_mw4_pt_musc_31fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/pt/mw4_pt_musc_31fps_ms1.txt", 
                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_pt_mw4_pt_musc_44fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/pt/mw4_pt_musc_44fps_ms1.txt", 
                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_pt_mw4_pt_musc_44fps_ms9 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/pt/mw4_pt_musc_44fps_ms9.txt", 
                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_pt_mw4_pt_musold_31fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/pt/mw4_pt_musold_31fps_ms1.txt", 
                                                  quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_pt_mw5_pt_musc_31fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/pt/mw5_pt_musc_31fps_ms1.txt", 
                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_pt_mw5_pt_musc_44fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/pt/mw5_pt_musc_44fps_ms1.txt", 
                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_pt_mw5_pt_musc_44fps_ms9 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/pt/mw5_pt_musc_44fps_ms9.txt", 
                                                quote="\"", comment.char="", stringsAsFactors=FALSE)
mislay_pt_mw5_pt_musold_31fps_ms1 <- read.table("C:/Users/mbgnwmab.DS/ndsha/R work mapping/mislay/pt/mw5_pt_musold_31fps_ms1.txt", 
                                                  quote="\"", comment.char="", stringsAsFactors=FALSE)



###############################################    D A T A   T R A N S F O R M A T I O N    ###############################################

#.............................................................. rename headers ..............................................................#
rsi_data <- c(godlay_musson_ext_mw4_ext_2q1stp,
            godlay_musson_ext_mw4_ext_2q3stp,
            godlay_musson_ext_mw4_ext_2q9stp,
            godlay_musson_ext_mw4_ext_3q3stp,
            godlay_musson_ext_mw4_ext_3q9stp,
            godlay_musson_ext_mw5_ext_2q1stp,
            godlay_musson_ext_mw5_ext_2q3stp,
            godlay_musson_ext_mw5_ext_2q9stp,
            godlay_musson_ext_mw5_ext_3q3stp,
            godlay_musson_ext_mw5_ext_3q9stp,
            godlay_musson_pt_mw4_pt_2q1stp,
            godlay_musson_pt_mw4_pt_2q3stp,
            godlay_musson_pt_mw4_pt_2q9stp,
            godlay_musson_pt_mw4_pt_3q3stp,
            godlay_musson_pt_mw4_pt_3q9stp,
            godlay_musson_pt_mw5_pt_2q1stp,
            godlay_musson_pt_mw5_pt_2q3stp,
            godlay_musson_pt_mw5_pt_2q9stp,
            godlay_musson_pt_mw5_pt_3q3stp,
            godlay_musson_pt_mw5_pt_3q9stp,
            godlay_share_ext_mw4_ext_2q3stp,
            godlay_share_ext_mw4_ext_2q9stp,
            godlay_share_pt_mw4_pt_2q3stp,
            godlay_share_pt_mw4_pt_2q9stp,
            mislay_ext_mw4_ext_musc_31fps_ms1,
            mislay_ext_mw4_ext_musc_44fps_ms1,
            mislay_ext_mw4_ext_musc_44fps_ms9,
            mislay_ext_mw4_ext_musold_31fps_ms1,
            mislay_ext_mw5_ext_musc_31fps_ms1,
            mislay_ext_mw5_ext_musc_44fps_ms1,
            mislay_ext_mw5_ext_musc_44fps_ms9,
            mislay_ext_mw5_ext_musold_31fps_ms1,
            mislay_pt_mw4_pt_musc_31fps_ms1,
            mislay_pt_mw4_pt_musc_44fps_ms1,
            mislay_pt_mw4_pt_musc_44fps_ms9,
            mislay_pt_mw4_pt_musold_31fps_ms1,
            mislay_pt_mw5_pt_musc_31fps_ms1,
            mislay_pt_mw5_pt_musc_44fps_ms1,
            mislay_pt_mw5_pt_musc_44fps_ms9,
            mislay_pt_mw5_pt_musold_31fps_ms1
)


nameHeaders<-function(x){
  for (i in rsi_data){
  names(i)(x)<-c("long","lat","rsi","v4","v5","v6")
}}

lapply(c(godlay_musson_ext_mw4_ext_2q1stp,
         godlay_musson_ext_mw4_ext_2q3stp,
         godlay_musson_ext_mw4_ext_2q9stp,
         godlay_musson_ext_mw4_ext_3q3stp,
         godlay_musson_ext_mw4_ext_3q9stp,
         godlay_musson_ext_mw5_ext_2q1stp,
         godlay_musson_ext_mw5_ext_2q3stp,
         godlay_musson_ext_mw5_ext_2q9stp,
         godlay_musson_ext_mw5_ext_3q3stp,
         godlay_musson_ext_mw5_ext_3q9stp,
         godlay_musson_pt_mw4_pt_2q1stp,
         godlay_musson_pt_mw4_pt_2q3stp,
         godlay_musson_pt_mw4_pt_2q9stp,
         godlay_musson_pt_mw4_pt_3q3stp,
         godlay_musson_pt_mw4_pt_3q9stp,
         godlay_musson_pt_mw5_pt_2q1stp,
         godlay_musson_pt_mw5_pt_2q3stp,
         godlay_musson_pt_mw5_pt_2q9stp,
         godlay_musson_pt_mw5_pt_3q3stp,
         godlay_musson_pt_mw5_pt_3q9stp,
         godlay_share_ext_mw4_ext_2q3stp,
         godlay_share_ext_mw4_ext_2q9stp,
         godlay_share_pt_mw4_pt_2q3stp,
         godlay_share_pt_mw4_pt_2q9stp,
         mislay_ext_mw4_ext_musc_31fps_ms1,
         mislay_ext_mw4_ext_musc_44fps_ms1,
         mislay_ext_mw4_ext_musc_44fps_ms9,
         mislay_ext_mw4_ext_musold_31fps_ms1,
         mislay_ext_mw5_ext_musc_31fps_ms1,
         mislay_ext_mw5_ext_musc_44fps_ms1,
         mislay_ext_mw5_ext_musc_44fps_ms9,
         mislay_ext_mw5_ext_musold_31fps_ms1,
         mislay_pt_mw4_pt_musc_31fps_ms1,
         mislay_pt_mw4_pt_musc_44fps_ms1,
         mislay_pt_mw4_pt_musc_44fps_ms9,
         mislay_pt_mw4_pt_musold_31fps_ms1,
         mislay_pt_mw5_pt_musc_31fps_ms1,
         mislay_pt_mw5_pt_musc_44fps_ms1,
         mislay_pt_mw5_pt_musc_44fps_ms9,
         mislay_pt_mw5_pt_musold_31fps_ms1
         ),nameHeaders)

View(godlay_musson_ext_mw4_ext_2q9stp)

#.............................................................. transform map data ..............................................................#

#.........transform the SpatialPolygonsDataFrame into a data.frame
eumap@data$id <- rownames(eumap@data)
eumap_df <- fortify(eumap)
eumap_df <- join(eumap_df, eumap@data, by="id")

#.........limit the coordinates to show only northwest europe and the uk
northwestmap <- eumap_df[eumap_df$long > -9 & eumap_df$long < 3 & eumap_df$lat > 49 & eumap_df$lat < 60, ]
ukmap <- northwestmap[northwestmap$CNTR_CODE == "UK", ]
nwmap <- northwestmap[northwestmap$CNTR_CODE != "UK", ]




###############################################    D A T A   V I S U A L I Z A T I O N    ###############################################

#.............................................................. base map data ..............................................................#
x_labels <- c("8°W", "6°W", "4°W", "2°W", "0°", "2°E")
y_labels <- c("49°N", "50°N","51°N","52°N","53°N","54°N","55°N","56°N","57°N","58°N","59°N","60°N")
basemap <- ggplot() + geom_polygon(data=nwmap, aes(x = long, y=lat, group=group), fill="#eeeeee") +
  geom_polygon(data=ukmap, aes(x = long, y=lat, group=group), fill="white" ,colour="grey") +
  coord_quickmap() +
  theme_bw() +
  scale_fill_grey(start = 0.8, end = 0.7) +
  guides(fill=FALSE) +
  scale_y_continuous(expand=c(0,0), breaks = seq(49,60,1), labels = y_labels, sec.axis = dup_axis()) +
  scale_x_continuous(expand=c(0,0), breaks = seq(-8,2,2), labels = x_labels, sec.axis = dup_axis()) +
  theme(panel.grid = element_line(colour = "#f2f2f2", size = .1),
        panel.grid.minor = element_blank(),
        axis.ticks = element_blank(),
        rect = element_rect(fill = "transparent")) +
  xlab("") + ylab("")


#.............................................................. earthquake data ..............................................................#
map_godlay_musson_ext_mw4_ext_2q1stp <- basemap + geom_point(data = godlay_musson_ext_mw4_ext_2q1stp, 
                       aes(x = V1, y = V2, colour = V3), size=2.5) +
  scale_colour_manual(values=c("#66FFFF", "#00FF00", "#FFFF00", "#FFCC00", "#FF9900", "#FF3300", "#CC0000", "#660000")) +
  theme(legend.title = element_text(size = 10))


###############################################    S A V E   T H E   F I L E S    ###############################################

#.............................................................. M U S S O N ..............................................................#

ggsave(filename = "C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw4_ext_2q1stp.png", plot = map_godlay_musson_ext_mw4_ext_2q1stp,
       device = "png", width = 7, height = 7, units = "in")
ggsave(filename = "C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw4_ext_2q3stp.png", plot = map_godlay_musson_ext_mw4_ext_2q3stp,
       device = "png", width = 7, height = 7, units = "in")
ggsave(filename = "C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw4_ext_2q3stp.png", plot = map_godlay_musson_ext_mw4_ext_2q3stp,
       device = "png", width = 7, height = 7, units = "in")
ggsave(filename = "C:/Users/mbgnwmab.DS/ndsha/R work mapping/godlay/musson/ext/mw4_ext_2q3stp.png", plot = map_godlay_musson_ext_mw4_ext_2q3stp,
       device = "png", width = 7, height = 7, units = "in")
