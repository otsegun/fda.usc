\name{rp.flm.test}
\alias{rp.flm.test}

\title{Goodness-of-fit test for the Functional Linear Model with scalar response using random projections}
\description{
  The function \code{rp.flm.test} tests the composite null hypothesis of a Functional Linear Model with scalar response (FLM),
  \deqn{H_0:\,Y=\big<X,\beta\big>+\epsilon,}{H_0: Y=<X,\beta>+\epsilon,}
  versus a general alternative. If \eqn{\beta=\beta_0}{\beta=\beta_0} is provided, then the simple hypothesis \eqn{H_0:\,Y=\big<X,\beta_0\big>+\epsilon}{H_0: Y=<X,\beta_0>+\epsilon} is tested.
  The way of testing the null hypothesis is via a Projected Cramer-von Mises test (see Details). 
}

\usage{
%flm.test (X.fdata, Y, beta0.fdata = NULL, B = 5000, 
%          est.method = "pls", p = NULL, type.basis = "bspline", 
%          verbose = TRUE,      plot.it = TRUE, B.plot = 100,
%          G = 200,\dots)
%          # Statistic for testing the FLM using random projections
rp.flm.test (X.fdata, Y,beta0.fdata=NULL, est.method="pc",
             p=NULL, type.basis="bspline", B=5000, n.proj=50,
             verbose = TRUE, F.code=TRUE, sigma="vexponential",
             par.list=list(theta=diff(range(X.fdata$argvals))/20),
             same.rwild=FALSE,...)
%rp.flm.statistic (proj.X,residuals,proj.X.ord=NULL,
                   %verbose=FALSE,F.code=TRUE)          
                   
}
%# Test for the FLM using random projections

\arguments{
  \item{X.fdata}{Functional covariate for the FLM. The object must be in the class \code{\link{fdata}}.}
  \item{Y}{Scalar response for the FLM. Must be a vector with the same number of elements as functions are in \code{X.fdata}.}
  \item{beta0.fdata}{Functional parameter for the simple null hypothesis, in the \code{\link{fdata}} class. Recall that the \code{argvals} and \code{rangeval}
  arguments of \code{beta0.fdata} must be the same of \code{X.fdata}. A possibility to do this is to consider, for example for \eqn{\beta_0=0}{\beta_0=0} (the simple null hypothesis of no interaction),\if{latex}{\cr}
   \code{beta0.fdata=fdata(mdata=rep(0,length(X.fdata$argvals)),}\if{latex}{\cr}\code{argvals=X.fdata$argvals,rangeval=X.fdata$rangeval)}.\if{latex}{\cr}
  If \code{beta0.fdata=NULL} (default), the function will test for the composite null hypothesis.
  }
  \item{est.method}{Estimation method for the unknown parameter \eqn{\beta}{\beta}, only used in the composite case. Mainly, there are two options: specify the number of basis elements for the estimated \eqn{\beta}{\beta} by \code{p} or optimally select \code{p} by a data-driven criteria (see Details section for discussion). Then, it must be one of the following methods:
	\itemize{
		\item \code{"pc"} If \code{p}, the number of basis elements, is given, then \eqn{\beta}{\beta} is estimated by \code{\link{fregre.pc}}. Otherwise, an optimum \code{p} is chosen using \code{\link{fregre.pc.cv}} and the \code{"SICc"} criteria.
		\item \code{"pls"} If \code{p} is given, \eqn{\beta}{\beta} is estimated by \code{\link{fregre.pls}}. Otherwise, an optimum \code{p} is chosen using \code{\link{fregre.pls.cv}} and the \code{"SICc"} criteria. 
		This is the default argument as it has been checked empirically that provides a good balance between the performance of the test and the estimation of \eqn{\beta}{\beta}.
		\item \code{"basis"} If \code{p} is given, \eqn{\beta}{\beta} is estimated by \code{\link{fregre.basis}}. Otherwise, an optimum \code{p} is chosen using \code{\link{fregre.basis.cv}} and the \code{"GCV.S"} criteria. In these functions, the same basis for the arguments \code{basis.x} and \code{basis.b} is considered.
		The type of basis used will be the given by the argument \code{type.basis} and must be one of the class of \code{create.basis}. Further arguments passed to \code{\link{create.basis}} (not \code{rangeval} that is taken as the \code{rangeval} of \code{X.fdata}), can be passed throughout \code{\dots} .
	}
	}
\item{p}{Number of elements of the basis considered. If it is not given, an optimal \code{p} will be chosen using a specific criteria (see \code{est.method} and \code{type.basis} arguments). }
  \item{type.basis}{Type of basis used to represent the functional process. Depending on the hypothesis it will have a different interpretation:
  \itemize{
		\item Simple hypothesis. One of these options:
			\itemize{
				\item \code{"bspline"} If \code{p} is given, the functional process is expressed in a basis of \code{p} B-splines. If not, an optimal \code{p} will be chosen by \code{\link{min.basis}}, using the \code{"GCV.S"} criteria.
				\item \code{"fourier"} If \code{p} is given, the functional process is expressed in a basis of \code{p} fourier functions. If not, an optimal \code{p} will be chosen by \code{\link{min.basis}}, using the \code{"GCV.S"} criteria.
				\item \code{"pc"} \code{p} must be given. Expresses the functional process in a basis of \code{p} PC.
				\item \code{"pls"} \code{p} must be given. Expresses the functional process in a basis of \code{p} PLS.
			}
			Although other of the basis supported by \code{\link{create.basis}} are possible too, \code{"bspline"} and \code{"fourier"} are recommended. Other basis may cause incompatibilities.
		\item Composite hypothesis. This argument is only used when \if{latex}{\cr}\code{est.method="basis"} and, in this case, claims for the type of basis used in the basis estimation method of the functional parameter. Again, basis
			\code{"bspline"} and \code{"fourier"} are recommended, as other basis may cause incompatibilities.

	}
	}
\item{B}{Number of bootstrap replicates to calibrate the distribution of the test statistic. \code{B=5000} replicates are the recommended for carry out the test, although for exploratory analysis (\bold{not inferential}), an acceptable less time-consuming option is \code{B=500}.}
\item{n.proj}{Number of projections (it can be a vector).}
\item{verbose}{Either to show or not information about computing progress.}
\item{F.code}{ \code{logical}, Check if the fortran dll is loaded}  
\item{sigma}{ Argument passed to \code{\link{rproc2fdata}} }
\item{par.list}{ Argument passed to \code{\link{rproc2fdata}} }
\item{same.rwild}{\code{logical}, if \code{TRUE} the function generates the same Wild bootstrap residuals for all projections.}
\item{\dots}{Further arguments passed to \code{\link{create.basis}}.}
}

