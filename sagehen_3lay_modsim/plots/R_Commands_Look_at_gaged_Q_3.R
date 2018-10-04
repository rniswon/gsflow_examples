inline_stor  <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_investigate/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/Inline_Lake_gage.out', header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
inline_rel   <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_investigate/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg18.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
offline_stor <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_investigate/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/Offline_Lake_gage.out', header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
minInstrmQ   <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_investigate/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg16.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
muniDemand   <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_investigate/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg22.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
seg20        <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_investigate/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg20.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))

inline_stor_pump  <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_pumping/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/Inline_Lake_gage.out', header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
inline_rel_pump   <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_pumping/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg18.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
offline_stor_pump <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_pumping/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/Offline_Lake_gage.out', header=FALSE, skip=2, col.names=c('Time', 'Stage(H)', 'Volume', 'Precip.', 'Evap', 'LAK-Runoff', 'UZFRunoff', 'GWInflw', 'GWOutflw', 'LAKtoUZF', 'SWInflw', 'SWOutflw', 'Withdrawal', 'LakeInflx', 'TotalCond', 'DelHTS', 'DelVTS', 'Del-H-Cum', 'DelVCum', 'CumPrcntErr'))
minInstrmQ_pump   <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_pumping/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg16.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
muniDemand_pump   <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_pumping/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg22.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))
seg20_pump        <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_pumping/gsflow_examples.git/sagehen_3lay_modsim/output/modflow/sagehen_sfrseg20.out', header=FALSE, skip=2, col.names=c('Time', 'Stage', 'Depth', 'GWHead', 'MidptFlow', 'StreamLoss', 'GWRech', 'ChngeUZStor', 'VolUZStor'))


date_seq <- seq(as.Date('1980-10-01'), as.Date('1996-10-01'), by='day')
date_seq_LAK <- seq(as.Date('1980-09-30'), as.Date('1996-10-01'), by='day')

# to be deleted, but use for now until model runs all the way through
inline_stor  <- cbind(date_seq_LAK, inline_stor)
offline_stor <- cbind(date_seq_LAK, offline_stor)
inline_rel   <- cbind(Date=date_seq, inline_rel)
minInstrmQ   <- cbind(Date=date_seq, minInstrmQ)   # Need to subtract 1 because the lake uses time=0 whereas the stream gages don't
muniDemand   <- cbind(Date=date_seq, muniDemand)

inline_stor_pump  <- cbind(date_seq_LAK, inline_stor_pump)
offline_stor_pump <- cbind(date_seq_LAK, offline_stor_pump)
inline_rel_pump   <- cbind(Date=date_seq, inline_rel_pump)
minInstrmQ_pump   <- cbind(Date=date_seq, minInstrmQ_pump)   # Need to subtract 1 because the lake uses time=0 whereas the stream gages don't
muniDemand_pump   <- cbind(Date=date_seq, muniDemand_pump)


in.poly.x  <- c(date_seq_LAK,       rev(date_seq_LAK))
in.poly.y  <- c(inline_stor$Volume, rep(0, times=length(inline_stor$Volume)))
off.poly.x <- c(date_seq_LAK,       rev(date_seq_LAK))
off.poly.y <- c(offline_stor$Volume,rep(0, time=length(offline_stor$Volume)))

in.poly.x_pump  <- c(date_seq_LAK,       rev(date_seq_LAK))
in.poly.y_pump  <- c(inline_stor_pump$Volume, rep(0, times=length(inline_stor_pump$Volume)))
off.poly.x_pump <- c(date_seq_LAK,       rev(date_seq_LAK))
off.poly.y_pump <- c(offline_stor_pump$Volume,rep(0, time=length(offline_stor_pump$Volume)))

inline_stor_diff  <- inline_stor_pump$Volume - inline_stor$Volume
offline_stor_diff <- offline_stor_pump$Volume - offline_stor$Volume

in.poly.diff.x  <- c(date_seq_LAK,      rev(date_seq_LAK))
in.poly.diff.y  <- c(inline_stor_diff,  rep(0, times=length(inline_stor_diff)))
off.poly.diff.x <- c(date_seq_LAK,      rev(date_seq_LAK))
off.poly.diff.y <- c(offline_stor_diff, rep(0, times=length(offline_stor_diff)))

ylim=c(0, 1.05 * max(inline_stor$Volume))
png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/res_storage_with_ET.png',height=600, width=1200, res=130)
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
    box()
dev.off()


