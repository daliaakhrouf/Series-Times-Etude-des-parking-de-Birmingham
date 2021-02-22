library(factoextra)
library(ggplot2)
library(NbClust)
library(cluster)


dataf <- read.csv("C:/Users/Midou/Desktop/nonSuppprojet/dataf.csv")
dataq4=matrix(data = dataf[,2],nrow = 18,ncol = 2156)
dataq4=t(dataq4)
for (i in 1:2156) {
  dataq4[i,1]=mean(dataq4[i,])
  
}
dataq4=matrix(data = dataq4[,1],nrow = 77,ncol = 28)
dataq4=t(dataq4)


# Matrice des distances
D <- dist(dataq4, method = "euclidean")
# Mise en oeuvre de l'algorithme
H <- hclust(D, method="ward.D")

# Représentation graphique (dendrogramme)
barplot(rev(H$height)[1:30],xlab = "Nombre de cluster")
plot(rev(H$height)[1:10],type = "l")

# Coupe de l'arbre pour trouver la meilleure partition en K=2 classes
classes <- cutree(H, k=2)

# Graphique dans le premier plan principal (ACP) avec classes colorées
ACP <-prcomp(dataq4)
plot(ACP$x,col=classes)

# Représentation graphique (dendrogramme)
plot(H,which.plots=2)
# De manière plus lisible
plot(as.hclust(H),hang=-1)


# Dessin de rectangles autour des classes (sur le dendrogramme)
rect.hclust(as.hclust(H),k=2,border="red")
