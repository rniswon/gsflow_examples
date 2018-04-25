inline_stor  <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/Inline_Lake_gage.out', header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
offline_stor <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/Offline_Lake_gage.out', header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
minInstrmQ   <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg16.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
muniDemand   <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg22.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
seg20        <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg20.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))

date_seq <- seq(as.Date('1980-10-01'), as.Date('1996-10-01'), by='day')
date_seq_LAK <- seq(as.Date('1980-09-30'), as.Date('1996-10-01'), by='day')

# to be deleted, but use for now until model runs all the way through
inline_stor  <- cbind(date_seq_LAK, inline_stor)
offline_stor <- cbind(date_seq_LAK, offline_stor)
minInstrmQ   <- cbind(Date=date_seq, minInstrmQ)   # Need to subtract 1 because the lake uses time=0 whereas the stream gages don't
muniDemand   <- cbind(Date=date_seq, muniDemand)

in.poly.x  <- c(date_seq_LAK,            rev(date_seq_LAK))
in.poly.y  <- c(inline_stor$Volume,  rep(0, times=length(inline_stor$Volume)))
off.poly.x <- c(date_seq_LAK,            rev(date_seq_LAK))
off.poly.y <- c(offline_stor$Volume, rep(0, time=length(offline_stor$Volume)))

ylim=c(0, 1.05 * max(inline_stor$Volume))
png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/res_storage.png',height=600, width=1200, res=130)
    par(mar=c(4,4,3,6))
    plot(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', xlab='', xaxs='i', xaxt='n', ylab='', ylim=ylim, yaxt='n', yaxs='i', las=1)
    axis(side=1, at=seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='year'),labels=NA)
    axis(side=1, at=seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='2 year'),labels=format(seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='2 year'),'%Y'), las=2) 
    axis(side=2, at=seq(0,6e6,by=1e6), labels=seq(0,6,by=1), las=1)
    axis(side=4, at=seq(0,4000,by=1000) / 35.315 * 43560.17, labels=seq(0,4000,by=1000), las=1)
    text(x=as.Date(tail(date_seq,n=1)) + 560, y=ylim[2]/2, expression(paste('Storage, ',ac%.%ft,sep='')), srt=-90, xpd=TRUE)
    mtext(side=2,expression(paste('Storage, ',10^6,' ',m^3,sep='')), line=2.5)
    mtext(side=1,'Start of Water Year', line=3)
    polygon(x = in.poly.x, y=in.poly.y, col=rgb(1,0,0,0.25),border=NA, lwd=2)
    points(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', col='red', lwd=2)
    polygon(x = off.poly.x, y=off.poly.y, col=rgb(0,0,1,0.25),border=NA, lwd=2)
    points(as.Date(offline_stor$date_seq), offline_stor$Volume, typ='l', col='blue', lwd=2)
    legend(x = as.Date('1980-10-01'), y = 6.4e6, c('Inline Reservoir','Offline Reservoir'), pch=22, pt.bg=c(rgb(1,0,0,0.15,max=1),rgb(0,0,1,0.25,max=1)), col=c('red','blue'), pt.cex=1.5, bty='n',bg='white', xpd=TRUE)
dev.off()



offDem <- 4000
inDem  <- 12000

muniDemand$inSea <- as.numeric(format(as.Date(muniDemand$Date),"%m"))
muniDemand$is.in <- as.numeric(format(as.Date(muniDemand$Date),"%m")) %in% 4:9
muniDemand$Demand <- ifelse(muniDemand$is.in, inDem, offDem)

muniDemand$DemDelivDiff <- muniDemand$MidptFlow - muniDemand$Demand


png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/res_storage_&_shortages.png',height=1000, width=1200, res=130)
    
    par(mar=c(0.5,7,3,6), mfrow=c(3,1))
    plot(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', xlab='', xaxs='i', xaxt='n', ylab='', ylim=ylim, yaxt='n', yaxs='i', las=1)
    axis(side=2, at=seq(0,6e6,by=1e6), labels=seq(0,6,by=1), las=1)
    axis(side=4, at=seq(0,4000,by=1000) / 35.315 * 43560.17, labels=seq(0,4000,by=1000), las=1)
    text(x=as.Date(tail(date_seq,n=1)) + 400, y=ylim[2]/2, expression(paste('Storage, ',ac%.%ft,sep='')), srt=-90, xpd=TRUE)
    mtext(side=2,expression(paste('Storage, ',10^6,' ',m^3,sep='')), line=2.5,cex=0.8)
    polygon(x = in.poly.x, y=in.poly.y, col=rgb(1,0,0,0.25),border=NA, lwd=2)
    points(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', col='red', lwd=2)
    polygon(x = off.poly.x, y=off.poly.y, col=rgb(0,0,1,0.25),border=NA, lwd=2)
    points(as.Date(offline_stor$date_seq), offline_stor$Volume, typ='l', col='blue', lwd=2)
    legend(x = as.Date('1980-10-01'), y = 6.4e6, c('Inline Reservoir','Offline Reservoir'), pch=22, pt.bg=c(rgb(1,0,0,0.15,max=1),rgb(0,0,1,0.25,max=1)), col=c('red','blue'), pt.cex=1.5, bty='n',bg='white', xpd=TRUE)
    
    par(mar=c(0.5,7,0.5,6))
    plot(as.Date(muniDemand$Date), muniDemand$DemDelivDiff, col=rgb(1,0,0,0.25), typ='h', lend=1, las=1, ylim=c(-12200,0), yaxs='i', xaxs='i',xaxt='n', yaxt='n',xlab='',ylab='')
    mtext(side=2,expression(paste('Municipal Supply Shortages, ',m^3~ d^-1,sep='')), line=4,cex=0.8)
    axis(side=2, at=seq(-12000,0,by=2000), labels=c('12,000','10,000','8,000','6,000','4,000','2,000','0'), las=1)
    
    par(mar=c(4.5,7,0.5,6))
    plot(as.Date(minInstrmQ$Date), minInstrmQ$MidptFlow, typ='l', xlab='', xaxs='i', xaxt='n', ylab='', yaxs='i', log='y', las=1,ylim=c(2000,6e5))
    axis(side=1, at=seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='year'), labels=NA)
    axis(side=1, at=seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='2 year'), labels=format(seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='2 year'),'%Y'), las=2) 
    mtext(side=2,expression(paste('Flow at Minimum Instream \nFlow Requirement,',m^3~ d^-1,sep='')), line=4, cex=0.8)
    mtext(side=1,'Start of Water Year', line=3, cex=0.8)
    
dev.off()



plot(as.Date(minInstrmQ$Date), minInstrmQ$MidptFlow, typ='l', xlab='', xaxs='i', ylab='', yaxs='i', log='y', las=1, ylim=c(2000,6e5))

# Generate a time series of the temporally varying demand

plot(as.Date(muniDemand$Date), muniDemand$DemDelivDiff, typ='h', lend=1, las=1)

trueDem <- data.frame(Date=date_seq, )
plot(as.Date(muniDemand$Date), muniDemand$MidptFlow, typ='l', xlab='', xaxs='i', ylab='', yaxs='i', las=1)

