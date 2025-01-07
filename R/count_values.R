#'Count Values
#'
#' @description
#' This function sums up the values of all elements in a card class in a list
#'
#'
#' @param cards an list of elements that inherits from the card class. Card class elements can be created from the \code{"create_deck"} function
#'
#' @return Returns the total value of all the cards provided in the function call.
#'
#' @export
#' @author Louis Thomas
#' @author Aoife Steenson
#' @author Jack Wiersma
#'
#' @seealso \code{\link{create_deck}}
#'
#' @examples
#'shuffled_deck <- create_deck()
#'cards <- list(draw_card(1, shuffled_deck), draw_card(2, shuffled_deck))
#'count_values(cards)
#'
count_values <- function(cards)
{

  #Error handling
  if (!is.list(cards) || any(sapply(cards, function(card) !inherits(card, "card")))) {
    stop("Input must be a list of card objects")
  }

  value <- 0
  for(i in 1:length(cards))
  {
    if(any(is.na(cards[[i]]))) {
      warn_msg <- paste0("NA's found in index: ", as.character(i),", of cards")
      warning(warn_msg)
    }

    faceValue <- cards[[i]]$face

    if(!is.na(faceValue)){
      if(faceValue == "king" | faceValue == "queen" | faceValue == "jack")
      {
        faceValue = 10
      }
      else if(faceValue == "ace")
      {
        faceValue = 11
      }
      else if(faceValue %in% as.character(c(1:10)))
      {
        faceValue = as.numeric(faceValue)
      }
      else{
        warning("faceValue is not a possible value")
        faceValue <- 0
      }
    } else {faceValue <- 0}

      value <- value + faceValue
  }

  faceValues <- sapply(cards, function(card) as.character(card$face))

  if(value > 21 & any(faceValues == "ace"))
  {
    value <- value - 10
  }

  return(value)
}

