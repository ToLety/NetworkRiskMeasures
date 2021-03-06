% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matrix_estimation.R
\name{matrix_estimation}
\alias{matrix_estimation}
\alias{matrix_estimation}
\alias{max_ent}
\alias{matrix_estimation}
\alias{min_dens}
\title{Matrix Estimation}
\usage{
matrix_estimation(rowsums, colsums, method = c("me", "md"), ...,
  max.it = 1e+05, abs.tol = 0.001, verbose = TRUE)

max_ent(rowsums, colsums, max.it = 1e+05, abs.tol = 0.001, verbose = TRUE)

min_dens(rowsums, colsums, c = 1, lambda = 1, k = 100,
  alpha = 1/sum(rowsums), delta = 1/sum(rowsums), theta = 1,
  remove.prob = 0.01, max.it = 1e+05, abs.tol = 0.001, verbose = TRUE)
}
\arguments{
\item{rowsums}{a numeric vector with the row sums.}

\item{colsums}{a numeric vector with the column sums.}

\item{method}{the matrix estimation method. Choose \code{"me"} for 
maximum entropy or \code{"md"} for minimum density.}

\item{...}{further arguments passed to or from other methods.}

\item{max.it}{the maximum number of iterations.}

\item{abs.tol}{the desired accuracy.}

\item{verbose}{gives verbose output. Default is \code{TRUE}.}

\item{c}{the 'cost' an extra link for the minimum density estimation. 
See Anand et al. (2015).}

\item{lambda}{you should use \code{lamda} 
together with \code{k}. For the first \code{k} rounds of 
the algorithm, the function will alocate a fraction \code{lambda} of the total,
thus obtaining a "low density" solution, instead of a "minimum density" solution.
See Anand et al. (2015).}

\item{k}{you should use \code{lamda} 
together with \code{k}. For the first \code{k} rounds of 
the algorithm, the function will alocate a fraction \code{lambda} of the total,
thus obtaining a "low density" solution, instead of a "minimum density" solution.
See Anand et al. (2015).}

\item{alpha}{weights for the row sums deviations. See Anand et al. (2015).}

\item{delta}{weights for the column sums deviations. See Anand et al. (2015).}

\item{theta}{scaling parameter. 
Emphasizes the weight placed on finding solutions with similar characteristics 
to the prior matrix. See Anand et al. (2015).}

\item{remove.prob}{probability to randomly remove a link during the algorithm. See Anand et al. (2015).}
}
\value{
The functions return the estimated matrix.
}
\description{
Methods for estimating matrix entries from the marginals (row and column sums).

There are currently two methods implemented: Maximum Entropy (Upper 2004) and 
Minimum Density (Anand et al. 2015).

You may use the \code{matrix_estimation()} function, setting the desired \code{method}.
Or you may use directly the \code{max_ent()} function for maximum entropy estimation 
or the \code{min_dens()} function for minimum density estimation.
}
\examples{
# Example from Anand, Craig and Von Peter (2015, p.628)

# Liabilities
L <- c(a = 4, b = 5, c = 5, d = 0, e = 0, f = 2, g = 4)

# Assets
A <- c(a = 7, b = 5, c = 3, d = 1, e = 3, f = 0, g = 1)

# Maximum Entropy
ME <- matrix_estimation(A, L, method = "me")
ME <- round(ME, 2)

# Minimum Density
set.seed(192)
MD <- matrix_estimation(A, L, method = "md")

}
\references{
Upper, C. and A. Worm (2004). Estimating bilateral exposures in the german interbank market:
 Is there a danger of contagion? European Economic Review 48, 827-849.

 Anand, K., Craig, B. and G. von Peter (2015). Filling in the blanks:
 network structure and interbank contagion. 
 Quantitative Finance 15:4, 625-636.
}
