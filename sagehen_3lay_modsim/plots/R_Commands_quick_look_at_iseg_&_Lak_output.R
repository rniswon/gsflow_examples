pth <- 'D:/edm_lt/github/modsim-gsflow_dev/gsflow_examples.git/sagehen_3lay_modsim/output/modflow'
plt_pth <- 'D:/edm_lt/github/modsim-gsflow_dev/gsflow_examples.git/sagehen_3lay_modsim/plots'

inline_stor  <- read.table(paste(pth, 'Inline_Lake_gage.out',  sep='/'), header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
inline_rel   <- read.table(paste(pth, 'sagehen_sfrseg18.out',  sep='/'), header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
offline_rel  <- read.table(paste(pth, 'sagehen_sfrseg19.out',  sep='/'), header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
offline_stor <- read.table(paste(pth, 'Offline_Lake_gage.out', sep='/'), header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
minInstrmQ   <- read.table(paste(pth, 'sagehen_sfrseg16.out',  sep='/'), header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
muniDemand   <- read.table(paste(pth, 'sagehen_sfrseg22.out',  sep='/'), header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
seg20        <- read.table(paste(pth, 'sagehen_sfrseg20.out',  sep='/'), header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
seg23        <- read.table(paste(pth, 'sagehen_sfrseg23.out',  sep='/'), header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
seg5         <- read.table(paste(pth, 'sagehen_sfrseg5.out',   sep='/'), header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))

date_seq <- seq(as.Date('1980-10-01'), as.Date('1996-10-01'), by='day')

plot(as.Date(minInstrmQ$Date), minInstrmQ$MidptFlow, las=1, xlim=c(minInstrmQ$Date[1], minInstrmQ$Date[100]), ylim=c(0, 20000), typ='l')
plot(seg5$Time, seg5$MidptFlow, las=1, xlim=c(seg5$Time[1], seg5$Time[100]), ylim=c(0, 20000), typ='l')
plot(offline_rel$Time, offline_rel$MidptFlow, las=1, xlim=c(offline_rel$Time[1], offline_rel$Time[100]), ylim=c(0, 20000), typ='l')
plot(inline_rel$Time, inline_rel$MidptFlow, las=1, xlim=c(inline_rel$Time[1], inline_rel$Time[100]), ylim=c(0, 20000), typ='l')


par(mar=c(5,6,1,1))
plot(seg5$Time, seg5$MidptFlow, las=1, xlim=c(seg5$Time[1], seg5$Time[100]), ylim=c(0, 20000), typ='l', xlab='', ylab='', xaxs='i', yaxs='i')
mtext(side=1, "Time Step", line=3)
mtext(side=2, expression(paste("Q (",m^3,"/day)",sep='')), line=4)



par(mar=c(5,4,1,1))
plot(inline_stor$Time[-1], inline_stor$Volume[-1] * 35.315 / 43560, las=1, xlim=c(0, 61), ylim=c(0, 60), typ='l', xlab='', ylab='', xaxs='i', yaxs='i')
abline(v=seq(0,1000,by=5), col='grey')
axis(side=1, at=seq(0,1000,by=1), labels=NA)
dpool <- 0.2429382426E+05 # m^3
abline(h=dpool * 35.315 / 43560, lwd=2, lty=2, col='red')
mtext(side=1, "Time Step", line=3)
mtext(side=2, expression(paste("Inline Reservoir Storage ( ",ac%.%ft,")",sep='')), line=2.5)
legend("top", c('Storage', "Deadpool Volume"), lty=c(1,2), lwd=c(1,2), col=c('black','red'), bty='o', box.col='white', bg='white')
box()

par(mar=c(5,6,1,1))
plot(inline_rel$Time[-1], inline_rel$MidptFlow[-1], las=1, xlim=c(0, 21), ylim=c(0, 20000), typ='l', xlab='', ylab='', xaxs='i', yaxs='i', lwd=2)
abline(h=15000, col='grey', lty=2)
abline(v=seq(0,1000,by=5), col='grey')
mtext(side=1, "Time Step", line=3)
mtext(side=2, expression(paste("Q (",m^3,"/day)",sep='')), line=4)
axis(side=1, at=seq(0,1000,by=1), labels=NA) 
points(seg20$Time, seg20$MidptFlow, col='red', typ='l')
points(muniDemand$Time, muniDemand$MidptFlow, col='blue', typ='l')
points(seg23$Time, seg23$MidptFlow, col='purple', typ='l', lty=2, lwd=2)
points(minInstrmQ$Time, minInstrmQ$MidptFlow, col='limegreen', typ='l', lty=3, lwd=2)
legend("topleft", c('Inline Res Release', "Div. to Offline Res.", "Municipal Div.", "Mainstem abv confluence with Offline Res inflow", "Minimum Instream Flow Req."), 
       lty=c(1,1,1,2,3), lwd=c(2,1,1,2,2), col=c('black','red','blue','purple','limegreen'), bty='o', box.col='white', bg='white')
box()

