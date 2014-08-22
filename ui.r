library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Twitter-When  | When is a term twitted?"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
    	    textInput("searchTerm", "Term to be searched.  Example: Seinfield, hoola hoop, golden globes"),
    	    sliderInput("tweetSample",
                  "Number of tweets:",
                  min = 25,
                  max = 100,
                  value = 25),
            actionButton("submitButton", "Twitter, when is that twitted?")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("twitHistogram")
    )
  )
))
  
