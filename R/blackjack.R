#' Blackjack
#'
#' @description
#' This function allows the user to play blackjack (21) through the console. Once the blackjack() function is called the user/player will be given two cards.
#' Based on the cards drawn the player can chose to Hit or Stick. Chosing Hit will give the player another card and the choice to Hit or Stick again. Should
#' the player chose Stick, the player's and dealer's cards will the summed up and compared to find the winner of the game. Once the game is over the player
#' is given the chose to play again.
#'
#' @param sim of class Boolean. This is done originally to fix a devtools infinite loop. But repurposed to run a simulation of a game.
#'
#' @return Return Nothing
#'
#'@export
#' @author Louis Thomas
#' @author Aoife Steenson
#' @author Jack Wiersma
#'
#' @examples
#' blackjack()
#'
blackjack <- function(sim = TRUE)
{
  timer <- 1

  shuffled_deck <- sample(create_deck())
  #shuffled_deck <- load_data()
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
    print(count_values(player))

    print("Dealer's hand")
    print(dealer)

    if(count_values(dealer) < 17)
    {
      dealer <- append(dealer, list(draw_card(timer, shuffled_deck)))
      timer <- timer + 1

      print("The dealer hits")

      value <- count_values(dealer)
      if(value > 21)
      {
        print(paste("Dealers value: ", value))
        print("The dealer has gone Bust, you win. Congratulations")
        break

      }
    }

    if(sim == TRUE){var = "h"}
    else {var = readline(prompt = "Hit(h) or Stick(s) : ")}

    if(tolower(var) == "hit" || tolower(var) == "h")
    {
      newCard <- list(draw_card(timer, shuffled_deck))
      player <- append(player, newCard)
      timer <- timer + 1
      print("New Card")
      print(newCard)
      value <- count_values(player)
      if(value > 21)
      {
        print(value)
        print("You have gone Bust")
        break
      }

    }
    else if(tolower(var) == "stick")
    {
      playerValue <- count_values(player)
      dealerValue <- count_values(dealer)
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

  if(sim == TRUE) {var = "n"}
  else {var = readline(prompt = "Game over, Do you want to play again? (Yes(y)/No(n))")}

  if(tolower(var) == "yes" || tolower(var) == "y")
  {
    blackjack()
  }
  else if(tolower(var) == "no" || tolower(var) == "n")
  {
    print("Goodbye")
  }


}
