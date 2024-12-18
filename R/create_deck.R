#' Creating n decks of 52 playing cards
#'
#' @description
#' create_deck creates n amount of decks (where n defaults to 1) of 52 playing cards. This function is used in the \code{"blackjack"} function to
#' created the deck used. Once the deck(s) are created cards from the deck(s) can be drawn using the \code{"draw_card"} function. The card can then
#' be printed using the \code{"print"} function that has been design for the card class.
#'
#'
#' @param n the number of decks of playing cards to be created
#'
#' @author Louis Thomas
#' @author Aoife Steenson
#' @author Jack Wiersma
#'
#' @return returns n amount of decks
#' @export
#'
#' @seealso \code{\link{create_deck}, \link{draw_card}, \link{blackjack}}
#'
#' @examples
#' shuffled_deck <- sample(create_deck())
create_deck <- function(n = 1) {

  face_init <- as.character(c(1:13))
  suit_init <- c("spade", "heart", "club", "diamond")
  card <- list(suit=suit_init[1], face = face_init[1], class = "card")
  sample_data <- list()

  for(i in 1:n) {
    for(j in 1:4) {
      for(k in 1:13){
        suit <- suit_init[j]
        face <- face_init[k]
        face <- switch(face, "1"="ace", "11"="jack", "12"="queen", "13"="king", face)
        card <- structure(list(suit=suit, face=face), class="card")
        sample_data[[52*(i-1) + (13*(j-1) + k)]] <- card
        # Each 52th
      }
    }
  }
  return(sample_data)

}
