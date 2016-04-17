\name{mobility_index}
\alias{mobility_index}

\title{
mobility index
}
\description{
Calculates the mobility index for a given sequence of states.
}


\arguments{
  \item{sequence}{
A given sequence of states
}
\item{alphabet}{
Vector with sequence alphabet
}
\item{nalpha}{
Length of sequence
}
}
\details{
The mobility index facilitates the calculation of each individual's mobility over the life course.  This index is defined as the number of separate state clusters.  A state cluster is defined as a bout of identical states (n>=1).    Let A, B, and C denote the sequence alphabet for a given trajectory T = BABBAAAC.  The mobility index assigned for T1 is 5 since there are 5 distinct state clusters: B, A, BB, AAA, and C.  For a second trajectory, T2=BBBBBBBB, the mobility index is 1.
The mobility index can be applied to different types of lifecourse data.  The output from this function gives an indication of the number of state clusters within the lifecourse and hence the 'mobility' between states.
The in-built datasets are derived from the British Household Panel Survey data (BHPS).  The data are derived from the BHPS indresp data files.  
}
\value{
mobility index 
}

\author{
Glenna Nightingale
}



\examples{

#-----------------------------------------------------------------------
# Constructing 10000 sequences and calculating
#a test statistic (using the mobility index) from the resulting dataset.
#-----------------------------------------------------------------------

score = totalScore = 0
P = matrix("",nrow=10000,ncol=13)
myseq =  sample( LETTERS[c(1,4,5,7)], 13, prob=c(.25,.25,.25,.25), replace=TRUE )
# Each sequence contains four states.   
#Examples of states are distinct geographical locations or marital status categories.
for(i in 1:10000){
myseq1 =  sample( myseq )
P[i,1:13] = myseq1
score = (mobility_index(myseq1,LETTERS[c(1,4,5,7)],13))
totalScore = totalScore + score
}
dataset_one_score = totalScore/(10000*13)
# test statistic = 
#(sum of mobility index)/(total number of sequences * total number of years)
dataset_one_score

}

\keyword{ mobility }
\keyword{ index }
