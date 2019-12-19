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


