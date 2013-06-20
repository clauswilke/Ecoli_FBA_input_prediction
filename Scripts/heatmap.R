a <- 1
b <- 125
max.value <- 350*a
N1R1C = c(344,0,0,0,0,0,0,1,338,0,0,0,0,0,0,0,348,0,0,0,0,4,10,2,350,7,11,3,0,1,0,0,342,0,0,0,0,0,0,0,337,0,0,0,0,0,0,1,347)
N1R1C[N1R1C!=0] <- N1R1C[N1R1C!=0]*a
N1R1N = c(350,1,0,1,0,0,0,0,346,0,0,0,0,0,0,3,349,1,2,0,2,0,0,0,346,0,1,0,0,0,0,0,347,0,0,0,0,1,2,0,346,0,0,0,0,0,0,0,348)
N1R1N[N1R1N!=0] <- N1R1N[N1R1N!=0]*a
N20R1C = c(221,6,7,19,10,10,7,10,202,6,16,8,8,13,5,2,211,10,4,1,10,12,11,20,34,11,12,16,5,9,5,10,216,4,5,7,8,3,9,2,238,4,4,4,11,13,4,4,199)
N20R1C[N20R1C!=0] <- N20R1C[N20R1C!=0]*a
N20R1N = c(233,40,28,26,22,18,16,8,167,13,12,14,6,4,4,7,240,3,11,4,1,4,9,3,127,2,4,8,1,5,3,3,123,2,1,0,0,2,1,1,234,0,2,2,7,1,3,1,240)
N20R1N[N20R1N!=0] <- N20R1N[N20R1N!=0]*a
dim(N1R1C) <- c(7,7)
dim(N1R1N) <- c(7,7)
dim(N20R1C) <- c(7,7)
dim(N20R1N) <- c(7,7)

filename = "/Users/austin/Google\ Drive/Documents/Research/Ecoli_FBA_input_prediction/Figures/heatmap.pdf"

#library(fields) 

pdf(filename, width=10, height=10)

par(mfrow=c(2,2))

par(mgp=c(1,1,0))
par(oma=c(0,0,0,0))
par(family = "Helvetica")

par(mar=c(5.25,7,2,2))

image(N1R1C, zlim=c(0, max.value), col = gray(1-log(1:b)/log(b)),
      axes=FALSE,
      xaxt="n",
      yaxt="n"
)

text(x = -0.4,
     y = 1.11,
     cex = 2.5,
     labels = 'A',
     xpd = TRUE,
     font = 2
)

text(x = c(0,0.167,0.33,0.5,0.67,0.833,1.0)+0.025,
     y = -0.1,
     labels = paste(lab=c('D-sorbitol',"D-fructose","D-ribose","acetate","glycerol","pyruvate",'D-glucose'), sep = " "),
     srt = 45,
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Growth", 1, line=4, cex=1.5, font = 2)

text(x = -0.1,
     y = c(0,0.167,0.33,0.5,0.67,0.833,1.0),
     labels = paste(lab=c('D-sorbitol',"D-fructose","D-ribose","acetate","glycerol","pyruvate",'D-glucose'), sep = " "),
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Prediction", 2, line=4.75, cex=1.5, font = 2)

par(mar=c(5.25,7,2,2))

image(N20R1C, zlim=c(0, max.value), col = gray(1-log(1:b)/log(b)),
      axes=FALSE,
      xaxt="n",
      yaxt="n"
)

text(x = -0.4,
     y = 1.11,
     cex = 2.5,
     labels = 'B',
     xpd = TRUE,
     font = 2
)

text(x = c(0,0.167,0.33,0.5,0.67,0.833,1.0)+0.025,
     y = -0.1,
     labels = paste(lab=c('D-sorbitol',"D-fructose","D-ribose","acetate","glycerol","pyruvate",'D-glucose'), sep = " "),
     srt = 45,
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Growth", 1, line=4, cex=1.5, font = 2)

text(x = -0.1,
     y = c(0,0.167,0.33,0.5,0.67,0.833,1.0),
     labels = paste(lab=c('D-sorbitol',"D-fructose","D-ribose","acetate","glycerol","pyruvate",'D-glucose'), sep = " "),
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Prediction", 2, line=4.75, cex=1.5, font = 2)

par(mar=c(5.25,7,2,2))


image(N1R1N, zlim=c(0, max.value), col = gray(1-log(1:b)/log(b)),
      axes=FALSE,
      xaxt="n",
      yaxt="n"
)

text(x = -0.4,
     y = 1.11,
     cex = 2.5,
     labels = 'C',
     xpd = TRUE,
     font = 2
)

text(x = c(0,0.167,0.33,0.5,0.67,0.833,1.0)+0.025,
     y = -0.1,
     labels = paste(lab=c('L-glutamine',"L-alanine","glycine","putrescine","cytidine","adenine",'ammonia'), sep = " "),
     srt = 45,
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Growth", 1, line=4.2, cex=1.5, font = 2)

text(x = -0.1,
     y = c(0,0.167,0.33,0.5,0.67,0.833,1.0),
     labels = paste(lab=c('L-glutamine',"L-alanine","glycine","putrescine","cytidine","adenine",'ammonia'), sep = " "),
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Prediction", 2, line=4.75, cex=1.5, font = 2)

par(mar=c(5.25,7,2,2))

image(N20R1N, zlim=c(0, max.value), col = gray(1-log(1:b)/log(b)),
      axes=FALSE,
      xaxt="n",
      yaxt="n"
)


text(x = -0.4,
     y = 1.11,
     cex = 2.5,
     labels = 'D',
     xpd = TRUE,
     font = 2
)

text(x = c(0,0.167,0.33,0.5,0.67,0.833,1.0)+0.025,
     y = -0.1,
     labels = paste(lab=c('L-glutamine',"L-alanine","glycine","putrescine","cytidine","adenine",'ammonia'), sep = " "),
     srt = 45,
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Growth", 1, line=4.2, cex=1.5, font = 2)

text(x = -0.1,
     y = c(0,0.167,0.33,0.5,0.67,0.833,1.0),
     labels = paste(lab=c('L-glutamine',"L-alanine","glycine","putrescine","cytidine","adenine",'ammonia'), sep = " "),
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Prediction", 2, line=4.75, cex=1.5, font = 2)

#legend(1.15,
#       1.0, 
#       y.intersp=.5,
#       legend=c("", "", "", "", "", "", "", "", ""), 
#       fill=gray(log(seq(1,8,length=9))/max(log(seq(1,10,length=9)))), 
#       border=gray(log(seq(1,8,length=9))/max(log(seq(1,10,length=9)))),
#       cex=5,
#       box.lwd=0,
#       bty="n")

#text(1.46,-0.1,expression(paste(Delta, "Units?")), cex=3, xpd = TRUE)
#text(1.525,0.86,"350", cex=2, xpd = TRUE)
#text(1.525,.67,"10", cex=2, xpd = TRUE)
#text(1.525,.482,"2", cex=2, xpd = TRUE)
#text(1.525,.295,"1", cex=2, xpd = TRUE)
#text(1.525,.105,"0", cex=2, xpd = TRUE)

dev.off()