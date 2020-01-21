setwd('C:/Users/wiwax/github/summerproject')
library(colorRamps)
library(ggplot2)
library(akima)
library(reshape2)
library(mgcv)

channels <- read.csv('topoplot.csv')

ggplot(channels, aes(x, y, z = complexity)) + stat_summary_2d() + scale_fill_gradientn(colours=matlab.like(20))

datmat <- interp(channels$x, channels$y, channels$complexity,
                 xo = seq(0, 1, length = 1000),
                 yo = seq(0, 1, length = 1000),
                 extrap = TRUE,
                 linear = FALSE)
datmat2 <- melt(datmat$z)
names(datmat2) <- c('x', 'y', 'value')
datmat2[,1:2] <- datmat2[,1:2]/1000 # scale it back

# spl1 <- gam(complexity ~ s(x, y, bs = 'sos'), data = channels)
# # fine grid, coarser is faster
# datmat2 <- data.frame(expand.grid(x = seq(0, 1, 0.01), y = seq(0, 1, 0.001)))
# resp <- predict(spl1, datmat2, type = "response")
# datmat2$value <- resp

circleFun <- function(center = c(0,0),diameter = 1, npoints = 100){
  r = diameter / 2
  tt <- seq(0,2*pi,length.out = npoints)
  xx <- center[1] + r * cos(tt)
  yy <- center[2] + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}

circledat <- circleFun(c(.5, .5), 1, npoints = 100) # center on [.5, .5]

# ignore anything outside the circle
datmat2$incircle <- (datmat2$x - .5)^2 + (datmat2$y - .5)^2 < .5^2 # mark
datmat2 <- datmat2[datmat2$incircle,]

ggplot(datmat2, aes(x, y, z = value)) +
  geom_tile(aes(fill = value)) +
  stat_density_2d(aes(fill = ..level..), geom = 'polygon', binwidth = 0.1) +
  geom_contour(colour = 'white', alpha = 0.5) +
  scale_fill_distiller(palette = "Spectral", na.value = NA) + 
  geom_path(data = circledat, aes(x, y, z = NULL)) +
  # draw the nose (haven't drawn ears yet)
  geom_line(data = data.frame(x = c(0.45, 0.5, .55), y = c(1, 1.05, 1)), 
            aes(x, y, z = NULL)) +
  # add points for the electrodes
  geom_point(data = channels, aes(x, y, z = NULL, fill = NULL), 
             shape = 21, colour = 'black', fill = 'white', size = 2) +
  theme_bw()

# pts <- read.csv('topoplot.csv')
# pts.grid <- interp(as.data.frame(pts)$x, as.data.frame(pts)$y, as.data.frame(pts)$complexity)
# pts.grid2 <- expand.grid(x=pts.grid$x, y=pts.grid$y)
# pts.grid2$z <- as.vector(pts.grid$z)
# (ggplot(as.data.frame(pts), aes(x=x, y=y, z=complexity))
#   #+ geom_tile(data=na.omit(pts.grid2), aes(x=x, y=y, z=z, fill=z))
#   + stat_density_2d(data=na.omit(pts.grid2), binwidth=2, colour="red", aes(x=x, y=y, z=z))
#   + geom_point()
# )
