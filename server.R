library(reshape2)
library(tidyverse)
library(magrittr)
library(saves)
library(shiny)
library(googleVis)
library(webshot)

load("label.RData")

options(shiny.sanitize.errors = FALSE)

shinyServer(function(input, output, session) {
  for (file in list.files("server")) {
    source(file.path("server", file), local = TRUE)
  }
  # Automatically bookmark every time an input changes
  observe({
    reactiveValuesToList(input)
    session$doBookmark()
  })
  # Update the query string
  onBookmarked(updateQueryString)
})


