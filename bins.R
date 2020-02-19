#.........TRANSFORM THE NDSHA DATA..................................................................................
names(testukmw4_pt_2q9stp) <- c("longitude", "latitude", "maxvalue","maxvalueperiod","minvalueperiod","maxvalmagnitude")


ggplot()+geom_histogram(data=testukmw4_pt_2q9stp,aes(maxvalueg), bins = 8, colour="white")
testukmw4_pt_2q9stp$maxvalueg <- testukmw4_pt_2q9stp$maxvalue/980.665
testukmw4_pt_2q9stp$Ares_g <- case_when(
  testukmw4_pt_2q9stp$maxvalueg < 0.005 ~ "0.000",
  testukmw4_pt_2q9stp$maxvalueg < 0.010 ~ "0.005",
  testukmw4_pt_2q9stp$maxvalueg < 0.020 ~ "0.010",
  testukmw4_pt_2q9stp$maxvalueg < 0.040 ~ "0.020",
  testukmw4_pt_2q9stp$maxvalueg < 0.080 ~ "0.040",
  testukmw4_pt_2q9stp$maxvalueg < 0.150 ~ "0.080",
  testukmw4_pt_2q9stp$maxvalueg < 0.300 ~ "0.150",
  TRUE ~ "0.300"
)

testukmw4_pt_2q9stp$Ares_g2 <- case_when(
  testukmw4_pt_2q9stp$maxvalue < 2.5 ~ "0.000",
  testukmw4_pt_2q9stp$maxvalue < 7.5 ~ "0.005",
  testukmw4_pt_2q9stp$maxvalue < 15 ~ "0.010",
  testukmw4_pt_2q9stp$maxvalue < 30 ~ "0.020",
  testukmw4_pt_2q9stp$maxvalue < 60 ~ "0.040",
  testukmw4_pt_2q9stp$maxvalue < 115 ~ "0.080",
  testukmw4_pt_2q9stp$maxvalue < 225 ~ "0.150",
  TRUE ~ "0.300"
)

testukmw4_pt_2q9stp$Ares_gpsha <- case_when(
  testukmw4_pt_2q9stp$maxvalueg < 0.020 ~ "0.000",
  testukmw4_pt_2q9stp$maxvalueg < 0.040 ~ "0.020",
  testukmw4_pt_2q9stp$maxvalueg < 0.060 ~ "0.040",
  testukmw4_pt_2q9stp$maxvalueg < 0.080 ~ "0.060",
  testukmw4_pt_2q9stp$maxvalueg < 0.100 ~ "0.080",
  testukmw4_pt_2q9stp$maxvalueg < 0.120 ~ "0.100",
  testukmw4_pt_2q9stp$maxvalueg < 0.140 ~ "0.120",
  testukmw4_pt_2q9stp$maxvalueg < 0.160 ~ "0.140",
  TRUE ~ "0.160"
)
