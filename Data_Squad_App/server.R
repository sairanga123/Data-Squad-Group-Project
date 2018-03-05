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
library("dplyr")

consumer_key <- 	"XjOeuHJ1izxz0cQK3s6hP4xWb" 
consumer_secret <- "Bw6k0FpcfGmERk1PrGHGOoGVewYMh0EQpW0Gd2RZVdnQFw8dlI"
access_token <- "737440271076491264-i7tTdu2U5kztq2TjXT1gcDxlsqcKlYW"
access_secret <- 	"Q5BIJvKnGFDxp02G0xaW0KEbTmoPpxtGorqovpdyLYhId"

#setup twitter conneciton 
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

###----------------------------------------------------------------------------------------------------###

#get tweets on net neutrality and arrange it into a dataframe 
net.neutrality.tweets <- searchTwitter(" 'Net Neutrality' OR #netneutrality OR #savetheinternet", 
                                       n=1000, lang="en", since="2017-01-01")
net_neutrality_tweets_df <- twListToDF(net.neutrality.tweets)
#net neutrality data with retweets
net_neutrality_support <- dplyr::filter(net_neutrality_tweets_df, grepl("save|need|#saveNetNeutrality|#BreaktheInternet", text))
net_neutrality_against <- dplyr::filter(net_neutrality_tweets_df, grepl("#stoptheFCC|stop|#NetNeutrality", text))
#net neutrality data without retweets
net_neutrality_support_wo_retweets <- net_neutrality_support %>% filter(isRetweet == FALSE) %>% select(text) 
net_neutrality_against_wo_retweets <- net_neutrality_against %>% filter(isRetweet == FALSE) %>% select(text) 



###----------------------------------------------------------------------------------------------------###
#get tweets on gun control and arrange it into a dataframe 
gun.control.tweets <- searchTwitter(" 'Gun Control' OR #guncontrol", 
                                       n=1000, lang="en", since="2017-01-01")
gun_control_tweets_df <- twListToDF(gun.control.tweets)


# create two groups - gun control supports, and those who are against 
gun_control_support <- dplyr::filter(gun_control_tweets_df, grepl('#guncontrol|#parkland|ban', text))
gun_control_against <- dplyr::filter(gun_control_tweets_df, grepl('#DefendtheSecond|blame|good|do not', text))

#get tweets without any retweets within the dataframe 
gun_control_against_wo_retweets <- gun_control_against %>% filter(isRetweet == FALSE) %>% select(text) 
gun_control_support_wo_retweets <- gun_control_support %>% filter(isRetweet == FALSE) %>% select(text) 

###-------------------------------------------------------------------------------------------------------###

#get tweets on immigration ban and arrange it into a dataframe 
immigration.policies.tweets <- searchTwitter(" 'Immigration Ban' OR #immigration OR #immigrants", 
                                       n=1000, lang="en", since="2017-01-01")
immigration_policies_tweets_df <- twListToDF(immigration.policies.tweets)

#immigration data with retweets
immigration_ban_support <- dplyr::filter(gun_control_tweets_df, grepl("#immigrationban|#trump|#ban|#wall", text))
immigration_ban_against <- dplyr::filter(gun_control_tweets_df, grepl("#resist|Immigrants|not banned|#notmypresident", text))

#immigration without retweets
immigration_ban_against_wo_retweets <- immigration_ban_against %>% filter(isRetweet == FALSE) %>% select(text) 
immigration_ban_support_wo_retweets <- immigration_ban_support %>% filter(isRetweet == FALSE) %>% select(text) 

###-------------------------------------------------------------------------------------------------------###

#Get Data for 5 Cities in the country (3 liberal, 2 conservative)

#6 functions for each issue and getting data for each stance on that issue
net_neutrality_city_support_df <- function(geocode,support_text) { 
  city_tweets_issue <- searchTwitter("'Net Neutrality' OR #netneutrality", 
                                     n = 1000, lang = "en", since = "2017-01-01", geocode = paste0(geocode, ", 50mi") )
  city_tweets_issue_df <- twListToDF(city_tweets_issue)
  name1 <- dplyr::filter(city_tweets_issue_df, grepl(support_text, text))
  return(name1)
}

