iter_dat <- read.table('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/windows/Iter_Output.txt', header=TRUE)

SP12 <- subset(iter_dat, iter_dat$TS==12)

isegs <- unique(SP12$iseg)

for(i in (1:length(isegs))){
    iseg_uni <- isegs[i]
    dat <- subset(SP12, SP12$iseg==iseg_uni)
    png(paste('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/SP12_iseg',as.character(i),'.png',sep=''), height=700, width=1000,res=130)
      par(mar=c(4,5,1,1))
      ylim <- c(0, max(dat$Exchange))
      plot(dat$Exchange, xlab='MODSIM-GSFLOW Iteration Number', ylab='', ylim = ylim, yaxs='i', typ='l', lwd=2, las=1)
      mtext(side=2,'Net Accretion/Depletion, units?', line=4)
      points(dat$Exchange, pch=21, bg='grey80')
    dev.off()
}


png('D:/EDM_LT/GitHub/gsflow.git/gsflow_examples.git/sagehen_3lay_modsim/plots/SP12_iseg_all.png', height=700, width=1000,res=130)
  par(mar=c(4,5,1,1))
  ylim <- c(0, max(SP12$Exchange))
  plot(dat$Exchange, xlab='MODSIM-GSFLOW Iteration Number', ylab='', ylim = ylim, yaxs='i', typ='l', lwd=2, las=1)
  mtext(side=2,'Net Accretion/Depletion, units?', line=4)
  for(i in (1:length(isegs))){
    iseg_uni <- isegs[i]                    
    dat <- subset(SP12, SP12$iseg==iseg_uni)  
    points(dat$Exchange, typ='l', lwd=1, col=i)
  }
dev.off()
