library(dplyr)


# copy the path to the MasterDataset csv
setwd("/Users/0626t/Documents")
br_original <- read.csv("MasterDataset.csv")

# 24 is Maryland

br_md15 <- filter(br_original, br_original$X_STATE == "Maryland" & br_original$IYEAR == "b'2015'"
)
md_only15 <- sample_n(br_md15, size = 500, replace = F)
md_only15 <- na.omit(md_only15)
md_only15 <- sample_n(md_only15, size = 200, replace = F)


br_dc15 <- filter(br_original, br_original$X_STATE == "DC" & br_original$IYEAR == "b'2015'"
)
dc_only15 <- sample_n(br_dc15, size = 500, replace = F)
dc_only15 <- na.omit(dc_only15)
dc_only15 <- sample_n(dc_only15, size = 200, replace = F)


br_va15 <- filter(br_original, br_original$X_STATE == "Virginia" & br_original$IYEAR == "b'2015'"
)
va_only15 <- sample_n(br_va15, size = 500, replace = F)
va_only15 <- na.omit(va_only15)
va_only15 <- sample_n(va_only15, size = 200, replace = F)

br_original15 <- rbind(md_only15, dc_only15, va_only15)




#2014

br_md14 <- filter(br_original, br_original$X_STATE == "Maryland" & br_original$IYEAR == "b'2014'"
)
md_only14 <- sample_n(br_md14, size = 500, replace = F)
md_only14 <- na.omit(md_only14)
md_only14 <- sample_n(md_only14, size = 200, replace = F)


br_dc14 <- filter(br_original, br_original$X_STATE == "DC" & br_original$IYEAR == "b'2014'"
)
dc_only14 <- sample_n(br_dc14, size = 500, replace = F)
dc_only14 <- na.omit(dc_only14)
dc_only14 <- sample_n(dc_only14, size = 200, replace = F)


br_va14 <- filter(br_original, br_original$X_STATE == "Virginia" & br_original$IYEAR == "b'2014'"
)
va_only14 <- sample_n(br_va14, size = 500, replace = F)
va_only14 <- na.omit(va_only14)
va_only14 <- sample_n(va_only14, size = 200, replace = F)

br_original14 <- rbind(md_only14, dc_only14, va_only14)

#2013

br_md2013 <- filter(br_original, br_original$X_STATE == "Maryland" & br_original$IYEAR == "b'2013'"
)
md_only2013 <- sample_n(br_md2013, size = 500, replace = F)
md_only2013 <- na.omit(md_only2013)
md_only2013 <- sample_n(md_only2013, size = 200, replace = F)


br_dc2013 <- filter(br_original, br_original$X_STATE == "DC" & br_original$IYEAR == "b'2013'"
)
dc_only2013 <- sample_n(br_dc2013, size = 500, replace = F)
dc_only2013 <- na.omit(dc_only2013)
dc_only2013 <- sample_n(dc_only2013, size = 200, replace = F)


br_va2013 <- filter(br_original, br_original$X_STATE == "Virginia" & br_original$IYEAR == "b'2013'"
)
va_only2013 <- sample_n(br_va2013, size = 500, replace = F)
va_only2013 <- na.omit(va_only2013)
va_only2013 <- sample_n(va_only2013, size = 200, replace = F)

br_original13 <- rbind(md_only2013, dc_only2013, va_only2013)

#2012
br_md2012 <- filter(br_original, br_original$X_STATE == "Maryland" & br_original$IYEAR == "b'2012'"
)
md_only2012 <- sample_n(br_md2012, size = 500, replace = F)
md_only2012 <- na.omit(md_only2012)
md_only2012 <- sample_n(md_only2012, size = 200, replace = F)


br_dc2012 <- filter(br_original, br_original$X_STATE == "DC" & br_original$IYEAR == "b'2012'"
)
dc_only2012 <- sample_n(br_dc2012, size = 500, replace = F)
dc_only2012 <- na.omit(dc_only2012)
dc_only2012 <- sample_n(dc_only2012, size = 200, replace = F)


br_va2012 <- filter(br_original, br_original$X_STATE == "Virginia" & br_original$IYEAR == "b'2012'"
)
va_only2012 <- sample_n(br_va2012, size = 500, replace = F)
va_only2012 <- na.omit(va_only2012)
va_only2012 <- sample_n(va_only2012, size = 200, replace = F)

br_original12 <- rbind(md_only2012, dc_only2012, va_only2012)


#2011
br_md2011 <- filter(br_original, br_original$X_STATE == "Maryland" & br_original$IYEAR == "b'2011'"
)
md_only2011 <- sample_n(br_md2011, size = 500, replace = F)
md_only2011 <- na.omit(md_only2011)
md_only2011 <- sample_n(md_only2011, size = 200, replace = F)


br_dc2011 <- filter(br_original, br_original$X_STATE == "DC" & br_original$IYEAR == "b'2011'"
)
dc_only2011 <- sample_n(br_dc2011, size = 500, replace = F)
dc_only2011 <- na.omit(dc_only2011)
dc_only2011 <- sample_n(dc_only2011, size = 200, replace = F)


br_va2011 <- filter(br_original, br_original$X_STATE == "Virginia" & br_original$IYEAR == "b'2011'"
)
va_only2011 <- sample_n(br_va2011, size = 500, replace = F)
va_only2011 <- na.omit(va_only2011)
va_only2011 <- sample_n(va_only2011, size = 200, replace = F)

br_original11 <- rbind(md_only2011, dc_only2011, va_only2011)

ds <- rbind(br_original11, br_original12, br_original13, br_original14, br_original15)
View(ds)

write.csv(ds, "/Users/0626t/Documents/complete_brfss.csv")

