library(shiny)
 
shinyServer(function(input,output){
    output$distPlot<-reactivePlot(function(){
        if (input$dtype == "norm"){ 
            dist <- replicate(input$rep,{
                 data <- rnorm(input$obs)
                 mean(data)}
            )
        } else {
            dist<-replicate(input$rep, {
                data <- runif(input$obs, min=-2, max=2)
                mean(data)}
            )
        }
        p<-qplot(dist,binwidth=0.1)+geom_vline(xintercept=mean(dist))+theme_dpi()
        p<-p+coord_cartesian(xlim=c(-2,2))+geom_vline(xintercept=median(dist),color=I("red"))
        print(p)
    })
})