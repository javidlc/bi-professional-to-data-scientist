rm(list=ls())
#load tm library if required
library(tm)
#create corpus from files in directory "docs".
#Assumes the required files are located in subdirectory
#called "docs" located in current working directory
#specify encoding as files are encoded UTF-8
docs <- VCorpus(DirSource("./docs",encoding ="UTF-8"))
print(docs)
class(docs)
#examine contents
#To access the actual contents we need to use the [[]] notation
class(docs[[30]])
docs[[30]]$meta
docs[[30]]$content

#Preprocessing

#Remove punctuation - replace punctuation marks with " "
docs <- tm_map(docs, removePunctuation)
#Transform to lower case
docs <- tm_map(docs,content_transformer(tolower))
#Strip digits
docs <- tm_map(docs, removeNumbers)
#Remove stopwords from standard stopword list 
docs <- tm_map(docs, removeWords, stopwords("english"))
#Strip whitespace (cosmetic?)
docs <- tm_map(docs, stripWhitespace)
#inspect output
writeLines(as.character(docs[[30]]))
#Create document-term matrix
dtm <- DocumentTermMatrix(docs)

## start clustering specific code
#convert dtm to matrix 
m<-as.matrix(dtm)
#compute euclidean distance between document vectors
d <- dist(m)
#run hierarchical clustering using Ward's method 
hclust_euclidean  <- hclust(d,method="ward.D")
#plot, use hang to ensure that labels fall below tree
plot(hclust_euclidean, hang=-1)
#display 4 clusters
rect.hclust(hclust_euclidean,4)
#assign to 4 clusters
hclusters_euclidean <- cutree(hclust_euclidean,4)
#write out cluster assignments
write.csv(hclusters_euclidean,"hclusters_euclidean.csv")

#repeat using cosine distance

#function to calculate cosine distance
cosine_distance <- function(x){
  #dist = 1-cos(theta)
  1-as.dist(x%*%t(x)/(sqrt(rowSums(x^2) %*% t(rowSums(x^2)))))
}

#compute cosine distance between every pair of documents
cd <- cosine_distance(m)

#run hierarchical clustering using cosine distance
hclust_cosine <- hclust(cd,method="ward.D")
#plot, use hang to ensure that labels fall below tree
plot(hclust_cosine, hang=-1)
#display 5 clusters
rect.hclust(hclust_cosine,5)
#assign to 5 clusters
hclusters_cosine <- cutree(hclust_cosine,5)
#write out cluster assignments
write.csv(hclusters_cosine,"hclusters_cosine.csv")

#compare cluster assignments obtained by both methods
cluster_assignments <- cbind(hclusters_euclidean,hclusters_cosine)


