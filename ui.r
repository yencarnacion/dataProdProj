library(shiny)

shinyUI(navbarPage("Twitter-When  | When is a term twitted?",


  tabPanel("Twitter-When",
    sidebarLayout(
    sidebarPanel(
    	    textInput("searchTerm", "Term to be searched.  Example: Seinfield, hoola hoop, golden globes"),
    	    sliderInput("tweetSample",
                  "Number of tweets:",
                  min = 25,
                  max = 100,
                  value = 25),
            actionButton("submitButton", "Twitter, when was that tweeted?")
    ),

    # Show a histogram of the generated distribution
    mainPanel(
      plotOutput("twitHistogram")
    )
  )
  ), 
    navbarMenu("Docs",
                    tabPanel("User Instructions", 
                         includeHTML("www/userInstruction.html")
                         ),

                    #tabPanel("Data Analysis Docs",
                    #      includeHTML("www/analysis.html")
                    #       ),
                    tabPanel("Repo", 
                      a(href="http://github.com/yencarnacion/dataProdProj", 
                      onclick="window.open(this.href); return false",
                      "http://github.com/yencarnacion/dataProdProj")
                      )
                                      
                                                            )  
))
  
