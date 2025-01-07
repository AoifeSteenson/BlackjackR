#' Title
#'
#' @description
#'  This function creates a card specified by the user. If nothing is specified it can generate a random card
#'
#' @param face an argument from 1 to 13 about what face you want your card to be.
#'  The changing of the value to the character, i.e. 1 to Ace, 11 to Jack, etc. Are done in the function.
#'  If an out of bounds number is inputted it will default to an Ace
#' @param suit an argument for the type of suits: "spade", "heart", "club", "diamond".
#'  If wrong face is inputted it will default to "spade"
#'
#' @return object of class card
#' @export
#'
#'
#' @examples
#' # A wrong input for the create card function:
#' create_card(22, "wrong-word")
#'
#' # Think of a card? Were you thinking of a:
#' create_card(9, "heart")
#'
#' @seealso \code{\link{create_deck}}
#'
#' @author Louis Thomas
#' @author Aoife Steenson
#' @author Jack Wiersma
create_card <- function(face = round(runif(1, 1, 13)),
                        suit = c("spade", "heart", "club", "diamond")[runif(1,1,4)]) {

  if((face >= 14) || (face < 1)) {
    warning("Suit out of bounds, changing to ace")
    face <- 1
  }
  suit <- tolower(suit)
  if(suit %in% c("spade", "heart", "club", "diamond") == FALSE){
    warning("Not in the suit options, changing to spade")
    suit <- "spade"
  }

  face <- as.vector(as.character(face))
  face <- switch(face[1], "1"="ace", "11"="jack", "12"="queen", "13"="king", face)
  card <- structure(list(suit=suit[1], face=face[1]), class="card")

  return(card)
}

