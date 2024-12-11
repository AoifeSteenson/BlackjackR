count_values <- function(cards)
{
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
