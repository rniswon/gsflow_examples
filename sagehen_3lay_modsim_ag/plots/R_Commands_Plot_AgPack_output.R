inpth <- 'D:/edm_lt/github/modsim-gsflow_dev/gsflow_examples.git/sagehen_3lay_modsim_ag/output/modflow'

dat24sfr <- read.table(paste(inpth, 'sagehensfr24_ag.out', sep='/'), header=TRUE)
dat25sfr <- read.table(paste(inpth, 'sagehensfr25_ag.out', sep='/'), header=TRUE)

dat24ag <- read.table(paste(inpth, 'sagehensfret24_ag.out', sep='/'), header=TRUE)
dat25ag <- read.table(paste(inpth, 'sagehensfret25_ag.out', sep='/'), header=TRUE)

# SFR Diversion 24
# ---------------
plot(dat24sfr$TIME, dat24sfr$SW.RIGHT, typ='l', col='blue', lty=1, las=1)
points(dat24sfr$TIME, dat24sfr$SW.DIVERSION, typ='l', col='red', lty=2)
points(dat24sfr$TIME, dat24sfr$SUP.PUMPING, typ='l',col='limegreen', lty=2)

# SFR Diversion 25
# ---------------
plot(dat25sfr$TIME, dat25sfr$SW.RIGHT, typ='l', col='blue', lty=1, las=1)
points(dat25sfr$TIME, dat25sfr$SW.DIVERSION, typ='l', col='red', lty=2)
points(dat25sfr$TIME, dat25sfr$SUP.PUMPING, typ='l',col='limegreen', lty=2)
 

# SFR Ag Area 24
# ---------------
plot(dat24ag$TIME, dat24ag$ETww, typ='l', col='blue', lty=1, las=1)
points(dat24ag$TIME, dat24ag$ETa, typ='l', col='red', lty=2)

# SFR Ag Area 25
# ---------------
plot(dat25ag$TIME, dat25ag$ETww, typ='l', col='blue', lty=1, las=1)
points(dat25ag$TIME, dat25ag$ETa, typ='l', col='red', lty=2)

