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
  
  headerPanel(
    h1("Select Twitter Data:", 
       style = "font-family: 'Lobster', cursive;
       font-weight: 500; line-height: 1.1; 
       color: #4d3a7d;")), 
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      p("The following selections allow you to choose which policy will be shown (net neutrality, gun control, or immigration), whether you want the bar plot to include number of retweets, and whether you want to view a plot of total tweets over time and/or a bar graph of the tweets from 5 different cities"),
      
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
      
      checkboxGroupInput(inputId = "timegraph", 
                   label = "Click to view time graph", 
                   choices = c("Time Graph"),
                   selected = NULL),
      
      checkboxGroupInput(inputId = "AllCitiesGraph", 
                   label = "Click to view graphs", 
                   choices = c("All Cities Comparison Graph"),
                   selected = NULL)
    ),
    
    # Show plots 
    mainPanel(
       plotOutput("twitterPlot"),
       conditionalPanel("input.timegraph == 'Time Graph'", plotOutput("timePlot")),
       conditionalPanel("input.AllCitiesGraph == 'All Cities Comparison Graph'", plotOutput("cityPlot"))
    )
  )
))
