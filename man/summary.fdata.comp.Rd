\name{summary.fdata.comp}
\Rdversion{1.1}
\alias{summary.fdata.comp}
\title{ Correlation for functional data by Principal Component Analysis}
\description{
Compute correlation principal components of functional data and scalar response \code{y}.
}
\usage{
\method{summary}{fdata.comp}(object,y=NULL,biplot=TRUE,corplot=FALSE,\ldots)
}
\arguments{
  \item{object}{ fdata.comp class object calculated by: \code{fdata2pc}, \code{fdata2pls}, \code{fregre.pc} or \code{fregre.pls}.}  
  \item{y}{  (optional) The argument is only necessary if corplot=TRUE.}  
  \item{biplot}{ =TRUE draw the biplot and PC (or PLS) components.} 	
  \item{corplot}{ =TRUE draw correlations between y and PC (or PLS) components.} 	
	\item{\dots}{ Further arguments passed to or from other methods.}
}
\value{
    If \code{corplot}=TRUE, are displaying the biplot between the PC (or PLS) components.\cr
    If \code{corplot}=TRUE, are displaying the correlations between the PC (or PLS) components and response \code{y}.\cr    
If \code{ask}=TRUE, draw each graph in a window, waiting to confirm the change of page with a click of the mouse or pressing ENTER. 
If \code{ask}=FALSE draw graphs in one window.	 
}
\references{
Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988). \emph{The New S Language}. Wadsworth \& Brooks/Cole. 

Venables, W. N. and B. D. Ripley (2002). \emph{Modern Applied Statistics with S}. Springer-Verlag. 
}
\author{Manuel Febrero-Bande and Manuel Oviedo de la Fuente \if{latex}{\cr}\email{manuel.oviedo@usc.es}}
\seealso{
See Also as \code{\link{fdata2pc}}, \code{\link{fdata2pls}}  and  \link[stats]{cor}
}
\examples{
## Not run 
# n= 200;tt= seq(0,1,len=101)
# x0<-rproc2fdata(n,tt,sigma="wiener")
# x1<-rproc2fdata(n,tt,sigma=0.1)
# x<-x0*3+x1
# beta = tt*sin(2*pi*tt)^2
# fbeta = fdata(beta,tt)
# y<-inprod.fdata(x,fbeta)+rnorm(n,sd=0.1)
# pc1=fdata2pc(x)
# summary(pc1,y)
# pls1=fdata2pls(x,y)
# summary(pls1,cor=TRUE)

}
\keyword{multivariate} 