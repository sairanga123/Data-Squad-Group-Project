#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# install.packages("twitteR", "RCurl", "RJSONIO", "stringr")
library(shiny)
library(twitteR)
library(RCurl)
library(RJSONIO)
library(stringr)

consumer_key <- 	"XjOeuHJ1izxz0cQK3s6hP4xWb" 
consumer_secret <- "Bw6k0FpcfGmERk1PrGHGOoGVewYMh0EQpW0Gd2RZVdnQFw8dlI"
access_token <- "737440271076491264-i7tTdu2U5kztq2TjXT1gcDxlsqcKlYW"
access_secret <- 	"Q5BIJvKnGFDxp02G0xaW0KEbTmoPpxtGorqovpdyLYhId"

#setup twitter conneciton 
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

#get data
net.neutrality.tweets <- searchTwitter(" 'Net Neutrality' OR #netneutrality OR #savetheinternet", 
                                       n=1000, lang="en", since="2017-01-01")
net.neutrality.tweets.df <- twListToDF(net.neutrality.tweets)

gun.control.tweets <- searchTwitter(" 'Gun Control' OR #guncontrol", 
                                       n=1000, lang="en", since="2017-01-01")
gun.control.tweets.df <- twListToDF(gun.control.tweets)

immigration.policies.tweets <- searchTwitter(" 'Immigration policies' OR #immigration OR #immigrants", 
                                       n=1000, lang="en", since="2017-01-01")
immigration.policies.tweets.df <- twListToDF(immigration.policies.tweets)

support.gun.control <- gun.control.tweets.df %>% filter(str_detect(text, "support"))

# Define server logic required to draw a histogram

shinyServer(function(input, output) {
  
  output$twitterPlot <- renderPlot({
    
  })
  
})
