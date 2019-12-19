#load tm library
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
dtm

####

#Topic models
library(topicmodels)


#Run LDA using Gibbs Sampling
# Gibbs Sampling is a "Markov Chain Monte Carlo" algorithm that is often used to
# to approximate a probability distribution. See: https://en.wikipedia.org/wiki/Gibbs_sampling
# It works by performing a random walk in such a way that reflects the 
# characteristics of a desired distribution.
#
# The burn-in period is used to ensure that we start from a representative point. There
# is some controversy about the need to use burn-in periods. See: 
# https://www.johndcook.com/blog/2011/08/10/markov-chains-dont-converge/ for example
# We'll ignore the controversy and set...
burnin <- 1000
# and perform 2000 iterations (after burn-in)...
iter <- 2000
#..taking every 500th one for further use. This "thinning" is done to ensure that
# samples are not correlated.
thin <- 500
#We'll use 5 different, randomly chosen starting points
nstart <- 5
#using random integers as seed. Feel free to change these
seed <- list(2003,5,63,100001,765)
#...and take the best run  as the result
best <- TRUE
#set number of topics 
k <- 5

#run the LDA function on the dtm
ldaOut <- LDA(dtm,k, method="Gibbs", control=
              list(nstart=nstart, seed = seed, best=best, burnin = burnin, iter = iter, thin=thin))
#list doc to topic assignments
topics(ldaOut)
#convert to dataframe
ldaOut.topics <-as.data.frame(topics(ldaOut))
#write to disk
write.csv(ldaOut.topics,file=paste("LDAGibbs",k,"DocsToTopics.csv"))
#list top 8 terms in the topics
terms(ldaOut,8)
#convert to dataframe, writing out top 20 terms
ldaOut.terms <- as.matrix(terms(ldaOut,20))
#write out to disk
write.csv(ldaOut.terms,file=paste("LDAGibbs",k,"TopicsToTerms.csv"))
#Find probabilities associated with each topic assignment
topicProbabilities <- as.data.frame(ldaOut@gamma) 
write.csv(topicProbabilities,file=paste("LDAGibbs",k,"TopicProbabilities.csv"))

