#tfidf
#assumes docs corpus created in 8_4 is available
#and tm, ggplot and wordcloud libraries are loaded

dtm_tfidf <- DocumentTermMatrix(docs,control = list(weighting = weightTfIdf))
#note that the weighting is normalised by default (that is, the term frequencies in a
#document are normalised by the number of terms in the document)
#summary
dtm_tfidf
#inspect segment of document term matrix
inspect(dtm_tfidf[1:5,1:5])

#tf of element (3,5)
as.matrix(dtm)[3,5]

#total number of terms in document 3
rowSums(as.matrix(dtm))[3]

#number of documents containing term 5
length(which(as.matrix(dtm)[,5]>0))

#collapse matrix by summing over columns. This gets total weights 
#(over all docs) for each term
wt_tot_tfidf <- colSums(as.matrix(dtm_tfidf))
#length should be total number of terms
length(wt_tot_tfidf )
#create sort order (desc)
ord_tfidf <- order(wt_tot_tfidf,decreasing=TRUE)
#inspect most frequently occurring terms
wt_tot_tfidf[head(ord_tfidf)]

#histogram
wf=data.frame(term=names(wt_tot_tfidf),weights=wt_tot_tfidf)
#library(ggplot2)
p <- ggplot(subset(wf, wt_tot_tfidf>.15), aes(reorder(term,weights), weights))
p <- p + geom_bar(stat="identity")
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))
p
#wordcloud
library(wordcloud)
#setting the same seed each time ensures consistent look across clouds
set.seed(42)
#in colour
wordcloud(names(wt_tot_tfidf),wt_tot_tfidf,
          max.words=30,colors=brewer.pal(6,"Dark2"))
#play with different values of max.words
#try specifying min.freq instead of max.words