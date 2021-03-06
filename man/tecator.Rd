\name{tecator}
\Rdversion{1.1}
\alias{tecator}
\docType{data}
\title{
tecator data
}
\description{
Water, Fat and Protein content of meat samples
}
\usage{data(tecator)}
\format{
  The format is:  \cr
 \code{..$absorp.fdata}: absorbance data. \code{fdata} class object with: \cr
\itemize{
\item \code{"data"}: Matrix of class \code{fdata} with 215 curves (rows) discretized in 100 points or argvals (columns).\cr
\item \code{"argvals"}: 100 discretization points from 850 to 1050mm \cr
\item \code{"rangeval"}=(850,1050): range(\code{"argvals"})
\item \code{"names"} list with:  \code{main} an overall title "Tecator data set",	\code{xlab} title for \code{x} axis "Wavelength (mm)" and \code{ylab} title for \code{y} axis  "Absorbances".
}   
  \code{..$y}: the percentages of Fat, Water and Protein.  The three contents are determined by analytic chemistry.\cr 
}
\details{
\code{absorp.fdata} absorbance data for 215 samples. The first 129 were originally used as a training set 
endpoints the percentages of Fat, Water and Protein.\cr 
for more details see tecator package}
%\source{\url{http://lib.stat.cmu.edu/datasets/tecator}}
\author{Manuel Febrero-Bande and Manuel Oviedo de la Fuente \if{latex}{\cr}\email{manuel.oviedo@usc.es}}
\examples{
data(tecator)
names(tecator)
names(tecator$absorp.fdata)
names(tecator$y)
names(tecator$y)
class(tecator$absorp.fdata)
class(tecator$y)
dim(tecator$absorp.fdata)
dim(tecator$y)
}
\keyword{datasets}

%http://lib.stat.cmu.edu/datasets/tecator