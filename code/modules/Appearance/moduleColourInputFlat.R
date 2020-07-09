uiColourInputFlat <- function(namespaceId, label, default) {
  ns <- NS(namespaceId)
  
  ui <- tagList(
    colourInput(
      inputId = ns("colourValue"),
      label = label,
      value = default,
      showColour = "both"
    )
  )
  
  return(ui)
}

serverColourInputFlat <- function(input, output, session) {
  settings <- reactiveValues()
  
  observe({
    settings$colourValue = input$colourValue
  })
  
  return(settings)
}
