#This script assumes you have run processing steps
#detailed in 8_4_process_docs.R and the objects created
#by that script - in particular, the docs corpus is available.

#Create document-term matrix
dtm <- DocumentTermMatrix(docs)
#summary
dtm
#inspect contents
inspect(dtm[1:5,1:5])
#calculate how frequently each term occurs in
#the corpus
freq <- colSums(as.matrix(dtm))
#length of freq vector should equal number of terms
length(freq)
#create sort order (desc)
ord <- order(freq,decreasing=TRUE)
#inspect most frequently occurring terms
freq[head(ord,10)]
#find frequent terms
findFreqTerms(dtm,lowfreq=30)
#correlations
findAssocs(dtm,"management",0.8)

#plot frequency histogram
library(ggplot2)
wf=data.frame(term=names(freq),occurrences=freq)
#order by frequency
p <- ggplot(subset(wf, occurrences>150), aes(reorder(term,occurrences), occurrences))
p <- p + geom_bar(stat="identity")
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))
p

#wordcloud
library(wordcloud)
#setting the same seed each time ensures consistent look across clouds
set.seed(42)
#limit words by specifying min frequency
wordcloud(names(freq),freq, max.words=30)
#...add color
set.seed(42)
wordcloud(names(freq),freq,max.words=30,colors=brewer.pal(6,"Dark2"))

#create dtm of bigrams (two words at a time)
BigramTokenizer <-  function(x) unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE)
#create DTM
dtmbi <- DocumentTermMatrix(docs, control = list(tokenize = BigramTokenizer))
#inspect contents
inspect(dtmbi[10:15,10:15])
