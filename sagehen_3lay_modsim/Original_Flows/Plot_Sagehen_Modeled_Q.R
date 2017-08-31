sfr13 <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/sagehen_sfrseg13_out.dat', skip=2, header=FALSE, col.names=c('Time','Stage','Flow'))
sfr15 <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/sagehen_sfrseg15_out.dat', skip=2, header=FALSE, col.names=c('Time','Stage','Flow'))
sfr16 <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/sagehen_sfrseg16_out.dat', skip=2, header=FALSE, col.names=c('Time','Stage','Flow'))
sfr17 <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/sagehen_sfrseg17_out.dat', skip=2, header=FALSE, col.names=c('Time','Stage','Flow'))

png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/Sagehen_Seg13.png', height = 700, width=900, res=130)
  par(mar=c(4,5,1,1))
  plot(sfr13$Time, sfr13$Flow / 86400, typ='l', yaxs='i', xlab='Time', ylab=expression(paste('Flow, ',ft^3~ s^-1,sep='')), ylim=c(0,18), las=1)
  text(x=2000, y=15, expression(paste('Average Flow: 0.25 ',ft^3~ s^-1,sep='')))
dev.off()

png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/Sagehen_Seg15.png', height = 700, width=900, res=130)
  par(mar=c(4,5,1,1))
  plot(sfr15$Time, sfr15$Flow / 86400, typ='l', yaxs='i', xlab='Time', ylab=expression(paste('Flow, ',ft^3~ s^-1,sep='')), ylim=c(0,18), las=1)
  text(x=2000, y=15, expression(paste('Average Flow: 0.27 ',ft^3~ s^-1,sep='')))
dev.off()

png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/Sagehen_Seg16.png', height = 700, width=900, res=130)
  par(mar=c(4,5,1,1))
  plot(sfr16$Time, sfr16$Flow / 86400, typ='l', yaxs='i', xlab='Time', ylab=expression(paste('Flow, ',ft^3~ s^-1,sep='')), ylim=c(0,18), las=1)
  text(x=2000, y=15, expression(paste('Average Flow: 0.32 ',ft^3~ s^-1,sep='')))
dev.off()

png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/Sagehen_Seg17.png', height = 700, width=900, res=130)
  par(mar=c(4,5,1,1))
  plot(sfr17$Time, sfr17$Flow / 86400, typ='l', yaxs='i', xlab='Time', ylab=expression(paste('Flow, ',ft^3~ s^-1,sep='')), ylim=c(0,18), las=1)
  text(x=2000, y=15, expression(paste('Average Flow: 0.36 ',ft^3~ s^-1,sep='')))
dev.off()


png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/Hist_Sagehen_Seg13.png', height = 700, width=900, res=130)
  hist(sfr13$Flow / 86400, breaks=seq(0,25,by=0.05), xlim=c(0,3), xlab='Daily Flow Rate, cfs', main='', las=1)
  abline(v=0.25)
dev.off()

png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/Hist_Sagehen_Seg15.png', height = 700, width=900, res=130)
  hist(sfr15$Flow / 86400, breaks=seq(0,25,by=0.05), xlim=c(0,3), xlab='Daily Flow Rate, cfs', main='', las=1)
  abline(v=0.27)
dev.off()

png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/Hist_Sagehen_Seg16.png', height = 700, width=900, res=130)
  hist(sfr16$Flow / 86400, breaks=seq(0,25,by=0.05), xlim=c(0,3), xlab='Daily Flow Rate, cfs', main='', las=1)
  abline(v=0.32)
dev.off()

png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/Original_Flows/Hist_Sagehen_Seg17.png', height = 700, width=900, res=130)
  hist(sfr17$Flow / 86400, breaks=seq(0,25,by=0.05), xlim=c(0,3), xlab='Daily Flow Rate, cfs', main='', las=1)
  abline(v=0.36)
dev.off()
