library(factoextra)
library(ggplot2)
library(NbClust)

dataf <- read.csv("C:/Users/Midou/Desktop/nonSuppprojet/dataf.csv")
dataq3=matrix(data = dataf[,2],nrow = 126,ncol = 308)
dataq3=t(dataq3)

# Elbow method
fviz_nbclust(dataq3, kmeans, method = "wss") +
  geom_vline(xintercept = 2, linetype = 2)+
  labs(subtitle = "Elbow method")

# Silhouette method
fviz_nbclust(dataq3, kmeans, method = "silhouette")+
  labs(subtitle = "Silhouette method")

#Kmeans
res=kmeans(dataq3,2)
library(FactoMineR)
pc=prcomp(dataq3)

plot(pc$x,col=res$cluster)
pcc=PCA(dataq3)
fviz_pca_ind(pcc,col.ind = res$cluster,   geom.ind = "point" )
pcc$svd
plot.PCA(pcc,col.ind = res$cluster,)
plot(res$centers[1,],type = "l")


res$cluster
