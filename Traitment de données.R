#question1 :
#importation de donnée 
data=read.csv(" https://archive.ics.uci.edu/ml/machine-learning-databases/00482.csv")

#occupancy > capcity
for (i in c(1:dim(data)[1])) {
  if (data[i,3]>data[i,2]) {
    
    data[i,3]=data[i,2]
      }
}

#normaliz
for (i in c(1:dim(data)[1])) {
    data[i,3]=data[i,3]/data[i,2]
  }

#n°et noms  des parking
parkings=data.frame(table(factor(data$SystemCodeNumber)))[,1]
freq=data.frame(table(factor(data$SystemCodeNumber)))[,2]
index=matrix(nrow = 30,ncol = 2)
i=0
for (j in c(1:30)) {
  index[j,1]=i+1
  index[j,2]=freq[j]+i
  i=freq[j]+i
}

index=index[-c(8,21),]

#########################################################

datechars=as.character(data$LastUpdated)
dates=matrix(nrow = 35717,ncol = 6)

for (i in 1:dim(dates)[1])
{
  
  s=strsplit(datechars[i]," ")
  
  dates[i,1]=data[i,]$Occupancy
  dates[i,2]=strtoi(strsplit(s[[1]][1],"-")[[1]][2],10)
  dates[i,3]=strtoi(strsplit(s[[1]][1],"-")[[1]][3],10)
  dates[i,4]=strtoi(strsplit(s[[1]][2],":")[[1]][1],10)
  dates[i,5]=strtoi(strsplit(s[[1]][2],":")[[1]][2],10)
  dates[i,6]=data[i,]$SystemCodeNumber
  
}

#modification des minutes 

for (i in 1:dim(dates)[1])
{
  if (dates[i,5]> 45) {
    dates[i,4]=dates[i,4]+1
    dates[i,5]=0
  } 
  else{
    if (dates[i,5]<15) {
      dates[i,5]=0
    }
    
    else{
      dates[i,5]=30
    }}
}


#######################################################

taille=18*77
dataset=matrix(nrow = taille,ncol = 5)

o=4
s=1
h=8
for (i in 1:504) {
  dataset[i,2]=10
  dataset[i,3]=o
  s=s+1
  if(s>18){
    s=1
    o=o+1
  }
}
o=1
s=1
for (j in 505:1044) {
  dataset[j,2]=11
  dataset[j,3]=o
  s=s+1
  if(s>18){
    s=1
    o=o+1
  }
}
o=1
s=1
for (j in 1045:1386) {
  dataset[j,2]=12
  dataset[j,3]=o
  s=s+1
  if(s>18){
    s=1
    o=o+1
  }
}
s=1
h=8
for (i in 1:dim(dataset)[1]) {
  dataset[i,1]=0
  dataset[i,4]=h
  s=s+1
  if(i%%2==0){
    dataset[i,5]=30
    h=h+1
  }else{
    dataset[i,5]=0
  }
  if(s>18){
    s=1
    h=8
  }
}
#############################################################################




dataf=matrix(nrow = 77*18*28,ncol = 6)
k=1
for (id in 1:28) {
  
  for (i in index[id,1]:index[id,2]) {
    for (j in 1: 1368) {
      
      
      if(dates[i,2]==dataset[j,2]&&
         dates[i,3]==dataset[j,3]&&
         dates[i,4]==dataset[j,4]&&
         dates[i,5]==dataset[j,5]
      ){
        
        dataset[j,1]=dates[i,1]
        
      }
      
    }
  }
  
  for (i in 1:1368) {
    
    if(dataset[i,1]==0){
      
      if (i-126>1&&i+126 < 1368) {
        
        dataset[i,1]=(dataset[i-126,1]+dataset[i+126,1])/2
        
      }else{
        if(i-126>1){
          dataset[i,1]=dataset[i-126,1]
        }
        else{
          dataset[i,1]=dataset[i+126,1]
        }
      }
      
      
      
    }
    
  }
  
  for (l in 1: 1368) {
    
    dataf[k,1]=dataset[l,1]
    dataf[k,2]=dataset[l,2]
    dataf[k,3]=dataset[l,3]
    dataf[k,4]=dataset[l,4]
    dataf[k,5]=dataset[l,5]
    dataf[k,6]=dates[index[id,1],6]
    
    k=k+1
  }
  for (l in 1:1368) {
    dataset[i,1]=0
  }
}

