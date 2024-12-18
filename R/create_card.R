create_card <- function(face = c(1:13), suit = c("spade", "heart", "club", "diamond")) {
  sample_data <- list()

  face <- as.vector(as.character(face))
  face <- switch(face[1], "1"="ace", "11"="jack", "12"="queen", "13"="king", face)
  card <- structure(list(suit=suit[1], face=face[1]), class="card")

  return(card)
}
