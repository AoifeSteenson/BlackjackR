library(BlackjackR)

test_that("create cards produces the correct cards", {
  expect_equal(create_card(face = 8, suit = "spade")$face, "8")
  expect_s3_class(draw_card(2, sample(create_deck())), "card")
  expect_warning(create_card(face = 8, suit = "spud"))
})