# This bit of code for the normal run (no pumping)
offDem <- 4000
inDem  <- 12000

muniDemand$inSea <- as.numeric(format(as.Date(muniDemand$Date),"%m"))
muniDemand$is.in <- as.numeric(format(as.Date(muniDemand$Date),"%m")) %in% 4:9
muniDemand$Demand <- ifelse(muniDemand$is.in, inDem, offDem)

muniDemand$DemDelivDiff <- muniDemand$MidptFlow - muniDemand$Demand

minInstrmQ.plot <- minInstrmQ
minInstrmQ.plot$consecHigh <- ifelse(minInstrmQ.plot$MidptFlow > 15000, 1, 0)
minInstrmQ.plot$consecLow  <- ifelse(minInstrmQ.plot$MidptFlow < 15000, 1, 0)
minInstrmQ.plot[1,'consecLow'] <- 0
minInstrmQ.plot$abv <- c(0, diff(minInstrmQ.plot$consecHigh))
minInstrmQ.plot$blw <- c(0, diff(minInstrmQ.plot$consecLow))
minInstrmQ.plot$abv <- ifelse(minInstrmQ.plot$abv < 0, 0, minInstrmQ.plot$abv)
minInstrmQ.plot$blw <- ifelse(minInstrmQ.plot$blw < 0, 0, minInstrmQ.plot$blw)
runs_Hi <- data.frame(len=rle(minInstrmQ.plot$consecHigh)$lengths,
                      val=rle(minInstrmQ.plot$consecHigh)$values,
                      acc=cumsum(rle(minInstrmQ.plot$consecHigh)$lengths))

runs_Lo <- data.frame(len=rle(minInstrmQ.plot$consecLow)$lengths,
                      val=rle(minInstrmQ.plot$consecLow)$values,
                      acc=cumsum(rle(minInstrmQ.plot$consecLow)$lengths))

num_poly_Hi <- sum(runs_Hi$val)
num_poly_Lo <- sum(runs_Lo$val)

ylim=c(0, 1.5 * max(inline_stor$Volume))

# -------------------------------------------------
# This bit of code for the normal run (no pumping)
# -------------------------------------------------

muniDemand_pump$inSea <- as.numeric(format(as.Date(muniDemand_pump$Date),"%m"))
muniDemand_pump$is.in <- as.numeric(format(as.Date(muniDemand_pump$Date),"%m")) %in% 4:9
muniDemand_pump$Demand <- ifelse(muniDemand_pump$is.in, inDem, offDem)

muniDemand_pump$DemDelivDiff <- muniDemand_pump$MidptFlow - muniDemand_pump$Demand

minInstrmQ.plot_pump <- minInstrmQ_pump
minInstrmQ.plot_pump$consecHigh <- ifelse(minInstrmQ.plot_pump$MidptFlow > 15000, 1, 0)
minInstrmQ.plot_pump$consecLow  <- ifelse(minInstrmQ.plot_pump$MidptFlow < 15000, 1, 0)
minInstrmQ.plot_pump[1,'consecLow'] <- 0
minInstrmQ.plot_pump$abv <- c(0, diff(minInstrmQ.plot_pump$consecHigh))
minInstrmQ.plot_pump$blw <- c(0, diff(minInstrmQ.plot_pump$consecLow))
minInstrmQ.plot_pump$abv <- ifelse(minInstrmQ.plot_pump$abv < 0, 0, minInstrmQ.plot_pump$abv)
minInstrmQ.plot_pump$blw <- ifelse(minInstrmQ.plot_pump$blw < 0, 0, minInstrmQ.plot_pump$blw)
runs_Hi_pump <- data.frame(len=rle(minInstrmQ.plot_pump$consecHigh)$lengths,
                           val=rle(minInstrmQ.plot_pump$consecHigh)$values,
                           acc=cumsum(rle(minInstrmQ.plot_pump$consecHigh)$lengths))

runs_Lo_pump <- data.frame(len=rle(minInstrmQ.plot_pump$consecLow)$lengths,
                           val=rle(minInstrmQ.plot_pump$consecLow)$values,
                           acc=cumsum(rle(minInstrmQ.plot_pump$consecLow)$lengths))

num_poly_Hi_pump <- sum(runs_Hi_pump$val)
num_poly_Lo_pump <- sum(runs_Lo_pump$val)

ylim=c(0, 1.5 * max(inline_stor_pump$Volume))

