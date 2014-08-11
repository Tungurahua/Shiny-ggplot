
library(shiny)
library(ggplot2)
a<-theme(panel.grid.minor.y=element_blank(),panel.grid.major.y=element_blank(),
         panel.background=element_rect(fill="white",colour=NA),
         axis.ticks=element_blank(),axis.text.x = element_text(angle = 0, vjust = 1, hjust=0.5,size = 10,color = "black"),
         legend.position="none")


#temp<-read.csv("E:/R/shiny/git-shiny-ggplot/data/temperature.csv", header=TRUE, sep=",")


shinyServer(function(input,output){

    output$text1<- renderText({
        paste("Period is:",input$var)})

    output$stack<-renderPlot({

        p<-ggplot(data = temp,aes_string("YEAR",input$var,group="YEAR")) + geom_bar(stat="identity") +
             ggtitle("Distribution of Temperature in Degrees Celsius")+
            geom_text(aes_string(label=input$var),size=4,vjust=1,colour="white")

        print(p+a)})

    output$table1<-renderDataTable({temp})

})
