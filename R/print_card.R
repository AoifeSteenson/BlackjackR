#' Printing ASCII art of each card
#'
#' Prints cards using ascii art
#'
#' @param object of class card this can be outputted from the \code{"create_deck"}
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