# The next plot is for a normal operations/hydrology run, no pumping involved
png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/res_storage_&_shortages_2_with_ET.png',height=1000, width=1200, res=130)
    layout(matrix(c(1,2), 2, 1, byrow = TRUE), c(8.25,8.25), c(4,2), TRUE)
    # layout.show(nf)
    par(mar=c(0.5,7,3,5))
    plot(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', xlab='', xaxs='i', xaxt='n', ylab='', ylim=ylim, yaxt='n', yaxs='i', las=1)
    axis(side=2, at=seq(0,5e6,by=1e6), labels=seq(0,5,by=1), las=1)
    axis(side=4, at=seq(0,4000,by=1000) / 35.315 * 43560.17, labels=seq(0,4000,by=1000), las=1)
    text(x=as.Date(tail(date_seq,n=1)) + 700, y=ylim[2]/3, expression(paste('Storage, ',ac%.%ft,sep='')), srt=-90, xpd=TRUE)
    mtext(side=2,expression(paste('Storage, ',10^6,' ',m^3,sep='')), adj=0.35, line=2.5)
    polygon(x = in.poly.x, y=in.poly.y, col=rgb(1,0,0,0.25),border=NA, lwd=2)
    points(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', col='red', lwd=2)
    polygon(x = off.poly.x, y=off.poly.y, col=rgb(0,0,1,0.25),border=NA, lwd=2)
    points(as.Date(offline_stor$date_seq), offline_stor$Volume, typ='l', col='blue', lwd=2)
    legend(x = as.Date('1980-10-01'), y = ylim[2] + 1.5e6, c('Inline Reservoir','Offline Reservoir','Municipal Delivery Shortage'), pch=22, pt.bg=c(rgb(1,0,0,0.15,max=1),rgb(0,0,1,0.25,max=1), 'red'), col=c('red','blue','red'), pt.cex=1.5, bty='n',bg='white', xpd=TRUE)
    
    #par(mar=c(0.5,7,0.5,6))
    par(new=TRUE)
    plot(as.Date(muniDemand$Date), muniDemand$DemDelivDiff, col=rgb(1,0,0,0.25), typ='h', lend=1, las=1, ylim=c(-40000,0), yaxs='i', xaxs='i',xaxt='n', yaxt='n',xlab='',ylab='')
    mtext(side=2,expression(paste('Municipal Supply \nShortages, ',m^3~ d^-1,sep='')), adj=0.5, line=4)
    axis(side=2, at=seq(-12000,0,by=4000), labels=c('-12,000', '-8,000', '-4,000', '0'), las=1)
    
    par(mar=c(4.5,7,0.5,5))
    plot(as.Date(minInstrmQ$Date), minInstrmQ$MidptFlow, typ='l', xlab='', xaxs='i', xaxt='n', yaxt='n', ylab='', yaxs='i', log='y', las=1,ylim=c(2000,6e5))
     
    for(i in seq(1:num_poly_Hi)){
      strt <- runs_Hi[(i*2 - 1),'acc']
      end  <- runs_Hi[(i*2),'acc']
      poly.x <- c(minInstrmQ.plot[strt,'Date'], minInstrmQ.plot[(strt:end),'Date'], minInstrmQ.plot[end, 'Date'])
      poly.y <- c(15000, minInstrmQ.plot[(strt:end),'MidptFlow'], 15000)
      polygon(poly.x, poly.y, border=NA, col=rgb(0,1,0,0.15,max=1))
    }
    for(i in seq(1:num_poly_Lo)){
      strt <- runs_Lo[(i*2 - 1),'acc']
      end  <- runs_Lo[(i*2),'acc']
      poly.x <- c(minInstrmQ.plot[strt,'Date'], minInstrmQ.plot[(strt:end),'Date'], minInstrmQ.plot[end, 'Date'])
      poly.y <- c(15000, minInstrmQ.plot[(strt:end),'MidptFlow'], 15000)
      polygon(poly.x, poly.y, border=NA, col=rgb(1,0,0,0.15,max=1))
    }
    
    axis(side=1, at=seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='year'), labels=NA)
    axis(side=1, at=seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='2 year'), labels=format(seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='2 year'),'%Y'), las=2)
    axis(side=2, at=c(2000,5000,15000,50000,200000,500000), labels=c('2,000','5,000','15,000','50,000','200,000','500,000'), las=1)
    axis(side=4, at=c(2446.5,4893.1,14997.4,48931.0,122327.6,489310.5), labels=c(1,2,6.13,20,50,200), las=1)
    mtext(side=2,expression(paste('Flow at Minimum Instream \nFlow Requirement,',m^3~ d^-1,sep='')), line=4)
    text(x=as.Date(tail(date_seq,n=1)) + 700, y=6e5/2, expression(paste('Flow at Minimum Instream \nFlow Requirement,',ft^3~ sec^-1,sep='')), srt=-90, xpd=TRUE)
    mtext(side=1,'Start of Water Year', line=3)
    
