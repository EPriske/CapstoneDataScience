## Peer-graded Assignment: Final Project Submission
## Capstone
## Erick Priske

# First we load all required libraries
library(shiny)
library(stringr)
library(tm)

# We start by loading the ngram data. We load the most important ones: Bigrams,
# Trigrams and Quadgrams.
bi <- readRDS("bigram.RData")
tri <- readRDS("trigram.RData")
quad <- readRDS("quadgram.RData")

# We load all the words from the ngrams into variables that we can keep using. 
# We give a surname so that it is easier to type.

# Bigrams
names(bi)[names(bi) == 'word1'] <- 'w1'
names(bi)[names(bi) == 'word2'] <- 'w2'

# Trigrams
names(tri)[names(tri) == 'word1'] <- 'w1'
names(tri)[names(tri) == 'word2'] <- 'w2'
names(tri)[names(tri) == 'word3'] <- 'w3'

# Quadgrams
names(quad)[names(quad) == 'word1'] <- 'w1'
names(quad)[names(quad) == 'word2'] <- 'w2'
names(quad)[names(quad) == 'word3'] <- 'w3'
names(quad)[names(quad) == 'word4'] <- 'w4'

# When we open the app, this will clean the message, and leave it at null.
message <- "" 

## Now we will do the Function that predicts the next word that will be type.
predictWord <- function(prediction) {
  word_add <- stripWhitespace(removeNumbers(removePunctuation(tolower(prediction),preserve_intra_word_dashes = TRUE)))
  prediction <- strsplit(word_add, " ")[[1]]
  n <- length(prediction)

  # We check which ngram will be used. Whatever the ngram is, then it will be send
  # to that specific ngram function.
  if (n == 1) {prediction <- as.character(tail(prediction,1)); functionBigram(prediction)}
  else if (n == 2) {prediction <- as.character(tail(prediction,2)); functionTrigram(prediction)}
  else if (n >= 3) {prediction <- as.character(tail(prediction,3)); functionQuadgram(prediction)}
}

# Bigram Function
functionBigram <- function(prediction) {
  if (identical(character(0),as.character(head(bi[bi$w1 == prediction[1], 2], 1)))) {
    message<<-"Word not found, 'It' will be used as prediction" 
    as.character(head("it",1))
  }
  else {
    message <<- "Predicting using Bigram Function"
    as.character(head(bi[bi$w1 == prediction[1],2], 1))
    # testing print of bi$w1, prediction[1]
  }
}

# Trigram Function
functionTrigram <- function(prediction) {
  if (identical(character(0),as.character(head(tri[tri$w1 == prediction[1]
                                                  & tri$w2 == prediction[2], 3], 1)))) {
    as.character(predictWord(prediction[2]))
  }
  else {
    message<<- "Predicting using Trigram Function"
    as.character(head(tri[tri$w1 == prediction[1]
                         & tri$w2 == prediction[2], 3], 1))
  }
}

# Quadgram Function
functionQuadgram <- function(prediction) {
  if (identical(character(0),as.character(head(quad[quad$w1 == prediction[1]
                                                  & quad$w2 == prediction[2]
                                                  & quad$w3 == prediction[3], 4], 1)))) {
    as.character(predictWord(paste(prediction[2],prediction[3],sep=" ")))
  }
  else {
    message <<- "Predicting using Quadgram Function"
    as.character(head(quad[quad$w1 == prediction[1] 
                         & quad$w2 == prediction[2]
                         & quad$w3 == prediction[3], 4], 1))
  }       
}

# ShineServer App
shinyServer(function(input, output) {
  output$prediction <- renderPrint({
    result <- predictWord(input$inputText)
    output$sentence2 <- renderText({message})
    result
  });
  output$sentence1 <- renderText({
    input$inputText});
}
)