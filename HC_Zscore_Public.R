# Include libraries
library(knitr)
library(ggplot2)
library(dplyr)
library(plyr)
library(gamlss)
library(gamlss.foreach)
library(ggsci)

# Read the hc table
hc.table <- read.csv("./Data/HC_Zscore_Public.csv")
hc.prnfl <- subset(hc.table, select = - Mean_GCIPL)
hc.gcipl <- subset(hc.table[!is.na(hc.table$Mean_GCIPL), ], select = - Mean_pRNFL)

# Sample model for pRNFL
prnfl.model0 <- gamlss(Mean_pRNFL~cs(Age,1), data = hc.prnfl, family=BCT) # Best performing parameters based on the current HC data
prnfl.result <- centiles.pred(prnfl.model0, xname="Age", xvalues=seq(18,70,5), type="standard-centiles", dev = c(-3, -2, -1, 0, 1, 2, 3), plot = FALSE)
prnfl.result

# Sample model for GCIPL
gcipl.model0 <- gamlss(Mean_pRNFL~cs(Age,2), data = hc.gcipl, family=BCT) # Best performing parameters based on the current HC data
gcipl.result <- centiles.pred(gcipl.model0, xname="Age", xvalues=seq(18,70,5), type="standard-centiles", dev = c(-3, -2, -1, 0, 1, 2, 3), plot = FALSE)
gcipl.result

# Read your ms table
ms.table <- read.csv("./Data/Your_MS_Data.csv")

#Prepare total list for Z-transformation
ms.age.list <- ms.table$Age
ms.prnfl.list <- ms.table$Mean_pRNFL
ms.gcipl.list <- ms.table$Mean_GCIPL

#Z-transformation
prnfl.nz <- centiles.pred(prnfl.model0, xname = "Age",xvalues = ms.age.list, yval = ms.prnfl.list, type="z-scores")
ms.table$pRNFL_Zscore <- prnfl.nz
prnfl.percentile <- round(pnorm(prnfl.nz)*100, 2)
ms.table$pRNFL_Percentile <- prnfl.percentile

gcipl.nz <- centiles.pred(gcipl.model0, xname = "Age",xvalues = ms.age.list, yval = ms.gcipl.list, type="z-scores")
ms.table$GCIPL_Zscore <- gcipl.nz
gcipl.percentile <- round(pnorm(gcipl.nz)*100, 2)
ms.table$GCIPL_Percentile <- gcipl.percentile