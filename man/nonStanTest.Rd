\name{nonStanTest}
\alias{nonStanTest}
\title{
non standardization test
}
\description{
Allows the user to test a dataset of observed sequences to 
determine the probability that these sequences could have arisen due to chance.
}
\usage{
nonStanTest(lifecourseSequences, sequenceUnits)
}

\arguments{
  \item{lifecourseSequences}{
A dataset (matrix form) consisting of sequences.
}
\item{sequenceUnits}{
A vector containing the possible sequence states.
}
}
\details{
This is an approach to answering the question of whether
or not the observed sequences for a given set of lifecourses
are 'non standardized'.  This is achieved by comparing the observed sequences to a set of randomly simulated sequences .For each observed sequence A,  there is a corresponding simulated sequence, B.   B is constructed by assigning at random, an order to the observed states in A.  The simulated sequences serve as a null distribution for the test.
}
\value{
A p value (LeftTailed_pval) representing the probability that the observed test statistic (corresponding to the observed data) is greater than those obtained under the null hypothesis.
A p value (RightTailed_pval) representing the probability that the observed test statistic (corresponding to the observed data) is less than those obtained under the null hypothesis.

The test statistics obtained under the null hypothesis are also provided.
}

\author{
Glenna Nightingale
}


\examples{

data(mydata) 
# obtaining the in-built data derived from BHPS data.
bbc = mydata
bbcseq = bbc[,2:14]   
# removing the first column which contains the ID for the persons involved.
balphabet =c("non-mover","mover within gb")   
#nll = nonStanTest(bbcseq,balphabet) 
# obtaining the null distribution and p values                            

}
\keyword{ lifecourse }
\keyword{ nonstandardization }
