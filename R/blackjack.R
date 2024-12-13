#' Blackjack
#'
#' @description
#' This function allows the user to play blackjack (21) through the console. Once the blackjack() function is called the user/player will be given two cards.
#' Based on the cards drawn the player can chose to Hit or Stick. Chosing Hit will give the player another card and the choice to Hit or Stick again. Should
#' the player chose Stick, the player's and dealer's cards will the summed up and compared to find the winner of the game. Once the game is over the player
#' is given the chose to play again.
#'
#'@export
#'
#' @examples
#' blackjack()
#'
blackjack <- function()
{
  timer <- 1

  shuffled_deck <- sample(create_deck())
  #shuffled_deck <- load_data()
  card_index <- 0
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

    var = readline(prompt = "Hit or Stick : ")

    if(var == "Hit" || var == "hit")
    {
      player <- append(player, list(draw_card(timer, shuffled_deck)))
        timer <- timer + 1
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
      dealer <- append(dealer, list(draw_card(timer, shuffled_deck)))
        timer <- timer + 1
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
