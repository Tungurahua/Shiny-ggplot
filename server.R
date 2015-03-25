
library(shiny)
library(ggplot2)
a<-theme(panel.background=element_rect(fill="white",colour=NA),
         legend.position="none",
         axis.title.x = element_blank())


shinyServer(function(input,output){
    output$stack<-renderPlot({
      p <- ggplot(data = census,aes_string("TIME",input$var,group=1)) +
            geom_line(col="red") +
            geom_point(col="black") +
            ggtitle("")+
            scale_x_discrete(breaks = seq(from=1960, to=2014, by=10))+
          ylab("[Million inhabitants]") +
          ylim(c(0,NA))
#            geom_text(aes_string(label=input$var),size=4,vjust=1,colour="white")

        print(p + a)})

    output$table1<-renderDataTable({census})

})
