## Peer-graded Assignment: Final Project Submission
## Capstone
## Erick Priske

library(shiny)
library(bslib)
library(markdown)

shinyUI(
  fluidPage(
    theme = bs_theme(version = 4, bootswatch = "darkly"),
    titlePanel("Peer-graded Assignment: Final Project Submission"),
    img(src = 'coursera-logo-white.png', height = 90, width = 90),
    img(src = 'swiftkey_logo.jpg', height = 90, width = 90),
    sidebarLayout(
      sidebarPanel(
        p("The app will use 'NLP' to predict the next word,
                 You can select our predicted word or keep writting a sentence, 
                 the model will keep predicting what will be the next word."),
        hr(),
        textInput("inputText", "Start writting here:",value = ""),
        hr(),
      ),
      mainPanel(
        h4("Predicted Word:"),
        verbatimTextOutput("prediction"),
        strong("Input:"),
        strong(code(textOutput('sentence1'))),
        br(),
        strong("Ngram Function used:"),
        strong(code(textOutput('sentence2'))),
        hr(),
        hr(),
        hr(),
        hr(),
        hr(),
        hr()
      )
    )
  )
)