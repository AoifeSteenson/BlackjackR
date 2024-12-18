#' Drawing Cards from a shuffled deck
#'
#' @description
#' This function draws a card from the shuffled deck passed in from the function call. It used the card_index, which is also passed.
#' The card returns is the card at position card_index in the shuffled_deck. The card_index is used to ensure than no duplicate cards are
#' using during the blackjack game.
#'
#'
#' @param card_index index passed in to return the card at that position in the shuffled deck. This is used to ensure that no one gets duplicated cards.
#' @param shuffled_deck a deck of  shuffled card, created from the \code{"create_deck"} function
#'
#' @return returns the card from the shuffled_deck passed in at the index given
#' @export
#'
#' @author Louis Thomas
#' @author Aoife Steenson
#' @author Jack Wiersma
#'
#' @seealso \code{\link{create_deck}}
#'
#' @examples
#' shuffled_deck <- sample(create_deck())
#' card_index <- 23
#' draw_card(23, shuffled_deck)
draw_card <- function(card_index, shuffled_deck) {
  return(shuffled_deck[[card_index]])
}
