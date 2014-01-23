max.value <- 350
color.scale <- function()
{
	n1 = 7
	n2 = 275
	gray( c(1-.1*(0:n1)/n1, .90*(1-(1:n2)/n2), rep(0,68)))
}
value.to.color <- function( value, color.scale )
{
	n <- length( color.scale )
	print(floor((n-1)*value/max.value)+1)
	color.scale[floor((n-1)*value/max.value)+1]
}


N1R1C = c(344,0,0,0,0,0,0,1,338,0,0,0,0,0,0,0,348,0,0,0,0,4,10,2,350,7,11,3,0,1,0,0,342,0,0,0,0,0,0,0,337,0,0,0,0,0,0,1,347)
N1R1N = c(350,1,0,1,0,0,0,0,346,0,0,0,0,0,0,3,349,1,2,0,2,0,0,0,346,0,1,0,0,0,0,0,347,0,0,0,0,1,2,0,346,0,0,0,0,0,0,0,348)
N10R1C=c(281,   0,   0,   0,   0,   0,   0, 7, 297,   3,  25,   3,   6,   3, 2,   1, 317,   1,   1,   0,   1,  49,  45,  24, 318,  45,  50,  36,  1,   1,   0,   0, 298,   3,   0, 1,   0,   0,   1,   2, 290,   1, 0,   0,   0,   0,   0,   0, 305)
N10R1N=c(348,   0,   3,   3,   2,   0,   2, 0, 337,   2,   4,   3,   3,   1, 0,   1, 330,   1,   2,   2,   0,  0,   2,   4, 334,   0,   2,   1, 0,   1,   1,   1, 335,   2,   0, 1,   1,   1,   5,   1, 337,   1, 0,   0,   1,   0,   2,   2, 339)
N20R1C = c(221,6,7,19,10,10,7,10,202,6,16,8,8,13,5,2,211,10,4,1,10,12,11,20,34,11,12,16,5,9,5,10,216,4,5,7,8,3,9,2,238,4,4,4,11,13,4,4,199)
N20R1N = c(233,40,28,26,22,18,16,8,167,13,12,14,6,4,4,7,240,3,11,4,1,4,9,3,127,2,4,8,1,5,3,3,123,2,1,0,0,2,1,1,234,0,2,2,7,1,3,1,240)
dim(N1R1C) <- c(7,7)
dim(N1R1N) <- c(7,7)
dim(N10R1C) <- c(7,7)
dim(N10R1N) <- c(7,7)
dim(N20R1C) <- c(7,7)
dim(N20R1N) <- c(7,7)

filename = "heatmap.pdf"

#library(fields) 

pdf(filename, width=12.5, height=10)

#par(mfrow=c(2,2))

layout( matrix(c(1,5,2,3,5,4), 2, 3, byrow=T ), widths=c(5,2,5) )

par(mgp=c(1,1,0))
par(oma=c(0,0,0,0))
par(family = "Helvetica")

par(mar=c(5.25,7,2,2))

image(N1R1C, zlim=c(0, max.value), col = color.scale(),
      axes=FALSE,
      xaxt="n",
      yaxt="n"
)

text(x = -0.3,
     y = 1.11,
     cex = 2.5,
     labels = 'A',
     xpd = TRUE,
     font = 2
)

