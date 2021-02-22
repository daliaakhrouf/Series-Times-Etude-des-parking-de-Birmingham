# Etude-des-parking-de-Birmingham
Apprentissage non supervisé sur le taux de remplissage des parcs de stationnement d’automobiles à Birmingham

Dans ce projet nous avons réalisé une étude des données relatif au taux de remplissage des parcs de stationnement d’automobiles à Birmingham. Les capteurs utilisés transmettent des informations chaque 30 minutes, ce qui donne 18 mesures / jour. Ces données se trouvent
sur le site ( https://archive.ics.uci.edu/ml/machine-learning-databases/00482 ).
La première étape nous avons fait un nettoyage de données qui qui consiste à détecter les valeurs manquantes ou erronées et porter des corrections s’il le faut . Dans la deuxième étape nous avons réalisé une classification de l’ensemble de séries hebdomadaires de
chaque parking en utilisant deux méthodes : classification hiérarchique (CAH) et kmeans .
Enfin dans le but de regrouper les parkings en classes homogènes nous avons effectué une analyse de chaque parking en considérant une mesure par jour (nous avons calculé la moyenne).
