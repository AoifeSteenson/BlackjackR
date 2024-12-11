draw_card <- function() {
  card_index <<- card_index + 1
  return(shuffled_deck[[card_index]])
}