dev.off()


# The next plot is for the pumping scenario
png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/res_storage_&_shortages_2_with_ET_pump.png', height=1000, width=1200, res=130)
    layout(matrix(c(1,2), 2, 1, byrow = TRUE), c(8.25,8.25), c(4,2), TRUE)
    # layout.show(nf)
    par(mar=c(0.5,7,3,5))
    plot(as.Date(inline_stor_pump$date_seq), inline_stor_pump$Volume, typ='l', xlab='', xaxs='i', xaxt='n', ylab='', ylim=ylim, yaxt='n', yaxs='i', las=1)
    axis(side=2, at=seq(0,5e6,by=1e6), labels=seq(0,5,by=1), las=1)
    axis(side=4, at=seq(0,4000,by=1000) / 35.315 * 43560.17, labels=seq(0,4000,by=1000), las=1)
    text(x=as.Date(tail(date_seq,n=1)) + 700, y=ylim[2]/3, expression(paste('Storage, ',ac%.%ft,sep='')), srt=-90, xpd=TRUE)
    mtext(side=2,expression(paste('Storage, ',10^6,' ',m^3,sep='')), adj=0.35, line=2.5)
    polygon(x = in.poly.x_pump, y=in.poly.y_pump, col=rgb(1,0,0,0.25),border=NA, lwd=2)
    points(as.Date(inline_stor_pump$date_seq), inline_stor_pump$Volume, typ='l', col='red', lwd=2)
    polygon(x = off.poly.x_pump, y=off.poly.y_pump, col=rgb(0,0,1,0.25),border=NA, lwd=2)
    points(as.Date(offline_stor_pump$date_seq), offline_stor_pump$Volume, typ='l', col='blue', lwd=2)
    legend(x = as.Date('1980-10-01'), y = ylim[2] + 1.5e6, c('Inline Reservoir','Offline Reservoir','Municipal Delivery Shortage'), pch=22, pt.bg=c(rgb(1,0,0,0.15,max=1),rgb(0,0,1,0.25,max=1), 'red'), col=c('red','blue','red'), pt.cex=1.5, bty='n',bg='white', xpd=TRUE)
    
    #par(mar=c(0.5,7,0.5,6))
    par(new=TRUE)
    plot(as.Date(muniDemand_pump$Date), muniDemand_pump$DemDelivDiff, col=rgb(1,0,0,0.25), typ='h', lend=1, las=1, ylim=c(-40000,0), yaxs='i', xaxs='i',xaxt='n', yaxt='n',xlab='',ylab='')
    mtext(side=2,expression(paste('Municipal Supply \nShortages, ',m^3~ d^-1,sep='')), adj=0.5, line=4)
    axis(side=2, at=seq(-12000,0,by=4000), labels=c('-12,000', '-8,000', '-4,000', '0'), las=1)
    
    par(mar=c(4.5,7,0.5,5))
    plot(as.Date(minInstrmQ_pump$Date), minInstrmQ_pump$MidptFlow, typ='l', xlab='', xaxs='i', xaxt='n', yaxt='n', ylab='', yaxs='i', log='y', las=1,ylim=c(2000,6e5))
     
    for(i in seq(1:num_poly_Hi_pump)){
      strt <- runs_Hi_pump[(i*2 - 1),'acc']
      end  <- runs_Hi_pump[(i*2),'acc']
      poly.x_pump <- c(minInstrmQ.plot_pump[strt,'Date'], minInstrmQ.plot_pump[(strt:end),'Date'], minInstrmQ.plot_pump[end, 'Date'])
      poly.y_pump <- c(15000, minInstrmQ.plot_pump[(strt:end),'MidptFlow'], 15000)
      polygon(poly.x_pump, poly.y_pump, border=NA, col=rgb(0,1,0,0.15,max=1))
    }
    for(i in seq(1:num_poly_Lo_pump)){
      strt <- runs_Lo_pump[(i*2 - 1),'acc']
      end  <- runs_Lo_pump[(i*2),'acc']
      poly.x_pump <- c(minInstrmQ.plot_pump[strt,'Date'], minInstrmQ.plot_pump[(strt:end),'Date'], minInstrmQ.plot_pump[end, 'Date'])
      poly.y_pump <- c(15000, minInstrmQ.plot_pump[(strt:end),'MidptFlow'], 15000)
      polygon(poly.x_pump, poly.y_pump, border=NA, col=rgb(1,0,0,0.15,max=1))
    }
    
    axis(side=1, at=seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='year'), labels=NA)
    axis(side=1, at=seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='2 year'), labels=format(seq(as.Date('1980-10-01'), as.Date('1996-10-01'),by='2 year'),'%Y'), las=2)
    axis(side=2, at=c(2000,5000,15000,50000,200000,500000), labels=c('2,000','5,000','15,000','50,000','200,000','500,000'), las=1)
    axis(side=4, at=c(2446.5,4893.1,14997.4,48931.0,122327.6,489310.5), labels=c(1,2,6.13,20,50,200), las=1)
    mtext(side=2,expression(paste('Flow at Minimum Instream \nFlow Requirement,',m^3~ d^-1,sep='')), line=4)
    text(x=as.Date(tail(date_seq,n=1)) + 700, y=6e5/2, expression(paste('Flow at Minimum Instream \nFlow Requirement,',ft^3~ sec^-1,sep='')), srt=-90, xpd=TRUE)
    mtext(side=1,'Start of Water Year', line=3)
    
