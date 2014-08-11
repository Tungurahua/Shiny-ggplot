library(shiny)
library(ggplot2)


shinyUI(fluidPage(

    column(12,offset=5,
           titlePanel("Temperature across Years")),
    br(),
    h6(textOutput("text1")),

    fluidRow(

        column(4,offset=0,
               wellPanel(
                   selectInput("var","Time-Periods",
                               choices = colnames(temp),selected ="ANNUAL")))),

    column(12,offset=0,
           plotOutput("stack", height=400,width=1200)
    ),

    column(12,
           dataTableOutput("table1")
    )

))

