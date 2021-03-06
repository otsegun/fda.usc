\name{fdata.cen}
\Rdversion{1.1}
\alias{fdata.cen}
\title{ Functional data centred (subtract the mean of each discretization point)
}
\description{
 The function fdata.cen centres the curves by subtracting the functional mean.
}
\usage{
fdata.cen(fdataobj,meanX=func.mean(fdataobj))
}

\arguments{
\item{fdataobj}{ \code{\link{fdata}} class object.}       
\item{meanX}{ The functional mean subtracted in the \code{fdatobj}.}       
 }
\value{
Return:\cr  two \code{fdata} class objects with:
\item{Xcen}{ The centered fdata.}
\item{meanX}{ Functional mean substracted.}
}
\author{
Manuel Febrero-Bande, Manuel Oviedo de la Fuente \email{manuel.oviedo@usc.es}
}
\seealso{
See Also as  \code{\link{fdata}}} 
\examples{

data(phoneme)
mlearn<-phoneme[["learn"]][13:15,]
fdata.c=fdata.cen(mlearn)$Xcen
par(mfrow=c(1,2))
plot.fdata(mlearn,type="l")
plot.fdata(fdata.c,type="l")
}
\keyword{manip} 