library(DT) # need datatables package
server <- shinyServer(function(input, output, session) {
        output$country_codes <- DT::renderDataTable(country_codes)
        output$morticd10_part1 <- DT::renderDataTable(morticd10_part1)
        output$morticd10_part2 <- DT::renderDataTable(morticd10_part2)
        output$morticd7 <- DT::renderDataTable(morticd7)
        output$morticd8 <- DT::renderDataTable(morticd8)
        output$morticd9 <- DT::renderDataTable(morticd9)
        output$notes <- DT::renderDataTable(notes)
        output$pop <- DT::renderDataTable(pop)
        
})
