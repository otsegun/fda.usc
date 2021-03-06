\name{plot.fdata}
\Rdversion{1.1}
\alias{plot.fdata}
\alias{lines.fdata}
\alias{title.fdata}
\alias{plot.bifd}
\alias{plot.depth}
\alias{plot.mdepth}
\title{ Plot functional data: fdata.
}
\description{
Plot object of class \code{fdata}.
}
\usage{
\method{plot}{fdata}(x, type, main, xlab, ylab,
mfrow = c(1, 1), time = 1,\dots)
\method{lines}{fdata}(x,\dots)
\method{title}{fdata}(x,main=NULL,xlab=NULL,ylab=NULL,rownames=NULL) 
\method{plot}{bifd}(x,argvals.s,argvals.t,\dots)
\method{plot}{depth}(x, trim, levgray=.9,\dots)
\method{plot}{mdepth}(x, trim, levgray=.9,\dots)
}
\arguments{
  \item{x}{ \code{fdata} class object with: 
\itemize{
		\item \code{"data"}: \cr
    For \code{fdata} class object as curve (1d), \code{"data"} is a \code{matrix} (by default), \code{data.frame} or \code{array}  of  set cases with dimension (\code{n} x \code{m}), where \code{n} is the number of curves and \code{m} are the points observed in each curve over the x--axe.\cr 
     For \code{fdata2d} class object as surface (2d). \code{"data"} is a \code{array}  of  set cases with dimension (\code{n} x \code{m1} x \code{m2}), where \code{n} is the number of functional data and \code{m1} and \code{m2} are the points observed  over the x--y plane.
    \item \code{"argvals"}: vector or list of vectors with the discretizations points values.
    \item \code{"rangeval"}: vector or list of vectors with the range of the discretizations points values,  by default range(\code{argvals}). 
    \item \code{"names"}: (optional) list with  \code{main} an overall title,	\code{xlab} title for \code{x} axis and \code{ylab} title for \code{y} axis.
    }               
       
    or  a two-argument functional data object, see \code{\link{bifd}}.} 
%   i.- \code{"data"}: matrix  of  set cases with dimension (\code{n} x \code{m}), where \code{n} is the number of curves and \code{m} are the discretization points observed in each curve, ii.- \code{"argvals"}: the discretizations points values, iii.- \code{"rangeval"}: range of the discretizations points values, iv.- \code{"names"} (optional) list with  \code{main} an overall title, \code{xlab} title for \code{x} axis and \code{ylab} title for \code{y} axis.}   
  \item{type}{1-character string giving the type of plot desired.\cr
The following values are possible for \code{fdata} class object: "l" for lines (by default),"p" for points, , "o" for overplotted points and lines, "b", "c" for (empty if "c") points joined by lines, "s" and "S" for stair steps and "h" for histogram-like vertical lines. Finally, "n" does not produce any points or lines.\cr
The following values are possible for \code{fdata2d} class object: "image.contour" (by default) to display three-dimensional  data and add the contour lines, "image" to display three-dimensional  data, "contour" to display a contour plot, "persp" to display a perspective plots of a surface over the x-y plane and "filled.contour" to display a contour plot with the areas between the contours filled in solid color.}
  \item{main}{an overall title for the plot: see \code{\link{title}}.}
  \item{xlab}{xlab title for x axis, as in plot.}  
  \item{ylab}{ylab title for y axis, as in plot.}	
   \item{mfrow}{A vector of the form c(nr, nc). Subsequent figures will be drawn in an nr-by-nc array on the device by rows (mfrow).}
   \item{time}{The time interval to suspend plot execution for, in seconds, see \link[base]{Sys.sleep}.}
 \item{rownames}{Row names.} 
 \item{argvals.s}{ a vector of argument values for the first argument s of the functional data object to be evaluated.}
 \item{argvals.t}{a vector of argument values for the second argument t of the functional data object to be evaluated.}
  \item{\dots}{ Further arguments passed to \link[graphics]{matplot} function (for fdata class) or \link[graphics]{image}, \link[graphics]{contour}, \link[graphics]{persp} or \link[graphics]{filled.contour} (for fdata2d class).}
 %\item{y}{ \code{fdata} class object with (fdataori object in depth functions and xx object in mdepth functions).} 
 %\item{dep}{ Depth of each curve of x w.r.t. y.}
 \item{trim}{ The alpha of the trimming.}
%\item{name}{ Name.}
\item{ levgray}{ A vector of desired gray levels between 0 and 1; zero indicates "black" and one indicates "white".}
}
%\details{  Plot \code{fdata} object.}
\author{
Manuel Febrero Bande and Manuel Oviedo de la Fuente <manuel.oviedo@usc.es>
}
\seealso{
See Also as \code{\link{fdata}} 
}

\examples{
\dontrun{

# example for fdata class of 1 dimension (curve)
a1<-seq(0,1,by=.01)
a2=rnorm(length(a1),sd=0.2)
f1<-(sin(2*pi*a1))+rnorm(length(a1),sd=0.2)
nc<-10
np<-length(f1)
tt=seq(0,1,len=101)
mdata<-matrix(NA,ncol=np,nrow=nc)
for (i in 1:nc) mdata[i,]<- (sin(2*pi*a1))+rnorm(length(a1),sd=0.2)
fdataobj<-fdata(mdata,tt)
res=plot.fdata(fdataobj,type="l",col=gray(1:nrow(mdata)/nrow(mdata)))
lines(func.mean(fdataobj),col=3,lwd=2) #original curve

# example for fdata2d class of 2 dimension (surface)
t1 <- seq(0, 1, length= 51)
t2 <- seq(0, 1, length= 31)
z<-array(NA,dim=c(4,51,31))
for (i in 1:4) z[i,,] <- outer(t1, t2, function(a, b) (i*a)*(b)^i)
z.fdata<-fdata(z,list(t1,t2))
plot(z.fdata,time=2)
plot(z.fdata,mfrow=c(2,2),type="persp",theta=30)
}
}

\keyword{hplot} 