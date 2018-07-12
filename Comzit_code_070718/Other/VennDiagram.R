source("http://www.bioconductor.org/biocLite.R")
class(biocLite)
biocLite("limma")
library(limma)

hsb2 <- read.csv("https://stats.idre.ucla.edu/wp-content/uploads/2016/02/hsb2-3.csv") 
attach(hsb2)
hw <- (write >= 60)
hm <- (math >= 60)
hr <- (read >= 60)
c3 <- cbind(hw, hm, hr)
a <- vennCounts(c3)
a
png(filename="Rplot_venn.png")
vennDiagram(a, include = "both", 
  names = c("High Writing", "High Math", "High Reading"), 
  cex = 1, counts.col = "red")
dev.off()



  g <- cbind(
  g1 = c(rep(0, 6), rep(1, 3)), 
  g2 = c(rep(1, 6), rep(0, 3)))
  d <- vennCounts(g)
  png(filename="Rplot_venn.png")
  vennDiagram(x1y1)
  dev.off()