library(shiny)
library(memoise)

filter <- function(cyls, gears, transmType, carb) {
    data <- cbind(car = rownames(mtcars), mtcars)
    res <- data[
        data$cyl == cyls &
        data$gear %in% as.integer(gears) &
        data$am %in% as.integer(transmType) &
        data$carb >= as.integer(carb[1]) &
        data$carb <= as.integer(carb[2]), ]
    if (nrow(res) > 0) {
        res
    } else {
        data
    }
}

shinyServer(function(input, output) {
    memoizedFilter <- memoise(filter)
    output$filteredMTCars <- renderDataTable(
        { memoizedFilter(input$cyls, input$gears, input$transmType, input$carb) },
        options = list(iDisplayLength = 10, bFilter = FALSE))
    output$meanMpg <- renderPrint({
        data <- memoizedFilter(input$cyls, input$gears, input$transmType, input$carb)
        mean(data$mpg)
    })
    output$meanHP <- renderPrint({
        data <- memoizedFilter(input$cyls, input$gears, input$transmType, input$carb)
        mean(data$hp)
    })
    output$meanQSec <- renderPrint({
        data <- memoizedFilter(input$cyls, input$gears, input$transmType, input$carb)
        mean(data$qsec)
    })
    output$meanWeight <- renderPrint({
        data <- memoizedFilter(input$cyls, input$gears, input$transmType, input$carb)
        mean(data$wt)
    })
})