create_card <- function(face = c(1:13), suit = c("spade", "heart", "club", "diamond")) {

  if(face >= 13 & face <= 1) {
    warning("Out of bounds exceptions")
    face <- 1
  }
  suit <- tolower(suit)
  if(suit %in% c("spade", "heart", "club", "diamond") == FALSE){
    warning("Not in the suit options")
    suit <- "spade"
  }

  face <- as.vector(as.character(face))
  face <- switch(face[1], "1"="ace", "11"="jack", "12"="queen", "13"="king", face)
  card <- structure(list(suit=suit[1], face=face[1]), class="card")

  return(card)
}
