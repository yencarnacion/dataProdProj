#install.packages("devtools",repos="http://cran.r-project.org")
#install.packages("rjson",repos="http://cran.r-project.org")
#install.packages("bit64",repos="http://cran.r-project.org")
#install.packages("httr",repos="http://cran.r-project.org")
library(devtools)
library(rjson)
library(bit64)
library(httr)
# https://github.com/geoffjentry/twitteR
#devtools::install_github("twitteR", username="geoffjentry")
library(twitteR)

load("credentials")

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

shinyServer(function(input, output) {

  searchForTerm<-function(searchTerm, maxTweets=25)
  {
  	if(!is.numeric(maxTweets)){
  		maxTweets<-25
  	}
    twitList1<-searchTwitter(searchTerm,n=maxTweets,lang="en")
    twitList<- do.call("rbind",lapply(twitList1,as.data.frame))
    twitList$text<-iconv(twitList$text, 'UTF-8', 'ASCII') 
    return(twitList)   
  }

  convertDateToInterval<-function(d) { as.numeric(format(d, "%H")) }

  output$twitHistogram<- renderPlot({
  	if(input$submitButton ==0){
  	   return()
    }

    isolate({
    twitList<-searchForTerm(input$searchTerm, input$tweetSample)
    twitList$interval<-mapply(convertDateToInterval, twitList$created)
    twitList$interval<-twitList$interval+1
    hist(twitList$interval, breaks=c(1:24), xaxt="n", 
        main = "Histogram of Tweets per hour", 
        xlab= "Hour (1 being 12:00 AM UTC, 24 being 11:00 PM UTC)")
    axis(1, at=seq(1,24, by=2), labels=seq(1,24, by=2))
  	})
  	
  })

})