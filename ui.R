library(shiny)
library(ggplot2)
nba<- read.csv("nba.csv")
 
 
shinyUI(pageWithSidebar(
 
  headerPanel("NBA"),
  
  sidebarPanel(
 
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(nba),
                value=min(1000, nrow(nba)), step=500, round=0),
    
    selectInput('x', 'X', names(nba)),
    selectInput('y', 'Y', names(nba), names(nba)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset))),
    
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth'),
    
    selectInput('facet_row', 'Facet Row', c(None='.', names(nba))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(nba)))
  ),
 
  mainPanel(
    plotOutput('plot')
  )
))
