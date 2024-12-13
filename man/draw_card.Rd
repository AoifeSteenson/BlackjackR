% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/draw_card.R
\name{draw_card}
\alias{draw_card}
\title{Drawing Cards from a shuffled deck}
\usage{
draw_card(card_index, shuffled_deck)
}
\arguments{
\item{card_index}{index passed in to return the card at that position in the shuffled deck. This is used to ensure that no one gets duplicated cards.}

\item{shuffled_deck}{a deck of  shuffled card, created from the \code{"create_deck"} function}
}
\value{
returns the card from the shuffled_deck passed in at the index given
}
\description{
This function draws a card from the shuffled deck passed in from the function call. It used the card_index, which is also passed.
The card returns is the card at position card_index in the shuffled_deck. The card_index is used to ensure than no duplicate cards are
using during the blackjack game.
}
\examples{
shuffled_deck <- sample(create_deck())
card_index <- 23
draw_card(23, shuffled_deck)
}
\seealso{
\code{\link{create_deck}}
}
\author{
Louis Thomas

Aoife Steenson

Jack Wiersma
}
