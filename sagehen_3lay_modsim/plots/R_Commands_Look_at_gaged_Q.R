inline_stor  <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/Inline_Lake_gage.out', header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
offline_stor <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/Offline_Lake_gage.out', header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
seg20        <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg20.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))

date_seq <- seq(as.Date('1980-10-01'), as.Date('1996-09-30'), by='day')

# to be deleted, but use for now until model runs all the way through
date_seq <- date_seq[1:2904]
inline_stor <- cbind(date_seq, inline_stor)
offline_stor <- cbind(date_seq, offline_stor)

in.poly.x  <- c(date_seq,            rev(date_seq))
in.poly.y  <- c(inline_stor$Volume,  rep(0, times=length(inline_stor$Volume)))
off.poly.x <- c(date_seq,            rev(date_seq))
off.poly.y <- c(offline_stor$Volume, rep(0, time=length(offline_stor$Volume)))

ylim=c(0, 1.05 * max(inline_stor$Volume))
tiff('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/res_storage.tif',height=800, width=1000, res=130)
    par(mar=c(2,4,3,6))
    plot(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', xlab='', ylab='', ylim=ylim, yaxt='n', yaxs='i', las=1)
    axis(side=2, at=seq(0,6e6,by=1e6), labels=seq(0,6,by=1), las=1)
    axis(side=4, at=seq(0,4000,by=1000) / 35.315 * 43560.17, labels=seq(0,4000,by=1000), las=1)
    text(x=as.Date(tail(date_seq,n=1)) + 520, y=ylim[2]/2, expression(paste('Storage, ',ac%.%ft,sep='')), srt=-90, xpd=TRUE)
    mtext(side=2,expression(paste('Storage, ',10^6,' ',m^3,sep='')), line=2.5)
    polygon(x = in.poly.x, y=in.poly.y, col=rgb(1,0,0,0.25),border=NA, lwd=2)
    points(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', col='red', lwd=2)
    polygon(x = off.poly.x, y=off.poly.y, col=rgb(0,0,1,0.25),border=NA, lwd=2)
    points(as.Date(offline_stor$date_seq), offline_stor$Volume, typ='l', col='blue', lwd=2)
    legend(x = as.Date('1980-10-01'), y = 6.15e6, c('Inline Reservoir','Offline Reservoir'), pch=22, pt.bg=c(rgb(1,0,0,0.15,max=1),rgb(0,0,1,0.25,max=1)), col=c('red','blue'), pt.cex=1.5, bty='n',bg='white', xpd=TRUE)
dev.off()
