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
library(ggplot2)

shinyServer(function(input, output) {
  
  output$twitterPlot <- renderPlot({

    ## Do we want with retweet?
    if("ret" %in% input$retweet) {
      data1 <- eval(parse(text = paste(input$policies, "support", sep="_")))
      data2 <- eval(parse(text = paste(input$policies, "against", sep="_")))
      title <- paste("Position on", input$policies, "with Retweets")
    } else {
      data1 <- eval(parse(text = paste(input$policies, "support_wo_retweets", sep="_")))
      data2 <- eval(parse(text = paste(input$policies, "against_wo_retweets", sep="_")))
      title <- paste("Position on", input$policies, "without Retweets")
    }
    
    p <- barplot(c(nrow(data1), nrow(data2)), 
                 main=title, xlab = "Position", ylab = "# of Tweets", 
                 names.arg = c("Support", "Against"), horiz = FALSE, col = c("grey", "grey"))

  })
  
  output$timePlot <- renderPlot({timegraph(eval(parse(text = paste(input$policies, "tweets_df", sep = "_"))))})
  
  output$cityPlot <- renderPlot({citiesbarplot(input$policies)})
})
