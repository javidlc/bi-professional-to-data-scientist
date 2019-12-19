#Begin preprocessing
#NOTE: the following assumes you have run the code in listing 8.1
#get available transformations
getTransformations()
#Strip digits
vc <- tm_map(vc, removeNumbers)
writeLines(as.character(vc[[1]]))
#Transform to lower case
vc <- tm_map(vc,content_transformer(tolower))
writeLines(as.character(vc[[1]]))
#remove stopwords - this should be done before removing punctuation
vc <- tm_map(vc, removeWords, stopwords("english"))
writeLines(as.character(vc[[1]]))
#Remove punctuation
vc <- tm_map(vc, removePunctuation)
writeLines(as.character(vc[[1]]))
#custom replacement
doReplace <- content_transformer(
  function(x,pattern,replacement){
    return  (gsub(pattern, replacement, x))})
vc <- tm_map(vc, doReplace, "tis"," ")
writeLines(as.character(vc[[1]]))
#Strip whitespace 
vc <- tm_map(vc, stripWhitespace)
writeLines(as.character(vc[[1]]))
#Stem document
vc <- tm_map(vc, stemDocument)
writeLines(as.character(vc[[1]]))


  