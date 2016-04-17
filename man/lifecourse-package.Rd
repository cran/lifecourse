\name{lifecourse-package}
\alias{lifecourse-package}
\alias{lifecourse}
\docType{package}
\title{
lifecourse
}
\description{
Quantifying lifecourse fluidity.


Three functions are provided together with in-built datasets.
The non-standardization function calculates the probability that the observed data (lifecourse sequences) arose randomly.  This requires the calculation of the mobility index for each sequence.  The mobility index function calculates the mobility index (number of distinct state clusters in a given sequence).
The mobility index can be applied to different types of lifecourse channels apart from the migration channel.  The output from this function gives an indication of the number of state clusters within the lifecourse and hence the 'mobility' between states.  A state cluster by definition would contain at least one state.


The difference in the average mobility index for three datasets is illustrated in the figures below.  In the figures the lifecourse sequences for 10000 individuals (with their ID's on the y axis) over 13 years (denoted by T1 to T13 on the x axis) are shown.  Each state can be either of four states (represented by yellow, blue, red and green blocks).  In the first figure we note that there is a preponderance of yellow and blue blocks (which represent particular states).  This dataset exhibits high clustering of states represented by the blue and yellow blocks. There are relatively few states represented by the green blocks and none represented by the red blocks.
The average mobility index (over the 10000 sequences) is 6.52.  The maximum value for the mobility index is 13 since the maximum number of years in the dataset is 13.

\figure{clustered.jpeg}{options:width=0.5in}


In the figure below, the states have been assigned randomly, and the level of state clustering is much less than that in the previous dataset.  Also all four of the possible states are evident in this dataset.  For this dataset, the average mobility index is 10.54.
\figure{random.jpeg}{options:width=0.5in}


Finally, in the figure below each sequence contains states such that each successive state is different from that preceding it.  In this case the mobility index for each sequence would be 13 and average mobility index for all the sequences is 13.  
\figure{regular.jpeg}{options:width=0.5in}

The linkedLives function performs the non-standardization test while taking into account persons who are linked to each other in a way which is important to the particular study.  For example, persons with the same house id are likely to have the same mobility trajectory when considering their migration lifecourse channel.


The in-built datasets are derived from the British Household Panel Survey data (BHPS).  The data are derived from the BHPS indresp data files.
}
\details{
\tabular{ll}{
Package: \tab lifecourse\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2016-03-18\cr
License: \tab GPL\cr
}
}
\author{
Glenna Nightingale <glenna.evans@gmail.com>}

\keyword{ lifecourse }

\examples{
#---------------------------------------------------
# obtaining the in-built data derived from BHPS data.
#---------------------------------------------------
data(mydata)
bbc = mydata
lbbc = length(mydata[,1])
#---------------------------------------------------
# plotting the sequences with the sequence states
# colour coded.
#--------------------------------------------------
balphabet =c("non-mover","mover within gb")   	
# specifying the sequence alphabet.  For the BHPS mobility data we 
# specify "non-mover" and "mover within gb"
blabels = c("non-mover","mover within gb")
bcodes =  c("non-mover","mover within gb")
bseq = seqdef(bbc[,2:14], alphabet=balphabet,states = bcodes, labels = blabels) 
# forming the dataset of sequences
seqIplot(bseq,  sortv = "from.start",cex.legend=1.6,cex.main=3,cex.lab=1.5,cex = 2,
         cpal=c("lightgoldenrod","blue")) 		
# plotting the sequences

#------------------------------------------
# calculating the mobility index
# for the observed sequences
#------------------------------------------
bbcseq = bbc[,2:14] 					
# removing the first column which contains the ID for the persons involved.
totalScore = score = 0					
# calculating the mobility index for the observed sequences
for(i in 1:length(bbcseq[,1])){
  myseq = bbcseq[i,1:13]
  score = (mobility_index(myseq,c("non-mover","mover within gb"),2)) 
  totalScore = totalScore + score
}
totalScore
testStatistic = totalScore/(13*lbbc)
# the length of the lifecourse = 13, 
#the number of sequences = lbbc
testStatistic

#-------------------------------------
# Running the non-standardization test
#-------------------------------------
#nll = nonStanTest(bbcseq,balphabet) # obtaining the null distribution
#hist(nll[[1]],main="Null distribution",xlab="Test statistsics",ylab="Frequency",col="grey")
# plotting the null distribution to compare with the observed test statistic.
#par(new=T)
#plot(density(nll[[1]],adjust=3),col="blue",axes=F,lwd=4,xlab="",ylab="",main="")
#abline(v=testStatistic,col="orange",lwd=4)
#nll[[2]]# Left Tailed test - pval
#nll[[3]]# Right Tailed test - pval
}
