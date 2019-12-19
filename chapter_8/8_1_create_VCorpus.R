#load tm
library(tm)
#create a text vector
txt <-   "123 To be, or not to be: that is the question:
          Whether 'tis nobler in the mind to suffer
          The slings and arrows of outrageous fortune,
          Or to take arms against a sea of troubles,
          And by opposing end them?" 
vc <- VCorpus(VectorSource(txt))
#vc is a VCorpus object
vc
#vc contains PlainTextDocument objects which can be accessed using the [[]] notation
vc[[1]]
#the PlainTextDocument object has  two attributes, content and meta, which 
#can be accessed either by index
vc[[1]][[1]]
vc[[1]][[2]]
#...or by name
names(vc[[1]])
vc[[1]]$content
vc[[1]]$meta
#alternately, we can also print the content via
writeLines(as.character(vc[[1]]))

