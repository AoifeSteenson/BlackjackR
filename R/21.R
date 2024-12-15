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

draw_card <- function(card_index, shuffled_deck) {
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
  timer <- 1

  shuffled_deck <- sample(create_deck())
  #shuffled_deck <- load_data()
  #card_index <- 0
  player <- list(draw_card(timer, shuffled_deck))
  timer <- timer + 1
  player[[2]] <- draw_card(timer, shuffled_deck)
  timer <- timer+1

  dealer <- list(draw_card(timer, shuffled_deck))
  timer <- timer+1
  dealer[[2]] <- draw_card(timer, shuffled_deck)
  timer <- timer+1

  while(TRUE)
  {
    print("Your Hand")
    print(player)
    print("Total Value")
    print(countValues(player))

    print("Dealer's hand")
    print(dealer)

    if(countValues(dealer) < 17)
    {
      dealer <- append(dealer, list(draw_card(timer, shuffled_deck)))
      timer <- timer + 1

      print("The dealer hits")

      value <- countValues(dealer)
      if(value > 21)
      {
        print(paste("Dealers value: ", value))
        print("The dealer has gone Bust, you win. Congratulations")
        break

      }
    }

    var = readline(prompt = "Hit or Stick : ")

    if(var == "Hit" || var == "hit")
    {
      newCard <- list(draw_card(timer, shuffled_deck))
      player <- append(player, newCard)
      timer <- timer + 1
      print("New Card")
      print(newCard)
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
      else if(playerValue > dealerValue)
      {
        print(paste("Your value: ", playerValue))
        print(paste("Dealers value: ", dealerValue))
        print("Congratulations you have won!!")
        break
      }
      else if(playerValue < dealerValue)
      {
        print(paste("Your value: ", playerValue))
        print(paste("Dealers value: ", dealerValue))
        print("House wins, try again next time")
        break
      }
      else
      {
        print(paste("Your value: ", playerValue))
        print(paste("Dealers value: ", dealerValue))
        print("It's a draw, no one wins. Try again next time")
        break
      }
    }
    else
    {
      print("You are talking gibberish")
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

