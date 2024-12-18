library("BlackjackR")

test_that("Count values correctly sums up the value of cards", {
  expect_equal(count_values(list(create_card(8, "diamond"), create_card(9, "heart"))), 17)
  expect_type(count_values(list(create_card(8, "diamond"), create_card(9, "heart"))), "double")
  expect_error(count_values(c(create_card(8, "diamond"), create_card(9, "heart"))))
})
