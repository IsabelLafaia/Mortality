library(shiny)

shinyUI(fluidPage(
        navbarPage(
                title = 'World Health Organization Mortality Database',
                tabPanel('Country Codes',     DT::dataTableOutput('country_codes')),
                tabPanel('Mortality10_1',        DT::dataTableOutput('morticd10_part1')),
                tabPanel('Mortality10_2',      DT::dataTableOutput('morticd10_part2')),
                tabPanel('Mortality7',       DT::dataTableOutput('morticd7')),
                tabPanel('Mortality8',  DT::dataTableOutput('morticd8')),
                tabPanel('Mortality9',  DT::dataTableOutput('morticd9')),
                tabPanel('Notes',  DT::dataTableOutput('notes')),
                tabPanel('Population',  DT::dataTableOutput('pop'))
        )
        
))