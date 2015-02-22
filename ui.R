library(shiny)
library(ggplot2)
library(eeptools)
shinyUI(pageWithSidebar(
    headerPanel("Central Limit Theorem"),
    sidebarPanel(
        radioButtons("obs", "Number of Random Observation:",c("10" = 10,"100" = 100)),
        radioButtons("dtype", "Distribution type:",c("Normal" = "norm","Uniform" = "unif")),
        sliderInput("rep","Number of repeats:", min=0,max=1000,value=100)
    ),
    mainPanel(plotOutput("distPlot"))
))