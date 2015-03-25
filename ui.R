library(shiny)
library(ggplot2)


shinyUI(fluidPage(

    column(12,#offset=5,
           titlePanel("EU28 Population on January 1st. Source: Eurostat [demo_pjan]")),
    br(),
    h6(textOutput("text1")),

    fluidRow(

        column(4,offset=0,
               wellPanel(
                   selectInput("var","Country",
                               choices = colnames(census[-1]),selected ="DE")))),

    column(12,offset=0,
           plotOutput("stack", height=400,width=1200)
    ),

    column(12,
           dataTableOutput("table1")
    )

))

