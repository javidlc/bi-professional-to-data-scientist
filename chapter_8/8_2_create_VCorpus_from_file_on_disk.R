#load tm
library(tm)
#create text vector
txt <-   "123 To be, or not to be: that is the question:
          Whether 'tis nobler in the mind to suffer
The slings and arrows of outrageous fortune,
Or to take arms against a sea of troubles,
And by opposing end them?" 

#write text file to disk (creates in current working directory)
writeLines(txt, "text_on_disk.txt")

#create corpus by reading created file from disk
vc1 <- VCorpus(DirSource(directory = ".", pattern = "text_on_disk.txt" ))
vc1