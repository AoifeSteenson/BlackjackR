#' Printing cards
#'
#' @description
#' Prints the card(s) passed in during the function call to the console. When the card is printed, it mimics the look of an actual card design.
#'
#'
#' @param object
#'
#' @return prints the cards object inputted to the console
#' @export
#'
#' @examples
#' shuffled_deck <- create_deck()
#' card <- draw_card()
#' print(card)
print(cards)
print.card <- function(object) {
  if(class(object) == "card"){
    test <- " "
    suit <- switch(object$suit, "spade" = " ♠ ", "heart" = " ♥ ", "club" = " ♣ ", "diamond" = " ♦ ", object$suit)
    face <- switch(object$face, "queen" = " Q ", "king" = " K ",
                   "jack" = " J " , "ace" = " A ", "10" = " 10", paste0(" ", object$face," "))
    cat("
  # # # #
  #",suit,"#
  #",face,"#
  # # # #
  ")
  }
}
