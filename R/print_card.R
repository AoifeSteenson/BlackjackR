print.card <- function(object) {
  if(class(object) == "card"){
    suit <- switch(object$suit, "spade" = "♠", "heart" = "♥", "club" = "♣", "diamond" = "♦", object$suit)
    face <- switch(object$face, "queen" = "👑", object$face)
    cat("
  # # #
  #",suit,"#
  #",face,"#
  # # #
  ")

  }
}
