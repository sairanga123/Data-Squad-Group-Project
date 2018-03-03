#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
<<<<<<< HEAD
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
=======
  output$twitterPlot <- renderPlot({
    
    consumer_key <- 	"XjOeuHJ1izxz0cQK3s6hP4xWb" 
    consumer_secret <- "Bw6k0FpcfGmERk1PrGHGOoGVewYMh0EQpW0Gd2RZVdnQFw8dlI"
    access_token <- "737440271076491264-i7tTdu2U5kztq2TjXT1gcDxlsqcKlYW"
    access_secret <- 	"Q5BIJvKnGFDxp02G0xaW0KEbTmoPpxtGorqovpdyLYhId"
    
    #setup twitter conneciton 
    setup_twitter_oauth(consumer_key, consumer_secret, access_token, 
                        access_secret)
>>>>>>> sai
  })
  
})
