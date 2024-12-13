#To do

#Need to account for a draw
#In normal blackjack, no one wins in this case, and bets are returned

#dealer reveals second card

#Dealer hit if value is less than 17 and keeps hitting
#unitl the value is 17 or greater.

#Stress testing


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

set.seed(2131)
shuffled_deck <- sample(create_deck())
card_index <- 0

draw_card <- function() {
  card_index <<- card_index + 1
  return(shuffled_deck[[card_index]])
}

print.card <- function(object) {
  if(inherits(object, "card")){
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


countValues <- function(cards)
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

blackjack <- function()
{
  shuffled_deck <- create_deck()
  card_index <- 0
  player <- list(draw_card(), draw_card())
  dealer <- list(draw_card(), draw_card())

  while(TRUE)
  {
    print("Your Hand")
    print(player)
    print("Total Value")
    print(countValues(player))

    print("Dealer's hand")
    print(dealer)

    var = readline(prompt = "Hit or Stick : ")

    if(var == "Hit" || var == "hit")
    {
      player <- append(player, list(draw_card()))
      print(player)
      value <- countValues(player)
      if(value > 21)
      {
        print(value)
        print("You have gone Bust")
        break
      }
    }
    else if(var == "Stick" || var == "stick")
    {
      playerValue <- countValues(player)
      dealerValue <- countValues(dealer)
      if(playerValue > 21)
      {
        print(value)
        print("You have gone Bust")
        break
      }
      else if(playerValue > dealerValue) #Need to account for a draw
      {
        print(paste("Your value: ", playerValue))
        print(paste("Dealers value: ", dealerValue))
        print("Congardulations you have won!!")
        break
      }
      else
      {
        print(paste("Your value: ", playerValue))
        print(paste("Dealers value: ", dealerValue))
        print("House wins, try again next time")
        break
      }
    }
    else
    {
      print("You are talking gibberish")
    }

    #Code for dealer to hit based on house rules, probably needs to
    #be higher up
    if(countValues(dealer) < 17)
    {
      dealer <- append(dealer, list(draw_card()))
    }


  }

  var = readline(prompt = "Game over, Do you want to play again? (Yes/No)")

  if(var == "Yes" || var == "yes")
  {
    blackjack()
  }
  else
  {
    print("Goodbye")
  }


}

#blackjack()
