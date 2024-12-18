library(BlackjackR)

test_that("create decks produces valid decks", {
  expect_equal(length(create_deck()), 52)
  expect_equal(length(create_deck(3)), 156)
})