\details{
 The Functional Linear Model with scalar response (FLM), is defined as \eqn{Y=\big<X,\beta\big>+\epsilon}{Y=<X,\beta>+\epsilon},
 for a functional process \eqn{X}{X} such that \eqn{E[X(t)]=0}{E[X(t)]=0}, \eqn{E[X(t)\epsilon]=0}{E[X(t)\epsilon]=0} for all \eqn{t}{t} and for a scalar variable \eqn{Y}{Y} such that \eqn{E[Y]=0}{E[Y]=0}.
 Then, the test assumes that \code{Y} and \code{X.fdata} are \bold{centred} and will automatically center them. So, bear in mind that when you apply the test for \code{Y} and \code{X.fdata}, actually,
 you are applying it to \code{Y-mean(Y)} and \code{fdata.cen(X.fdata)$Xcen}.

 The test statistic corresponds to the Cramer-von Mises norm of the \emph{Residual Marked empirical Process based on Projections} \eqn{R_n(u,\gamma)}{R_n(u,\gamma)} defined in Garcia-Portugues \emph{et al.} (2014). 
 The expression of this process in a \eqn{p}{p}-truncated basis of the space \eqn{L^2[0,T]}{L^2[0,T]} leads to the \eqn{p}{p}-multivariate process \eqn{R_{n,p}\big(u,\gamma^{(p)}\big)}{R_{n,p}(u,\gamma^{(p)})}, whose Cramer-von Mises norm 
 is easily computed.
 
 The choice of an appropriate \eqn{p}{p} to represent the functional process \eqn{X}{X}, in case that is not provided, is done via the estimation of \eqn{\beta}{\beta} for the composite hypothesis. For the simple hypothesis, 
as no estimation of \eqn{\beta}{\beta} is done, the choice of \eqn{p}{p} depends only on the functional process \eqn{X}{X}. As the result of the test may change for different \eqn{p}{p}'s, we recommend to use an automatic criterion to select \eqn{p}{p} instead of provide a fixed one.
The distribution of the test statistic is approximated by a wild bootstrap on the residuals, using the \emph{golden section bootstrap}.
 
Finally, the graph shown if \code{plot.it=TRUE} represents the observed trajectory, and the bootstrap trajectories under the null, of the process RMPP \emph{integrated on the projections}:
 \deqn{R_n(u)\approx\frac{1}{G}\sum_{g=1}^G R_n(u,\gamma_g),}{R_n(u) \approx \frac{1}{G} \sum_{g=1}^G R_n(u,\gamma_g),}
 where \eqn{\gamma_g}{\gamma_g} are simulated as Gaussians processes. This gives a graphical idea of how \emph{distant} is the observed trajectory from the null hypothesis.
 
%For further details see Garcia-Portugues \emph{et al.} (2014).

}

