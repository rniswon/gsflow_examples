dat <- read.table("F:/Ag-MAR/MS-MF_wR_Extended/MF/Evap_Summary.txt",header=TRUE)

dat$wyr <- as.numeric(format(as.Date(dat$Date),"%Y"))
is.nxt <- as.numeric(format(as.Date(dat$Date),"%m")) %in% 1:9
dat$wyr[!is.nxt] <- dat$wyr[!is.nxt] + 1

aggregate(Lake_Evap_cmd ~ wyr, dat, mean)