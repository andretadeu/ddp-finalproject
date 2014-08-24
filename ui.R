library(shiny)

shinyUI(
    pageWithSidebar(
        headerPanel('Motor Trend of Cars statistics'),
        sidebarPanel(
            radioButtons('cyls', 'Cylinders',
                         c('4 cylinders' = '4',
                           '6 cylinders' = '6',
                           '8 cylinders' = '8'),
                         selected = '4'),
            checkboxGroupInput('gears', 'Number of gears',
                               c('3 gears' = '3',
                                 '4 gears' = '4',
                                 '5 gears' = '5'),
                               selected = c('3', '4', '5')),
            checkboxGroupInput('transmType', 'Transmission type',
                               c('manual' = '0',
                                 'automatic' = '1'),
                               selected = c('0', '1')),
            sliderInput('carb', 'Number of carburetors',
                        min = 1, max = 8, step = 1, value = c(1,8)),
            submitButton(text = 'Search')
            ),
        mainPanel(
            dataTableOutput('filteredMTCars'),
            br(),
            h4('Mean MPG'),
            verbatimTextOutput('meanMpg'),
            h4('Mean HP'),
            verbatimTextOutput('meanHP'),
            h4('Mean time for 1/4 mile'),
            verbatimTextOutput('meanQSec'),
            h4('Mean weight'),
            verbatimTextOutput('meanWeight')
            )
        )
    )