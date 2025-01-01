test_that("query works", {
  expect_equal(substr(query("1.1.1.1"), 1, 15), "<!DOCTYPE html>")
})

test_that("error with invalid url", {
  expect_error(query("invalid_url"))
})

test_that("IPQuery text format", {
  expect_equal(IPQuery(), query("https://api.ipify.org/"))
  expect_equal(substr(IPQuery("self"), 1, 5), "{\"ip\"")
  expect_equal(substr(IPQuery(c("1.1.1.1")), 1, 14), "{\"ip\":\"1.1.1.1")
  expect_equal(length(IPQuery(c("1.1.1.1", "2.2.2.2"))), 2)
})

test_that("IPQuery yaml format", {
  expect_equal(substr(IPQuery(format = "yaml"), 1, 4), "ip: ")
  expect_equal(substr(IPQuery("self", format = "yaml"), 1, 4), "ip: ")
  expect_equal(substr(IPQuery(c("1.1.1.1"), format = "yaml"), 1, 11), "ip: 1.1.1.1")
  expect_equal(length(IPQuery(c("1.1.1.1", "2.2.2.2"), format = "yaml")), 2)
})

test_that("IPQuery json format", {
  expect_equal(substr(IPQuery(format = "json"), 1, 7), "{\"ip\":\"")
  expect_equal(substr(IPQuery("self", format = "json"), 1, 7), "{\"ip\":\"")
  expect_equal(substr(IPQuery("1.1.1.1", format = "json"), 1, 15), "{\"ip\":\"1.1.1.1\"")
  expect_equal(length(IPQuery(c("1.1.1.1", "2.2.2.2"), format = "json")), 2)
})

test_that("IPQuery xml format", {
  expect_equal(substr(IPQuery(format = "xml"), 1, 8), "<IPInfo>")
  expect_equal(substr(IPQuery("self", format = "xml"), 1, 12), "<IPInfo><ip>")
  expect_equal(substr(IPQuery(c("1.1.1.1"), format = "xml"), 1, 19), "<IPInfo><ip>1.1.1.1")
  expect_equal(length(IPQuery(c("1.1.1.1", "2.2.2.2"), format = "xml")), 2)
})
