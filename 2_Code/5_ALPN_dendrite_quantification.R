#---------------------------------#
# Datasets - Dürr et al. 2025 ----
#---------------------------------#
# by Thomas O. Auer

## Front Matter ----
### Load Packages & Resources ----

library(dplyr)
library(gplots)
library(grid)
library(ggplot2)
library(Rmisc)
library(ggthemes)

## Importing data
# In Excel, the table should look like this:

# Cond  Cellcount
# Dsech_fem	90
# Dsech_fem	90
# Dsech_male	90


# Important: do not change header names

ALLDATA <- NULL
ALLDATA<-read.csv(file.choose(), header=T) #read a dataset into R
attach(ALLDATA)
summary(ALLDATA)
View(ALLDATA)

goodDATA <- ALLDATA[!is.na(Cellcount),]
attach(goodDATA)


# Remove "NA" if there were empty cells cause they bother later
ALLDATA <- na.omit(ALLDATA)


# Some info about the imported data:
paste(dim(ALLDATA)[1],
      "flies imported")

levels(ALLDATA$Cond)

# Re-ordering "Sp" levels as they were in the excel file:
ALLDATA$Cond <- as.character(ALLDATA$Cond)
ALLDATA$Cond <- factor(ALLDATA$Cond, levels=unique(ALLDATA$Cond))
levels(ALLDATA$Cond)

# Verify data was well imported:
View(ALLDATA)

## Plotting Median
fun_length <- function(x){
  return(data.frame(y=1,label= paste0("n=", length(x))))
}

fillcolour<- c("gray39","orangered")

colourletter<-c(NA, "black")

plot <- ggplot(ALLDATA, aes(x=Cond, y=Cellcount)) +
  geom_boxplot(outlier.shape = NA, fill=fillcolour, width=0.8, position=position_dodge(width=5) ) + #otherwise outliers would be plotted twice because we plot all points in the next lina
  geom_jitter(aes(Cond, Cellcount), width = 0.1, height = 0, size=5, shape = 21, col="black", fill= "grey", alpha=0.5) +
  scale_x_discrete(name = "") +
  scale_y_continuous(name = "Length in neutube pixel",
                      breaks = seq(0, 80, 5), #seq(start, end, stepsize)
                      limits=c(0, 80))+
  ggtitle("PN branch length") +

  theme_bw() +
  theme(
    legend.position="none",
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "white"),
    panel.border = element_rect(colour = "black", fill=NA, size=0.5),
    axis.text.x = element_text(colour="grey20",size=14, angle = 90, hjust=.5,vjust=.5,face="plain"),
    plot.title = element_text(hjust = 0.5, size=14),
    axis.text.y = element_text(colour="grey20",size=14,angle=0,hjust=1,vjust=.5,face="plain"),
    axis.title.x = element_text(colour="grey20",size=14,angle=0,hjust=.5,vjust=0,face="plain"),
    axis.title.y = element_text(colour="grey20",size=14,angle=90,hjust=.5,vjust=.5,face="plain")) +
  geom_vline(xintercept=2.5) +
  geom_vline(xintercept=6.5) +
  geom_vline(xintercept=9.5) +
  stat_summary(aes(x = Cond),
               fun.data = fun_length, geom = "text",
               vjust = 5, size = 10)
  #geom_hline(yintercept=0)

print(plot)

## Statistics
number_cond = length(levels(ALLDATA$Cond))
names_cond = levels(ALLDATA$Cond)
PvalueTable <- NULL
PvalueTable <- matrix(nrow=number_cond+1, ncol = number_cond+1)
PvalueTable[1,1:number_cond+1] <- names_cond
PvalueTable[1:number_cond+1,1] <- names_cond

for (ii in 1:number_cond){
  Temp1 <- subset(ALLDATA, Cond == names_cond[ii])

  if (dim(Temp1)[1]>0) {
    for (i in ii:number_cond){
      Temp <- NULL
      Temp <- subset(ALLDATA, Cond == names_cond[i])
      if (dim(Temp)[1]>0) {
        TT <- NULL
        TT <- wilcox.test(Temp1$Cellcount, Temp$Cellcount)
        PvalueTable[ii+1,i+1] <- signif(TT$p.value, digits=2)
      }
    }
  }
}

#for OR13a:
PvalueVector <- c(1, 0.00057,0.00056)

p.adjust(PvalueVector, method="BH")

#for OR98a:

PvalueVector <- c(1, 0.00041,0.51)

p.adjust(PvalueVector, method="BH")

#for OR35a:
#
PvalueVector <- c(1, 4.8e-06,0.00012)

p.adjust(PvalueVector, method="BH")

#For OR22a:
#
PvalueVector <- c(1, 0.00031,0.00012)

p.adjust(PvalueVector, method="BH")

setwd("/Users/tauer/Desktop/Rdata")

#This actually save the plot in a image
#ggsave(file="Species comparison 01-05-2018.pdf", plot=Plot, width=4)#, width=4, height=3)

ggsave(file="Figure5_PN_dendrite_length_quantification_27-11-2024.pdf", plot=plot)#, width=4, height=3)



