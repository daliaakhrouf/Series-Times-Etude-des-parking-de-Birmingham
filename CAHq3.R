library(factoextra)
library(ggplot2)
library(NbClust)
library(cluster)
dataf <- read.csv("C:/Users/Midou/Desktop/nonSuppprojet/dataf.csv")
dataq3=matrix(data = dataf[,2],nrow = 126,ncol = 308)
dataq3=t(dataq3)

# Matrice des distances
D <- dist(dataq3, method = "euclidean")
# Mise en oeuvre de l'algorithme
H <- hclust(D, method="ward.D")

# Représentation graphique (dendrogramme)
barplot(rev(H$height)[1:20],xlab = "Nombre de cluster")
plot(rev(H$height)[1:10],type = "l")

# Coupe de l'arbre pour trouver la meilleure partition en K=2 classes
classes <- cutree(H, k=2)

# Graphique dans le premier plan principal (ACP) avec classes colorées
ACP <-prcomp(dataq3)
plot(ACP$x,col=classes)

# Représentation graphique (dendrogramme)
plot(H,which.plots=2)
# De manière plus lisible
plot(as.hclust(H),hang=-1)


# Dessin de rectangles autour des classes (sur le dendrogramme)
rect.hclust(as.hclust(H),k=2,border="red")