dev.off()


png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/res_storage_pump-nopump_differences.png', height=1000, width=1200, res=130)
    ylim = c(mround(min(c(inline_stor_diff, offline_stor_diff)), 10000) - 10000, 0)
    par(mar=c(1,6,4,6))
    plot(as.Date(inline_stor_pump$date_seq), inline_stor_diff, typ='l', xlab='', xaxs='i', xaxt='n', ylab='', ylim=ylim, yaxt='n', yaxs='i', las=1)
    axis(side=3, at=seq(as.Date('1980-10-01'), as.Date('1996-10-01'), by='year'), labels=seq(1980, 1996, by=1), las=2)
    axis(side=2, at=seq(-1.1e6, 0, by = 1e5), labels=seq(-1.1, 0, by = 0.1), las=1)
    axis(side=4, at=seq(-4000, 0, by=100) / 35.315 * 43560.17, labels=seq(-4000, 0, by=100), las=1)
    text(x=as.Date(tail(date_seq,n=1)) + 700, y=ylim[1]/2, expression(paste('Storage Deficit with Pumping, ',ac%.%ft,sep='')), srt=-90, xpd=TRUE)
    mtext(side=2,expression(paste('Storage Deficit with Pumping, ',10^6,' ',m^3,sep='')), adj=0.5, line=3)
    polygon(x = in.poly.diff.x, y=in.poly.diff.y, col=rgb(1,0,0,0.25),border=NA, lwd=2)
    points(as.Date(inline_stor_pump$date_seq), inline_stor_diff, typ='l', col='red', lwd=2)
    polygon(x = off.poly.diff.x, y=off.poly.diff.y, col=rgb(0,0,1,0.25),border=NA, lwd=2)
    points(as.Date(offline_stor_pump$date_seq), offline_stor_diff, typ='l', col='blue', lwd=2)
    legend("bottomleft", c('Inline Reservoir','Offline Reservoir'), pch=22, pt.bg=c(rgb(1,0,0,0.15,max=1),rgb(0,0,1,0.25,max=1)), col=c('red','blue'), pt.cex=1.5, bty='n',bg='white', xpd=TRUE)
    box()
dev.off()

minInstrmQ$wyr <- as.numeric(format(minInstrmQ$Date, "%Y"))
is.nxt <- as.numeric(format(minInstrmQ$Date, "%m")) %in% 1:9
minInstrmQ$wyr[!is.nxt] <- minInstrmQ$wyr[!is.nxt] + 1

muniDemand$wyr <- as.numeric(format(muniDemand$Date, "%Y"))
is.nxt <- as.numeric(format(muniDemand$Date, "%m")) %in% 1:9
muniDemand$wyr[!is.nxt] <- muniDemand$wyr[!is.nxt] + 1

minInstrmQ_pump$wyr <- as.numeric(format(minInstrmQ_pump$Date, "%Y"))
is.nxt <- as.numeric(format(minInstrmQ_pump$Date, "%m")) %in% 1:9
minInstrmQ_pump$wyr[!is.nxt] <- minInstrmQ_pump$wyr[!is.nxt] + 1

