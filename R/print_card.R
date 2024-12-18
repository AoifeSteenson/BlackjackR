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
  if(class(x) == "card"){
    test <- " "
    suit <- switch(x$suit, "spade" = " ♠ ", "heart" = " ♥ ", "club" = " ♣ ", "diamond" = " ♦ ", x$suit)
    face <- switch(x$face, "queen" = " Q ", "king" = " K ",
                   "jack" = " J " , "ace" = " A ", "10" = " 10", paste0(" ", x$face," "))
    cat("
  # # # #
  #",suit,"#
  #",face,"#
  # # # #
  ")
  }
}
