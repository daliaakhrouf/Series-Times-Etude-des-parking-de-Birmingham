library(factoextra)
library(ggplot2)
library(NbClust)

dataf <- read.csv("C:/Users/Midou/Desktop/nonSuppprojet/dataf.csv")
dataq4=matrix(data = dataf[,2],nrow = 18,ncol = 2156)
dataq4=t(dataq4)
for (i in 1:2156) {
dataq4[i,1]=mean(dataq4[i,])
  
}
dataq4=matrix(data = dataq4[,1],nrow = 77,ncol = 28)
dataq4=t(dataq4)

# Elbow method
fviz_nbclust(dataq4, kmeans, method = "wss") +
  geom_vline(xintercept = 2, linetype = 2)+
  labs(subtitle = "Elbow method")

# Silhouette method
fviz_nbclust(dataq4, kmeans, method = "silhouette")+
  labs(subtitle = "Silhouette method")


resq4=kmeans(dataq4,2)
resq4$cluster

pc1=prcomp(dataq4)
plot(pc1$x,col=resq4$cluster)

plot(dataq4[6,],type = "l")