text(x = c(0,0.167,0.33,0.5,0.67,0.833,1.0)+0.025,
     y = -0.1,
     labels = paste(lab=rev(c('D-sorbitol',"D-fructose","D-ribose","acetate","glycerol","pyruvate",'D-glucose')), sep = " "),
     srt = 45,
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Growth", 1, line=4, cex=1.5, font = 2)

text(x = -0.1,
     y = c(0,0.167,0.33,0.5,0.67,0.833,1.0),
     labels = paste(lab=rev(c('D-sorbitol',"D-fructose","D-ribose","acetate","glycerol","pyruvate",'D-glucose')), sep = " "),
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Prediction", 2, line=4.75, cex=1.5, font = 2)

par(mar=c(5.25,7,2,2))

image(N10R1C, zlim=c(0, max.value), col = color.scale(),
      axes=FALSE,
      xaxt="n",
      yaxt="n"
)

text(x = -0.3,
     y = 1.11,
     cex = 2.5,
     labels = 'B',
     xpd = TRUE,
     font = 2
)

text(x = c(0,0.167,0.33,0.5,0.67,0.833,1.0)+0.025,
     y = -0.1,
     labels = paste(lab=rev(c('D-sorbitol',"D-fructose","D-ribose","acetate","glycerol","pyruvate",'D-glucose')), sep = " "),
     srt = 45,
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Growth", 1, line=4, cex=1.5, font = 2)

text(x = -0.1,
     y = c(0,0.167,0.33,0.5,0.67,0.833,1.0),
     labels = paste(lab=rev(c('D-sorbitol',"D-fructose","D-ribose","acetate","glycerol","pyruvate",'D-glucose')), sep = " "),
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Prediction", 2, line=4.85, cex=1.5, font = 2)

par(mar=c(5.25,7,2,2))


image(N1R1N, zlim=c(0, max.value), col = color.scale(),
      axes=FALSE,
      xaxt="n",
      yaxt="n"
)

text(x = -0.3,
     y = 1.11,
     cex = 2.5,
     labels = 'C',
     xpd = TRUE,
     font = 2
)

text(x = c(0,0.167,0.33,0.5,0.67,0.833,1.0)+0.025,
     y = -0.1,
     labels = paste(lab=rev(c('L-glutamine',"L-alanine","glycine","putrescine","cytidine","adenine",'ammonia')), sep = " "),
     srt = 45,
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Growth", 1, line=4.4, cex=1.5, font = 2)

text(x = -0.1,
     y = c(0,0.167,0.33,0.5,0.67,0.833,1.0),
     labels = paste(lab=rev(c('L-glutamine',"L-alanine","glycine","putrescine","cytidine","adenine",'ammonia')), sep = " "),
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Prediction", 2, line=4.9, cex=1.5, font = 2)

par(mar=c(5.25,7,2,2))

image(N10R1N, zlim=c(0, max.value), col = color.scale(),
      axes=FALSE,
      xaxt="n",
      yaxt="n"
)


text(x = -0.3,
     y = 1.11,
     cex = 2.5,
     labels = 'D',
     xpd = TRUE,
     font = 2
)

text(x = c(0,0.167,0.33,0.5,0.67,0.833,1.0)+0.025,
     y = -0.1,
     labels = paste(lab=rev(c('L-glutamine',"L-alanine","glycine","putrescine","cytidine","adenine",'ammonia')), sep = " "),
     srt = 45,
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Growth", 1, line=4.4, cex=1.5, font = 2)

text(x = -0.1,
     y = c(0,0.167,0.33,0.5,0.67,0.833,1.0),
     labels = paste(lab=rev(c('L-glutamine',"L-alanine","glycine","putrescine","cytidine","adenine",'ammonia')), sep = " "),
     adj = 1,
     cex = 1,
     xpd = TRUE,
     font = 2
)

mtext("Prediction", 2, line=4.9, cex=1.5, font = 2)


plot.new()
plot.window( xlim=c(-10,10), ylim=c(-2,2) )

leg.x = -20
leg.y = 2.
leg.dx = 4
leg.dy = -1.66
leg.delta = .16

legend(leg.x,
       leg.y,
       x.intersp=0,
       y.intersp=.5,
       legend=c("", "", "", "", "", "", "", "", ""), 
       fill=value.to.color( c(280, 245, 210, 175, 140, 105, 70, 35, 5), color.scale() ),
       border=value.to.color( c(280, 245, 210, 175, 140, 105, 70, 35, 5), color.scale() ),
       cex=5,
       box.lwd=0,
       bty="n")

#text(leg.x+leg.dx,leg.y+leg.dy+11*leg.delta,"100", cex=2, xpd = TRUE)
text(leg.x+leg.dx,leg.y+leg.dy+9*leg.delta,">80", cex=2, xpd = TRUE)
text(leg.x+leg.dx,leg.y+leg.dy+7*leg.delta," 60", cex=2, xpd = TRUE)
text(leg.x+leg.dx,leg.y+leg.dy+5*leg.delta," 40", cex=2, xpd = TRUE)
text(leg.x+leg.dx,leg.y+leg.dy+3*leg.delta," 20", cex=2, xpd = TRUE)
text(leg.x+leg.dx,leg.y+leg.dy+2*leg.delta," 10", cex=2, xpd = TRUE)
text(leg.x+leg.dx,leg.y+leg.dy+1*leg.delta,"  2", cex=2, xpd = TRUE)
text(leg.x+leg.dx+9,leg.y+leg.dy+0*leg.delta, "% cases", cex=2, xpd = TRUE)

dev.off()