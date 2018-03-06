#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)



# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title

  titlePanel("A Comparison of Twitter Popular Opinions to Real Life
             Political Decisions"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "policies",
                  label = "Select Policy", 
                  choices = list("Net Neutrality" = "net_neutrality", "Gun Control" = "gun_control", "Immigration" = "immigration"),
                  selected = "net_neutrality",
                  multiple = FALSE,
                  selectize = TRUE),
      
      checkboxGroupInput(inputId = "retweet",
                         label = "Select Data With Retweets or Without Retweets:", 
                         choices = list("With Retweets" = "ret"),
                         selected = "ret"),
      
      radioButtons(inputId = "time graph", 
                   label = "Click to view time graph", 
                   choices = c("Time Graph"),
                   selected = NULL),
      
      selectInput(inputId = "city name", 
                  label = "Select city name:",
                  choices = c("San Francisco", "Washington D.C.", "Seattle", 
                              "Oklahoma City", "Omaha"),
                  selected = NULL), 
      radioButtons(inputId = "policies2",
                   label = "Select Policy", 
                   choices = c("Net Neutrality", "Gun Control", "Immigration"),
                   selected = NULL), 
      radioButtons(inputId = "All Cities Graph", 
                   label = "Click to view graphs", 
                   choices = c("All Cities Comparison Graph"),
                   selected = NULL)
    ),
    
    # Show plots 
    mainPanel(
       plotOutput("twitterPlot")
    )
  )
))
