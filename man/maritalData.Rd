\name{maritalData}
\alias{maritalData}
\docType{data}
\title{
Marital status sequences
}
\description{
Each sequence contains the marital status for a given indivudal across 12 years.  The sequence dataset is derived from data from the British Household Panel Survey.
}
\usage{data("maritalData")}
\format{
  A data frame with 4728 observations across 12 BHPS census waves.
}
\details{
Each sequence represents a unique individual.  The sequence alphabet is of length seven and the possible states are: "divorced", "have a dissoved civil partnership","in a civil partnership", "married", "never married", "separated", and  "widowed".
}


\examples{

library(TraMineR)
data(maritalData)

#-------------------------------------------
# Converting the data into a sequence object
#-------------------------------------------

#balphabet = c( "divorced" , "have a dissolved civil partnership" ,
#"in a civil partnership",  "married" , 
#"never married" ,"separated" ,"widowed" )                          

#blabels = c( "divorced" , "have a dissolved civil partnership" ,
#"in a civil partnership",  "married" ,
#"never married" ,"separated" ,"widowed" )                          
   
#bcodes = c( "divorced" , "have a dissolved civil partnership",
#"in a civil partnership",  "married" ,
#"never married" ,"separated" ,"widowed" )                          
  
#bseq = seqdef(maritalData, alphabet=balphabet,
#states = bcodes, labels = blabels)
# forming a sequence object


#-----------------------------
# Calculating the mobility index
# per sequence and storing
# the indices in an array
#-----------------------------
#lseq = length(bseq[,1])
#wseq = length(bseq[1,])
#sequence_summary = array(0,c(lseq,1))
#for(i in 1:lseq){
#sequence_summary[i] = mobility_index(bseq[i,],balphabet,7)
#}
#plot(hist(sequence_summary),xlim=c(1,7),col="red")

#---------------------------------------
# Generating subsets of the sequence data
#--------------------------------------
#seqIplot(bseq,  sortv = "from.start",cex.legend=1)
#mseq = bseq[which(bseq[,1]=="married"),] # sequences which start with the married state
#seqIplot(mseq,  sortv = "from.start",cex.legend=1)
#sseq = bseq[which(bseq[,1]=="never married"),] # sequences which start with the never married state
#seqIplot(sseq,  sortv = "from.start",cex.legend=1)

#------------------------------------
# Lifecourse destandardization
#------------------------------------
#object = summary(as.factor(sequence_summary))
#summarize = chisq.test(object,p = rep(1/length(object),9))
# assuming the "standard" probabilities is p = rep(1/length(object),9)
# alternative standard probabilities can be used.
#summary(maritalData)


}
\keyword{datasets}
