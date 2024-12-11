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
