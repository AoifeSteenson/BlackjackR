#' Printing ASCII art of each card
#'
#' Prints cards using ascii art
#'
#' @param x of class card this can be outputted from the \code{"create_deck"}
#' @param ... further arguments passed to or from other methods
#'
#' @return Return Nothing
#' @export
#'
#' @author Louis Thomas
#' @author Aoife Steenson
#' @author Jack Wiersma
#'
#' @seealso \code{\link{create_deck}}
#'
#' @examples
#' deck <- create_deck()
#' print(deck[[1]])
#'
print.card <- function(x, ...) {

  if(inherits(x, "card")){

    if(is.na(x$suit) | is.na(x$face)) {warning("NA's found in unprinted cards")}
    else {

    test_suit <- switch(x$suit,
                        "spade" = "    _    \n      ( ) \n       |",
                        "heart" = "  ( V ) \n      \\ / ",
                        "club" = "   ( ) \n     (_x_)",
                        "diamond" = "    /\\ \n       \\/",
                        x$suit)
    face <- switch(x$face, "queen" = " Q ", "king" = " K ",
                   "jack" = " J " , "ace" = " A ", "10" = " 10", paste0(" ", x$face," "))
    cat("",face, "of", x$suit, "
  # # # # # #
  ",test_suit,"
  # # # # # #
  # #",face,"# #
  # # # # # #
  ")
    }
  }
}
