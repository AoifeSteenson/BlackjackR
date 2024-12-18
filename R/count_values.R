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
#'cards <- list(draw_card(), draw_card())
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
    faceValue <- cards[[i]]$face


    if(faceValue == "king" | faceValue == "queen" | faceValue == "jack")
    {
      faceValue = 10
    }
    else if(faceValue == "ace")
    {
      faceValue = 11
    }
    else
    {
      faceValue = as.numeric(faceValue)
    }

    value <- value + faceValue
  }

  faceValues <- sapply(cards, function(card) as.character(card$face))

  if(value > 21 & any(faceValues == "ace"))
  {
    value - 10
  }

  return(value)
}
