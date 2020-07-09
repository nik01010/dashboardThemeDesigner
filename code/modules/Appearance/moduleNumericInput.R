uiNumericInput <- function(namespaceId, label, default) {
  ns <- NS(namespaceId)
  
  ui <- tagList(
    numericInput(
      inputId = ns("numberValue"),
      label = label,
      value = default,
      min = 0,
      max = 1000,
      step = 1
    )
  )
  
  return(ui)
}

serverNumericInput <- function(input, output, session) {
  settings <- reactiveValues()
  
  observe({
    settings$numberValue = input$numberValue
  })
  
  return(settings)
}
