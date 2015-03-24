
library(shiny)
library(ggplot2)
a<-theme(panel.grid.minor.y=element_blank(),panel.grid.major.y=element_blank(),
         panel.background=element_rect(fill="white",colour=NA),
         axis.ticks=element_blank(),axis.text.x = element_text(angle = 0, vjust = 1, hjust=0.5,size = 10,color = "black"),
         legend.position="none")


#temp<-read.csv("temperature.csv", header=TRUE, sep=",")


shinyServer(function(input,output){

    output$text1<- renderText({
        paste("Country is:",input$var)})

    output$stack<-renderPlot({

        p<-ggplot(data = census,aes_string("TIME",input$var,group="TIME")) + geom_bar(stat="identity") +
             ggtitle("Population over time")+
          scale_x_discrete()
#            geom_text(aes_string(label=input$var),size=4,vjust=1,colour="white")

        print(p+a)})

    output$table1<-renderDataTable({census})

})