net_neutrality_city_against_df <- function(geocode,against_text) { 
  city_tweets_issue <- searchTwitter("'Net Neutrality' OR #netneutrality", 
                                     n = 1000, lang = "en", since = "2017-01-01", geocode = paste0(geocode, ", 50mi") )
  city_tweets_issue_df <- twListToDF(city_tweets_issue)
  name2 <- dplyr::filter(city_tweets_issue_df, grepl(against_text, text))
  return(name2)
}

gun_control_city_support_df <- function(geocode,support_text) { 
  city_tweets_issue <- searchTwitter("'Gun Control' OR #guncontrol", 
                                     n = 1000, lang = "en", since = "2017-01-01", geocode = paste0(geocode, ", 50mi") ) 
  city_tweets_issue_df <- twListToDF(city_tweets_issue)
  name1 <- dplyr::filter(city_tweets_issue_df, grepl(support_text, text))
  return(name1)
}

gun_control_city_against_df <- function(geocode,against_text) {
  city_tweets_issue <- searchTwitter("'Gun Control' OR #guncontrol", 
                                     n = 1000, lang = "en", since = "2017-01-01", geocode = paste0(geocode, ", 50mi") ) 
  city_tweets_issue_df <- twListToDF(city_tweets_issue)
  name2 <- dplyr::filter(city_tweets_issue_df, grepl(against_text, text))
  return(name2)
}

immigration_ban_city_support_df <- function(geocode,support_text) { 
  city_tweets_issue <- searchTwitter(" 'Immigration Ban' OR #immigration OR #immigrants", 
                                     n = 1000, lang = "en", since = "2017-01-01", geocode = paste0(geocode, ", 50mi") )   
  city_tweets_issue_df <- twListToDF(city_tweets_issue)
  name1 <- dplyr::filter(city_tweets_issue_df, grepl(support_text, text))
  return(name1)
}

immigration_ban_city_against_df <- function(geocode, against_text) { 
  city_tweets_issue <- searchTwitter(" 'Immigration Ban' OR #immigration OR #immigrants", 
                                     n = 1000, lang = "en", since = "2017-01-01", geocode = paste0(geocode, ", 50mi") )   
  city_tweets_issue_df <- twListToDF(city_tweets_issue)
  name2 <- dplyr::filter(city_tweets_issue_df, grepl(against_text, text))
  return(name2)
}

#get SF data 
San_Francisco_net_neutrality_df_support <- net_neutrality_city_support_df("37.7749,-122.4194","save|need|#saveNetNeutrality|#BreaktheInternet")
San_Francisco_net_neutrality_df_against <- net_neutrality_city_against_df("37.7749,-122.4194","#stoptheFCC|stop|#NetNeutrality")
San_Francisco_gun_control_df_support <- gun_control_city_support_df("37.7749,-122.4194","#guncontrol|#parkland|ban")
San_Francisco_gun_control_df_against <- gun_control_city_against_df("37.7749,-122.4194", "#DefendtheSecond|blame|good|do not")
San_Francisco_immigration_ban_df_support <- immigration_ban_city_support_df("37.7749,-122.4194", "#immigrationban|#trump|#ban|#wall")
San_Francisco_immigration_ban_df_against <- immigration_ban_city_against_df("37.7749,-122.4194", "#resist|Immigrants|not banned|#notmypresident")

SF_nn_winner <- "against"
SF_gc_winner <- "support"
SF_ib_winner <- "against"

