#load tm library if required
library(tm)

#create string containing file names belonging to clusters
cluster_5_files <-  paste0(names(which(hclusters_cosine==5)), collapse='|')
#create corpus from files in directory "docs".
#Assumes the required files are located in subdirectory
#called "docs" located in current working directory
#specify encoding as files are encoded UTF-8
docs <- VCorpus(DirSource("./docs",encoding ="UTF-8",pattern=cluster_5_files))

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
BigramTokenizer <-  function(x) unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE)
#create DTM
dtmb_1 <- DocumentTermMatrix(docs, control = list(tokenize = BigramTokenizer))
dtmb_1

#obtain frequencies in the cluster
freq_1 <- colSums(as.matrix(dtmb_1))
#plot frequency histogram
library(ggplot2)
wf=data.frame(term=names(freq_1),occurrences=freq_1)
#order by frequency
p <- ggplot(subset(wf, occurrences>10), aes(reorder(term,occurrences), occurrences))
p <- p + geom_bar(stat="identity")
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))
p