\value{
% result=structure(list(statistics=rp.stat$statistic,boot.statistics=rp.stat.star,p.value=rp.pvalue,proj.p.values=pval,method=meth,B=B,
%  						n.proj=vec.nproj,type.basis=type.basis,beta.est=beta.est,p=p.opt,data.name="Y=<X,b>+e"))

  An object with class \code{"htest"} whose underlying structure is a list containing the following components:
  \item{statistic}{The value of the test statistic.}
  \item{boot.statistics}{A vector of length \code{B} with the values of the bootstrap test statistics.}
  \item{p.value}{The p-value of the test.}
  \item{proj.p.values}{}
  \item{method}{The method used.}
  \item{B}{The number of bootstrap replicates used.}
  \item{n.proj}{The number of projections used}
  \item{type.basis}{The type of basis used.}
  \item{beta.est}{The estimated functional parameter \eqn{\beta}{\beta} in the composite hypothesis. For the simple hypothesis, the given \code{beta0.fdata}.}
  \item{p}{The number of basis elements passed or automatically chosen.}
  \item{data.name}{The character string "Y=<X,b>+e".}
}

%\references{
%Escanciano, J. C. (2006). A consistent diagnostic test for regression models using projections. Econometric Theory, 22, 1030-1051. \url{http://dx.doi.org/10.1017/S0266466606060506}

%Garcia-Portugues, E., Gonzalez-Manteiga, W. and Febrero-Bande, M. (2014). A goodness--of--fit test for the functional linear model with scalar response. Journal of Computational and Graphical Statistics, 23(3), 761-778. \url{http://dx.doi.org/10.1080/10618600.2013.812519}
%}
\note{No NA's are allowed neither in the functional covariate nor in the scalar response.}


\author{Eduardo Garcia-Portugues. Please, report bugs and suggestions to \if{latex}{\cr}\email{eduardo.garcia@usc.es}}

\seealso{\code{\link{flm.test}}, \code{\link{rwild}}, 
\code{\link{fregre.pc}}, \code{\link{fregre.pls}},\if{latex}{\cr} \code{\link{fregre.basis}}, 
 \code{\link{fregre.pc.cv}}, \code{\link{fregre.pls.cv}},
 \code{\link{fregre.basis.cv}}, \code{\link{min.basis}}, \if{latex}{\cr}
 \code{\link{create.basis}}}

\examples{

# Simulated example #

X=rproc2fdata(n=100,t=seq(0,1,l=101),sigma="OU")
beta0=fdata(mdata=cos(2*pi*seq(0,1,l=101))-(seq(0,1,l=101)-0.5)^2+
rnorm(101,sd=0.05),argvals=seq(0,1,l=101),rangeval=c(0,1))
Y=inprod.fdata(X,beta0)+rnorm(100,sd=0.1)

dev.new(width=21,height=7)
par(mfrow=c(1,3))
plot(X,main="X")
plot(beta0,main="beta0")
plot(density(Y),main="Density of Y",xlab="Y",ylab="Density")
rug(Y)

\dontrun{
# Composite hypothesis: do not reject FLM
res.rp=rp.flm.test(X,Y,B=50,n.proj=100)
res.pcvm=flm.test(X,Y,B=50,G=100)
res.rp
respcvm
}
}

\keyword{htest}
\keyword{models}
\keyword{regression}

