
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BlackjackR

### Written by Aoife Steenson, Jack Wiersma and Louis Thomas

<!-- badges: start -->
<!-- badges: end -->

## Description

**BlackjackR** Simulates a game of blackjack through the console to
allow for user input. The game is simulated by creating a deck of
shuffled cards and drawing cards for both the player and the dealer. The
player can then use the console to Hit or Stick, based on their choice
the player will either receive another card (and given the choice to Hit
or Stick again, and so on) or be given the outcome of the game. 6
functions are provided in the package.

1.  `blackjack()`: Emulates a game of blackjack in the console. The game
    can be simulated or can take in user input.

2.  `count_values()`: sums up the value of all cards in the list passed
    in

3.  `create_card()`: allows the user to create a specific card, can also
    be used to generate a random card if the user provides no specific
    input

4.  `create_deck()`: creates however many decks of cards specified by
    the user (default is 1 deck). Each deck is a standard playing deck,
    13 cards in each suit, no duplicate cards.

5.  `draw_card()`: draws card at the specified index from the specified
    deck.

6.  `print.card()`: extension of the generic print function for the card
    class. Cards are printed using ASCII art to replicate the look of
    real playing cards.

## Installation

You can install the development version of BlackjackR from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("AoifeSteenson/BlackjackR")
```

## Example

This is a basic example which shows you how to run a simulated game of
blackjack

``` r
library(BlackjackR)

blackjack(sim = TRUE)
#> [1] "Your Hand"
#> [[1]]
#>   3  of heart 
#>   # # # # # #
#>      ( V ) 
#>       \ /  
#>   # # # # # #
#>   # #  3  # #
#>   # # # # # #
#>   
#> [[2]]
#>   5  of heart 
#>   # # # # # #
#>      ( V ) 
#>       \ /  
#>   # # # # # #
#>   # #  5  # #
#>   # # # # # #
#>   
#> [1] "Total Value"
#> [1] 8
#> [1] "Dealer's hand"
#> [[1]]
#>   10 of diamond 
#>   # # # # # #
#>        /\ 
#>        \/ 
#>   # # # # # #
#>   # #  10 # #
#>   # # # # # #
#>   
#> [[2]]
#>   3  of spade 
#>   # # # # # #
#>        _    
#>       ( ) 
#>        | 
#>   # # # # # #
#>   # #  3  # #
#>   # # # # # #
#>   
#> [1] "The dealer hits"
#> [1] "New Card"
#> [[1]]
#>   8  of heart 
#>   # # # # # #
#>      ( V ) 
#>       \ /  
#>   # # # # # #
#>   # #  8  # #
#>   # # # # # #
#>   
#> [1] "Your Hand"
#> [[1]]
#>   3  of heart 
#>   # # # # # #
#>      ( V ) 
#>       \ /  
#>   # # # # # #
#>   # #  3  # #
#>   # # # # # #
#>   
#> [[2]]
#>   5  of heart 
#>   # # # # # #
#>      ( V ) 
#>       \ /  
#>   # # # # # #
#>   # #  5  # #
#>   # # # # # #
#>   
#> [[3]]
#>   8  of heart 
#>   # # # # # #
#>      ( V ) 
#>       \ /  
#>   # # # # # #
#>   # #  8  # #
#>   # # # # # #
#>   
#> [1] "Total Value"
#> [1] 16
#> [1] "Dealer's hand"
#> [[1]]
#>   10 of diamond 
#>   # # # # # #
#>        /\ 
#>        \/ 
#>   # # # # # #
#>   # #  10 # #
#>   # # # # # #
#>   
#> [[2]]
#>   3  of spade 
#>   # # # # # #
#>        _    
#>       ( ) 
#>        | 
#>   # # # # # #
#>   # #  3  # #
#>   # # # # # #
#>   
#> [[3]]
#>   2  of diamond 
#>   # # # # # #
#>        /\ 
#>        \/ 
#>   # # # # # #
#>   # #  2  # #
#>   # # # # # #
#>   
#> [1] "The dealer hits"
#> [1] "New Card"
#> [[1]]
#>   7  of heart 
#>   # # # # # #
#>      ( V ) 
#>       \ /  
#>   # # # # # #
#>   # #  7  # #
#>   # # # # # #
#>   
#> [1] 23
#> [1] "You have gone Bust"
#> [1] "Goodbye"
```

Another example showing how to create a card

``` r
create_card(9, "heart")
#>   9  of heart 
#>   # # # # # #
#>      ( V ) 
#>       \ /  
#>   # # # # # #
#>   # #  9  # #
#>   # # # # # #
#> 
```

A more thorough introduction with more examples and use cases for the
methods is provided in the `BlackjackR` vignette.
