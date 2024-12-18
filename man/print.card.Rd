% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print_card.R
\name{print.card}
\alias{print.card}
\title{Printing ASCII art of each card}
\usage{
\method{print}{card}(x, ...)
}
\arguments{
\item{x}{of class card this can be outputted from the \code{"create_deck"}}

\item{...}{further arguments passed to or from other methods}
}
\value{
Return Nothing
}
\description{
Prints cards using ascii art
}
\examples{
deck <- create_deck()
print(deck[[1]])

}
\seealso{
\code{\link{create_deck}}
}
\author{
Louis Thomas

Aoife Steenson

Jack Wiersma
}