muniDemand_pump$wyr <- as.numeric(format(muniDemand_pump$Date, "%Y"))
is.nxt <- as.numeric(format(muniDemand_pump$Date, "%m")) %in% 1:9
muniDemand_pump$wyr[!is.nxt] <- muniDemand_pump$wyr[!is.nxt] + 1

minInstrmQ$violation <- ifelse(minInstrmQ$MidptFlow < 15000, 1, 0)
minInstrmQ_pump$violation <- ifelse(minInstrmQ_pump$MidptFlow < 15000, 1, 0)
minInstrmQ$yr_mon <- format(as.Date(minInstrmQ$Date), "%y_%m")
minInstrmQ_pump$yr_mon <- format(as.Date(minInstrmQ_pump$Date), "%y_%m")
minInstrmQ$yr <- format(as.Date(minInstrmQ$Date), "%y")
minInstrmQ_pump$yr <- format(as.Date(minInstrmQ_pump$Date), "%y")

mat_yrmon <- matrix(c(aggregate(minInstrmQ$violation ~ minInstrmQ$yr_mon, data=minInstrmQ, "sum")[,'minInstrmQ$violation'], aggregate(minInstrmQ_pump$violation ~ minInstrmQ_pump$yr_mon, data=minInstrmQ_pump, "sum")[,'minInstrmQ_pump$violation']),
                    byrow = TRUE, nrow = 2, ncol = length(aggregate(minInstrmQ$violation ~ minInstrmQ$yr_mon, data=minInstrmQ, "sum")[,'minInstrmQ$violation']),
                    dimnames = list(c('No Pumping','With Pumping'),
                                   c(format(seq(as.Date('1980-10-01'), as.Date('1996-10-01'), by='month'), "%b %y"))))

mat_yr <- matrix(c(aggregate(minInstrmQ$violation ~ minInstrmQ$wyr, data=minInstrmQ, "sum")[,'minInstrmQ$violation'], aggregate(minInstrmQ_pump$violation ~ minInstrmQ_pump$wyr, data=minInstrmQ_pump, "sum")[,'minInstrmQ_pump$violation']),
                 byrow = TRUE, nrow = 2, ncol = length(aggregate(minInstrmQ$violation ~ minInstrmQ$wyr, data=minInstrmQ, "sum")[,'minInstrmQ$violation']),
                 dimnames = list(c('No Pumping','With Pumping'),
                                c(format(seq(as.Date('1981-10-01'), as.Date('1997-10-01'), by='year'), "%Y"))))

png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/violation_days.png', height=1000, width=1200, res=130)
    par(mar=c(4,4,1,1))
    x <- barplot(mat_yr, beside=TRUE, las=1, col=c('grey85','grey40'), ylim=c(0,400), xaxt='n', yaxt='n')
    axis(side=1, at=seq(2,47,by=3), labels=seq(1981,1996,by=1), las=2)
    axis(side=2, at=seq(0,400,by=50), labels=seq(0,400,by=50), las=1)
    mtext(side=2, 'Minimum Instream Flow Requirement Violations, Days', line=3)
    abline(h=0)
    legend("topleft", c('No Pumping','With Pumping'), pch=22, pt.bg=c('grey85','grey40'), col='black', pt.cex=1.5, bty='n',bg='white', xpd=TRUE)
dev.off()

# Now work up magnitude of demand delivery shortfall
Total_owed <- data.frame(Date = seq(as.Date('1981-10-01'), as.Date('1982-09-30'), by='day'), owed = c(rep(4000, times=sum(31,30,31,31,28,31)), rep(12000, times=sum(30,31,30,31,31,30))))
Total_owed_sum <- sum(Total_owed$owed)
demand_short <- matrix(c(aggregate(muniDemand$MidptFlow ~ muniDemand$wyr, data=muniDemand, "sum")[,'muniDemand$MidptFlow'], aggregate(muniDemand_pump$MidptFlow ~ muniDemand_pump$wyr, data=muniDemand_pump, "sum")[,'muniDemand_pump$MidptFlow']),
                       byrow = TRUE, nrow = 2, ncol = length(aggregate(muniDemand$MidptFlow ~ muniDemand$wyr, data=muniDemand, "sum")[,'muniDemand$MidptFlow']),
                       dimnames = list(c('No Pumping','With Pumping'),
                                      c(format(seq(as.Date('1981-10-01'), as.Date('1997-10-01'), by='year'), "%Y"))))