#Washington.DC
Washington_net_neutrality_df_support <- net_neutrality_city_support_df("38.9072,-77.0369","save|need|#saveNetNeutrality|#BreaktheInternet")
Washington_net_neutrality_df_against <- net_neutrality_city_against_df("38.9072,-77.0369","#stoptheFCC|stop|#NetNeutrality")
Washington_gun_control_df_support <- gun_control_city_support_df("38.9072,-77.0369","#guncontrol|#parkland|ban")
Washington_gun_control_df_against <- gun_control_city_against_df("38.9072,-77.0369", "#DefendtheSecond|blame|good|do not")
Washington_immigration_ban_df_support <- immigration_ban_city_support_df("38.9072,-77.0369", "#immigrationban|#trump|#ban|#wall")
Washington_immigration_ban_df_against <- immigration_ban_city_against_df("38.9072,-77.0369", "#resist|Immigrants|not banned|#notmypresident")

Washington_nn_winner <- "against"
Washington_gc_winner <- "support"
Washingotn_ib_winner <- "against"

#Seattle data 
Seattle_net_neutrality_df_support <- net_neutrality_city_support_df("47.6062,-122.3321","save|need|#saveNetNeutrality|#BreaktheInternet")
Seattle_net_neutrality_df_against <- net_neutrality_city_against_df("47.6062,-122.3321","#stoptheFCC|stop|#NetNeutrality")
Seattle_gun_control_df_support <- gun_control_city_support_df("47.6062,-122.3321","#guncontrol|#parkland|ban")
Seattle_gun_control_df_against <- gun_control_city_against_df("47.6062,-122.3321", "#DefendtheSecond|blame|good|do not")
Seattle_immigration_ban_df_support <- immigration_ban_city_support_df("47.6062,-122.3321", "#immigrationban|#trump|#ban|#wall")
Seattle_immigration_ban_df_against <- immigration_ban_city_against_df("47.6062,-122.3321", "#resist|Immigrants|not banned|#notmypresident")

Seattle_nn_winner <- "against"
Seattle_gc_winner <- "support"
Seattle_ib_winner <- "against"

#Oklahoma City data 
Oklahoma_net_neutrality_df_support <- net_neutrality_city_support_df("35.4676,-97.5164","save|need|#saveNetNeutrality|#BreaktheInternet")
Oklahoma_net_neutrality_df_against <- net_neutrality_city_against_df("35.4676,-97.5164","#stoptheFCC|stop|#NetNeutrality")
Oklahoma_gun_control_df_support <- gun_control_city_support_df("35.4676,-97.5164","#guncontrol|#parkland|ban")
Oklahoma_gun_control_df_against <- gun_control_city_against_df("35.4676,-97.5164", "#DefendtheSecond|blame|good|do not")
Oklahoma_immigration_ban_df_support <- immigration_ban_city_support_df("35.4676,-97.5164", "#immigrationban|#trump|#ban|#wall")
Oklahoma_immigration_ban_df_against <- immigration_ban_city_against_df("35.4676,-97.5164", "#resist|Immigrants|not banned|#notmypresident")

Oklahoma_nn_winner <- "against"
Oklahoma_gc_support <- "support"
Oklahoma_ib_winner <- "against"

#Omaha, Nebraska data
Omaha_net_neutrality_df_support <- net_neutrality_city_support_df("41.2524,-95.9980","save|need|#saveNetNeutrality|#BreaktheInternet")
Omaha_net_neutrality_df_against <- net_neutrality_city_against_df("41.2524,-95.9980","#stoptheFCC|stop|#NetNeutrality")
Omaha_gun_control_df_support <- gun_control_city_support_df("41.2524,-95.9980","#guncontrol|#parkland|ban")
Omaha_gun_control_df_against <- gun_control_city_against_df("41.2524,-95.9980", "#DefendtheSecond|blame|good|do not")
Omaha_immigration_ban_df_support <- immigration_ban_city_support_df("41.2524,-95.9980", "#immigrationban|#trump|#ban|#wall")
Omaha_immigration_ban_df_against <- immigration_ban_city_against_df("41.2524,-95.9980", "#resist|Immigrants|not banned|#notmypresident")

Omaha_nn_winner <- "against"
Omaha_gc_support <- "support"
Omaha_gc_against <- "against"


shinyServer(function(input, output) {
  
  output$twitterPlot <- renderPlot({
    
  })
  
})
