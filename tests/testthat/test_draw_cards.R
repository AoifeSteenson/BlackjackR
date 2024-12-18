library(BlackjackR)

test_that("draw cards works as expected", {
  expect_error(draw_card(67, sample(create_deck())))
  expect_s3_class(draw_card(2, sample(create_deck())), "card")
})