demand_short_pct <- demand_short / Total_owed_sum
demand_short_pct <- ifelse(demand_short_pct > 1, 1, demand_short_pct)
demand_short_pct <- demand_short_pct[1:dim(demand_short_pct)[1], 1:dim(demand_short_pct)[2] - 1]

pump_amt <- read.table('C:/temp/MS-GSF_troubleshoot/gsflow.git_pumping/gsflow_examples.git/sagehen_3lay_modsim/plots/Actual_Pumping_Vol.txt', col.names=c('Date','Pump_Amt'))
pump_amt$Date <- date_seq

pump_amt$wyr <- as.numeric(format(pump_amt$Date, "%Y"))
is.nxt <- as.numeric(format(pump_amt$Date, "%m")) %in% 1:9
pump_amt$wyr[!is.nxt] <- pump_amt$wyr[!is.nxt] + 1

demand_w_Pump <- matrix(c(aggregate(muniDemand$MidptFlow ~ muniDemand$wyr, data=muniDemand, "sum")[,'muniDemand$MidptFlow'], aggregate(muniDemand_pump$MidptFlow ~ muniDemand_pump$wyr, data=muniDemand_pump, "sum")[,'muniDemand_pump$MidptFlow'] + aggregate(pump_amt$Pump_Amt ~ pump_amt$wyr, data=pump_amt, "sum")[,'pump_amt$Pump_Amt']),
                        byrow = TRUE, nrow = 2, ncol = length(aggregate(muniDemand$MidptFlow ~ muniDemand$wyr, data=muniDemand, "sum")[,'muniDemand$MidptFlow']),
                        dimnames = list(c('No Pumping','With Pumping'),
                                       c(format(seq(as.Date('1981-10-01'), as.Date('1997-10-01'), by='year'), "%Y"))))
demand_w_Pump_pct <- demand_w_Pump / Total_owed_sum
demand_w_Pump_pct <- ifelse(demand_w_Pump_pct > 1, 1, demand_w_Pump_pct)
demand_w_Pump_pct <- demand_w_Pump_pct[1:dim(demand_w_Pump_pct)[1], 1:dim(demand_w_Pump_pct)[2] - 1]

png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/MuniDelivery_shortfall.png', height=1000, width=1200, res=130)
    par(mar=c(4,4,1,1))
    x <- barplot(demand_w_Pump_pct, beside=TRUE, las=1, col=c('grey85','lightblue'), ylim=c(0,1), xaxt='n', yaxt='n')
    abline(h=seq(0,1,by=0.1), col='grey90')
    x <- barplot(demand_w_Pump_pct, beside=TRUE, las=1, col=c('grey85','lightblue'), ylim=c(0,1), xaxt='n', yaxt='n', add=TRUE)
    x <- barplot(demand_short_pct, beside=TRUE, las=1, col=c('grey85','grey40'), ylim=c(0,1), xaxt='n', yaxt='n', add=TRUE)
    axis(side=1, at=seq(2,47,by=3), labels=seq(1981,1996,by=1), las=2)
    axis(side=2, at=seq(0,1,by=0.1), labels=seq(0,100,by=10), las=1)
    mtext(side=2, 'Municipal Delivery, % of Duty Owed', line=3)
    abline(h=0)
    legend(x=25, y=1.0, c('SW Delivered, No Pumping','SW Delivered, With Pumping', 'Supplemental Pumped Water Delivered'), pch=22, pt.bg=c('grey85', 'grey40', 'lightblue'), col='black', pt.cex=1.5, bty='n',bg='white', xpd=TRUE, adj=0)
dev.off()


plot(as.Date(minInstrmQ$Date), minInstrmQ$MidptFlow, typ='l', xlab='', xaxs='i', ylab='', yaxs='i', log='y', las=1, ylim=c(2000,6e5))

# Generate a time series of the temporally varying demand

plot(as.Date(muniDemand$Date), muniDemand$DemDelivDiff, typ='h', lend=1, las=1)

trueDem <- data.frame(Date=date_seq, )
plot(as.Date(muniDemand$Date), muniDemand$MidptFlow, typ='l', xlab='', xaxs='i', ylab='', yaxs='i', las=1)

# With ET added into the simulation.  Exploring different flows to make sure priorities are being honored
# -------------------------------------------------------------------------------------------------------

# The following seems a little odd:

plot(as.Date(minInstrmQ$Date), minInstrmQ$MidptFlow, typ='l', xlab='', xaxs='i', ylab='', yaxs='i', log='y', las=1, xlim=c(as.Date('1994-09-15'), as.Date('1994-12-15')), ylim=c(2000,6e4))
abline(v=seq(as.Date('1994-09-15'), as.Date('1994-12-31'), by='day'), col='red')
box()

# Try having a look to see what the demand diversion is coincident with the oscillations in the minimum instream flow demand
# Also, from the lst file from MODFLOW: "DEAD POOL STORAGE FOR LAKE 1 IS EQUAL TO     0.2429382151E+05" = 24,293.82
# Also, from the lst file from MODFLOW: "DEAD POOL STORAGE FOR LAKE 2 IS EQUAL TO     0.1781481007E+05" = 17,814.81
plot(as.Date(minInstrmQ$Date), minInstrmQ$MidptFlow, typ='l', xlab='', xaxs='i', ylab='', yaxs='i', log='y', las=1, xlim=c(as.Date('1994-09-15'), as.Date('1994-12-15')), ylim=c(20,6e4))
points(as.Date(muniDemand$Date), muniDemand$MidptFlow, typ='l', col='limegreen')
axis(side=1, at = seq(as.Date('1994-09-01'), as.Date('1994-12-31'), by='week'), labels = format(seq(as.Date('1994-09-01'), as.Date('1994-12-31'), by='week'), '%m-%d'))
box()
par(new=TRUE)
plot(offline_stor$date_seq_LAK, offline_stor$Volume, xlab='', ylab='', xaxt='n', yaxt='n', yaxs='i', xaxs='i', typ='l', col='white', xlim=c(as.Date('1994-09-15'), as.Date('1994-12-15')), ylim=c(0, 100000))
axis(side=4, at=seq(0, 100000, by=5000), labels=seq(0,100000, by=5000), las=1)
polygon(x = in.poly.x, y=in.poly.y, col=rgb(1,0,0,0.25),border=NA, lwd=2)
points(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', col='red', lwd=2)
polygon(x = off.poly.x, y=off.poly.y, col=rgb(0,0,1,0.25),border=NA, lwd=2)
points(as.Date(offline_stor$date_seq), offline_stor$Volume, typ='l', col='blue', lwd=2)
abline(h=0.1781481007E+05, lwd=2, lty=2, col='blue')
abline(h=0.2429382151E+05, lwd=2, lty=2, col='red')

# In an attempt to track down what is going on, start with the upstream reservoir, which has less going on and may be easier to see what the issue is
plot(as.Date(inline_rel$Date), inline_rel$MidptFlow, col='black', xlab='Date', ylab='Release, m3/day', xaxs='i', yaxs='i', xlim=c(as.Date('1980-10-01'), as.Date('1980-10-31')), ylim=c(0, 20000), las=1, typ='l')
# abline(v=as.Date('1980-10-14'), col='red')
axis(side=1, at=seq(as.Date('1980-10-01'), as.Date('1980-10-31'), by='day'), labels=format(seq(as.Date('1980-10-01'), as.Date('1980-10-31'), by='day'),'%m-%d'), las=2)
par(new=TRUE)
plot(as.Date(inline_stor$date_seq_LAK), inline_stor$Volume, xlab='', ylab='', xaxt='n', yaxt='n', xaxs='i', yaxs='i', xlim=c(as.Date('1980-10-01'), as.Date('1980-10-31')), ylim=c(0, 60000), col='white')
polygon(x = in.poly.x, y=in.poly.y, col=rgb(1,0,0,0.25),border=NA, lwd=2)
points(as.Date(inline_stor$date_seq), inline_stor$Volume, typ='l', col='red', lwd=2)
abline(h=0.2429382151E+05, lwd=2, lty=2, col='red')
axis(side=4, at=seq(0,50000,by=5000), labels=seq(0,50000,by=5000), las=1)
mtext(side=4, "Storage, m3", line=4)
box()


plot(inline_rel$Time, inline_rel$MidptFlow, col='black', xlab='Date', ylab='Release, m3/day', xaxs='i', yaxs='i',  ylim=c(0, 20000), las=1, xlim=c(0,40), typ='l')
par(new=TRUE)
plot(inline_stor$Time, inline_stor$Volume, xlab='', ylab='', xaxt='n', yaxt='n', xaxs='i', yaxs='i', xlim=c(0,40), ylim=c(0, 60000), col='white')
