# Loading packages --------------------------------------------------------
library(shiny)
library(shinydashboard)
library(dashboardthemes)
library(colourpicker)
library(shinyalert)
library(shinyAce)
library(DT)
library(glue)


# Source functions --------------------------------------------------------
source("./code/functions/appStart.R")
importShinyModules()

# Ui ----------------------------------------------------------------------
ui <- dashboardPage(
  
  # Browser window title
  title = "Shinydashboard Theme Designer",
  
  # Header ------------------------------------------------------------------
  header = dashboardHeader(
    
    # Shiny app title
    title = shinyDashboardLogoDIY(
      boldText = paste(icon("bookmark"), "Theme"),
      mainText = "Designer",
      textSize = 16,
      badgeText = "BETA",
      badgeTextColor = "white",
      badgeTextSize = 2,
      badgeBackColor = "#40E0D0",
      badgeBorderRadius = 3
    )
    
  ),
  
  # Sidebar -----------------------------------------------------------------
  sidebar = dashboardSidebar(
    
    sidebarMenu(
      
      id = "tbsSidebar",
      
      # Allowing the shinyalert package to be used
      useShinyalert(),
      
      ### sidebar tab links -------------------------------------------------------
      uiSidebarMenuItems()
      
    )
    
  ),
  
  # Body --------------------------------------------------------------------
  body = dashboardBody(
    
    # Custom theme ------------------------------------------------------------
    # Starting theme
    shinyDashboardThemes(theme = "grey_light"),
    
    # Default theme
    uiChangeThemeOutput(),
    
    # New theme
    uiOutput("uiUpdatedTheme"),
    
    # Sidebar fix
    tags$head(
      tags$style(
        HTML(
          "section.sidebar .shiny-bound-input.action-button, section.sidebar .shiny-bound-input.action-link { 
            margin: 0px; 
          }"
        )
      )
    ),
    
    # Ui tabs -----------------------------------------------------------------
    tabItems(
      
      tabItem(tabName = "tabHome", uiHome()),
      
      tabItem(tabName = "tabThemeOutput", uiOutput("uiThemeOutput"))
      
    )
    
  )
  
)

# Server ------------------------------------------------------------------
server <- function(input, output, session) 
{
  # Loading modules ---------------------------------------------------------
  callModule(module = serverHome, id = "moduleHome")

  # Theme settings ----------------------------------------------------------
  # General
  appFontColor <- callModule(module = serverColourInputFlat, id = "appFontColor")
  primaryFontColor <- callModule(module = serverColourInputFlat, id = "primaryFontColor")
  infoFontColor <- callModule(module = serverColourInputFlat, id = "infoFontColor")
  successFontColor <- callModule(module = serverColourInputFlat, id = "successFontColor")  
  warningFontColor <- callModule(module = serverColourInputFlat, id = "warningFontColor")  
  dangerFontColor <- callModule(module = serverColourInputFlat, id = "dangerFontColor")  
  bodyBackColor <- callModule(module = serverColourInputFlat, id = "bodyBackColor")  
  
  # Header
  logoBackColor <- callModule(module = serverColourInputFlat, id = "logoBackColor")
  headerButtonBackColor <- callModule(module = serverColourInputFlat, id = "headerButtonBackColor")
  headerButtonIconColor <- callModule(module = serverColourInputFlat, id = "headerButtonIconColor")
  headerButtonBackColorHover <- callModule(module = serverColourInputFlat, id = "headerButtonBackColorHover")
  headerButtonIconColorHover <- callModule(module = serverColourInputFlat, id = "headerButtonIconColorHover")
  headerBackColor <- callModule(module = serverColourInputFlat, id = "headerBackColor")
  
  # Sidebar
  sidebarBackColor <- callModule(module = serverColourInputFlat, id = "sidebarBackColor")
  sidebarPadding <- callModule(module = serverNumericInput, id = "sidebarPadding")
  sidebarMenuPadding <- callModule(module = serverNumericInput, id = "sidebarMenuPadding")
  sidebarUserTextColor <- callModule(module = serverColourInputFlat, id = "sidebarUserTextColor")
  sidebarSearchBackColor <- callModule(module = serverColourInputFlat, id = "sidebarSearchBackColor")
  sidebarSearchIconColor <- callModule(module = serverColourInputFlat, id = "sidebarSearchIconColor")
  sidebarSearchBorderColor <- callModule(module = serverColourInputFlat, id = "sidebarSearchBorderColor")
  sidebarTabTextColor <- callModule(module = serverColourInputFlat, id = "sidebarTabTextColor")
  sidebarTabTextSize <- callModule(module = serverNumericInput, id = "sidebarTabTextSize")
  sidebarTabBorderWidth <- callModule(module = serverNumericInput, id = "sidebarTabBorderWidth")
  sidebarTabBackColorSelected <- callModule(module = serverColourInputFlat, id = "sidebarTabBackColorSelected")
  sidebarTabTextColorSelected <- callModule(module = serverColourInputFlat, id = "sidebarTabTextColorSelected")
  sidebarTabBackColorHover <- callModule(module = serverColourInputFlat, id = "sidebarTabBackColorHover")
  sidebarTabTextColorHover <- callModule(module = serverColourInputFlat, id = "sidebarTabTextColorHover")
  sidebarTabBorderColorHover <- callModule(module = serverColourInputFlat, id = "sidebarTabBorderColorHover")
  sidebarTabBorderWidthHover <- callModule(module = serverNumericInput, id = "sidebarTabBorderWidthHover")
  
  # Boxes
  boxBackColor <- callModule(module = serverColourInputFlat, id = "boxBackColor")
  boxBorderRadius <- callModule(module = serverNumericInput, id = "boxBorderRadius")
  boxTitleSize <- callModule(module = serverNumericInput, id = "boxTitleSize")
  boxDefaultColor <- callModule(module = serverColourInputFlat, id = "boxDefaultColor") 
  boxPrimaryColor <- callModule(module = serverColourInputFlat, id = "boxPrimaryColor") 
  boxInfoColor <- callModule(module = serverColourInputFlat, id = "boxInfoColor")
  boxSuccessColor <- callModule(module = serverColourInputFlat, id = "boxSuccessColor") 
  boxWarningColor <- callModule(module = serverColourInputFlat, id = "boxWarningColor") 
  boxDangerColor <- callModule(module = serverColourInputFlat, id = "boxDangerColor")
  tabBoxTabColor <- callModule(module = serverColourInputFlat, id = "tabBoxTabColor") 
  tabBoxTabTextSize <- callModule(module = serverNumericInput, id = "tabBoxTabTextSize")
  tabBoxTabTextColor <- callModule(module = serverColourInputFlat, id = "tabBoxTabTextColor")
  tabBoxTabTextColorSelected <- callModule(module = serverColourInputFlat, id = "tabBoxTabTextColorSelected")
  tabBoxBackColor <- callModule(module = serverColourInputFlat, id = "tabBoxBackColor")
  tabBoxHighlightColor <- callModule(module = serverColourInputFlat, id = "tabBoxHighlightColor")
  tabBoxBorderRadius <- callModule(module = serverNumericInput, id = "tabBoxBorderRadius")
  
  # Inputs
  buttonBackColor <- callModule(module = serverColourInputFlat, id = "buttonBackColor")
  buttonTextColor <- callModule(module = serverColourInputFlat, id = "buttonTextColor") 
  buttonBorderColor <- callModule(module = serverColourInputFlat, id = "buttonBorderColor") 
  buttonBorderRadius <- callModule(module = serverNumericInput, id = "buttonBorderRadius")
  buttonBackColorHover <- callModule(module = serverColourInputFlat, id = "buttonBackColorHover")  
  buttonTextColorHover <- callModule(module = serverColourInputFlat, id = "buttonTextColorHover")  
  buttonBorderColorHover <- callModule(module = serverColourInputFlat, id = "buttonBorderColorHover") 
  textboxBackColor <- callModule(module = serverColourInputFlat, id = "textboxBackColor")  
  textboxBorderColor <- callModule(module = serverColourInputFlat, id = "textboxBorderColor") 
  textboxBorderRadius <- callModule(module = serverNumericInput, id = "textboxBorderRadius")
  textboxBackColorSelect <- callModule(module = serverColourInputFlat, id = "textboxBackColorSelect")  
  textboxBorderColorSelect <- callModule(module = serverColourInputFlat, id = "textboxBorderColorSelect") 
  
  # Tables
  tableBackColor <- callModule(module = serverColourInputFlat, id = "tableBackColor") 
  tableBorderColor <- callModule(module = serverColourInputFlat, id = "tableBorderColor") 
  tableBorderTopSize <- callModule(module = serverNumericInput, id = "tableBorderTopSize")
  tableBorderRowSize <- callModule(module = serverNumericInput, id = "tableBorderRowSize")
  
  observe({

    themeSettings <- shinyDashboardThemeDIY(
      
      ### general
      appFontFamily = "Arial"
      ,appFontColor = appFontColor$colourValue
      ,primaryFontColor = primaryFontColor$colourValue
      ,infoFontColor = infoFontColor$colourValue
      ,successFontColor = successFontColor$colourValue
      ,warningFontColor = warningFontColor$colourValue
      ,dangerFontColor = dangerFontColor$colourValue
      ,bodyBackColor = bodyBackColor$colourValue
      
      ### header
      ,logoBackColor = logoBackColor$colourValue
      
      ,headerButtonBackColor = headerButtonBackColor$colourValue
      ,headerButtonIconColor = headerButtonIconColor$colourValue
      ,headerButtonBackColorHover = headerButtonBackColorHover$colourValue
      ,headerButtonIconColorHover = headerButtonIconColorHover$colourValue
      
      ,headerBackColor = headerBackColor$colourValue
      ,headerBoxShadowColor = ""                               # TODO: FIX
      ,headerBoxShadowSize = "0px 0px 0px"                     # TODO: FIX
      
      ### sidebar
      ,sidebarBackColor = sidebarBackColor$colourValue
      ,sidebarPadding = sidebarPadding$numericValue
      
      ,sidebarMenuBackColor = "transparent"            # TODO: FIX
      ,sidebarMenuPadding = sidebarMenuPadding$numberValue
      ,sidebarMenuBorderRadius = 0                     # TODO: FIX
      
      ,sidebarShadowRadius = ""                            # TODO: FIX
      ,sidebarShadowColor = "0px 0px 0px"                  # TODO: FIX
      
      ,sidebarUserTextColor = sidebarUserTextColor$colourvalue
      
      ,sidebarSearchBackColor = sidebarSearchBackColor$colourValue
      ,sidebarSearchIconColor = sidebarSearchIconColor$colourValue
      ,sidebarSearchBorderColor = sidebarSearchBorderColor$colourValue
      
      ,sidebarTabTextColor = sidebarTabTextColor$colourValue
      ,sidebarTabTextSize = sidebarTabTextSize$numberValue
      ,sidebarTabBorderStyle = "none"                  # TODO: FIX
      ,sidebarTabBorderColor = "none"                  # TODO: FIX
      ,sidebarTabBorderWidth = sidebarTabBorderWidth$numberValue
      
      ,sidebarTabBackColorSelected = sidebarTabBackColorSelected$colourValue
      ,sidebarTabTextColorSelected = sidebarTabTextColorSelected$colourValue
      ,sidebarTabRadiusSelected = "0px"                # TODO: FIX
      
      ,sidebarTabBackColorHover = sidebarTabBackColorHover$colourValue
      ,sidebarTabTextColorHover = sidebarTabTextColorHover$colourValue
      ,sidebarTabBorderStyleHover = "none solid none none"   # TODO: FIX
      ,sidebarTabBorderColorHover = sidebarTabBorderColorHover$colourValue
      ,sidebarTabBorderWidthHover = sidebarTabBorderWidthHover$numberValue
      ,sidebarTabRadiusHover = "0px"                   # TODO: FIX
      
      ,boxBackColor = boxBackColor$colourValue
      ,boxBorderRadius = boxBorderRadius$numberValue
      ,boxShadowSize = "none"                          # TODO: FIX 
      ,boxShadowColor = ""                             # TODO: FIX 
      ,boxTitleSize = boxTitleSize$numberValue
      ,boxDefaultColor = boxDefaultColor$colourValue
      ,boxPrimaryColor = boxPrimaryColor$colourValue
      ,boxInfoColor = boxInfoColor$colourValue
      ,boxSuccessColor = boxSuccessColor$colourValue
      ,boxWarningColor = boxWarningColor$colourValue
      ,boxDangerColor = boxDangerColor$colourValue
      
      ,tabBoxTabColor = tabBoxTabColor$colourValue
      ,tabBoxTabTextSize = tabBoxTabTextSize$numberValue
      ,tabBoxTabTextColor = tabBoxTabTextColor$colourValue
      ,tabBoxTabTextColorSelected = tabBoxTabTextColorSelected$colourValue
      ,tabBoxBackColor = tabBoxBackColor$colourValue
      ,tabBoxHighlightColor = tabBoxHighlightColor$colourValue
      ,tabBoxBorderRadius = tabBoxBorderRadius$numberValue
      
      ### inputs
      ,buttonBackColor = buttonBackColor$colourValue
      ,buttonTextColor = buttonTextColor$colourValue
      ,buttonBorderColor = buttonBorderColor$colourValue
      ,buttonBorderRadius = buttonBorderRadius$numberValue
      
      ,buttonBackColorHover = buttonBackColorHover$colourValue
      ,buttonTextColorHover = buttonTextColorHover$colourValue
      ,buttonBorderColorHover = buttonBorderColorHover$colourValue
      
      ,textboxBackColor = textboxBackColor$colourValue
      ,textboxBorderColor = textboxBorderColor$colourValue
      ,textboxBorderRadius = textboxBorderRadius$numberValue
      ,textboxBackColorSelect = textboxBackColorSelect$colourValue
      ,textboxBorderColorSelect = textboxBorderColorSelect$colourValue
      
      ### tables
      ,tableBackColor = tableBackColor$colourValue
      ,tableBorderColor = tableBorderColor$colourValue
      ,tableBorderTopSize = tableBorderTopSize$numberValue
      ,tableBorderRowSize = tableBorderRowSize$numberValue
      
    )
    
    themeSettingsText <- glue(
      'customTheme <- shinyDashboardThemeDIY(
        ### general
        appFontFamily = "Arial"
        ,appFontColor = "{appFontColor$colourValue}"
        ,primaryFontColor = "{primaryFontColor$colourValue}"
        ,infoFontColor = "{infoFontColor$colourValue}"
        ,successFontColor = "{successFontColor$colourValue}"
        ,warningFontColor = "{warningFontColor$colourValue}"
        ,dangerFontColor = "{dangerFontColor$colourValue}"
        ,bodyBackColor = "{bodyBackColor$colourValue}"
        
        ### header
        ,logoBackColor = "{logoBackColor$colourValue}"
        
        ,headerButtonBackColor = "{headerButtonBackColor$colourValue}"
        ,headerButtonIconColor = "{headerButtonIconColor$colourValue}"
        ,headerButtonBackColorHover = "{headerButtonBackColorHover$colourValue}"
        ,headerButtonIconColorHover = "{headerButtonIconColorHover$colourValue}"
        
        ,headerBackColor = "{headerBackColor$colourValue}"
        ,headerBoxShadowColor = ""
        ,headerBoxShadowSize = "0px 0px 0px"
        
        ### sidebar
        ,sidebarBackColor = "{sidebarBackColor$colourValue}"
        ,sidebarPadding = "{sidebarPadding$numberValue}"
        
        ,sidebarMenuBackColor = "transparent"
        ,sidebarMenuPadding = "{sidebarMenuPadding$numberValue}"
        ,sidebarMenuBorderRadius = 0
        
        ,sidebarShadowRadius = ""
        ,sidebarShadowColor = "0px 0px 0px"
        
        ,sidebarUserTextColor = "{sidebarUserTextColor$colourValue}"
        
        ,sidebarSearchBackColor = "{sidebarSearchBackColor$colourValue}"
        ,sidebarSearchIconColor = "{sidebarSearchIconColor$colourValue}"
        ,sidebarSearchBorderColor = "{sidebarSearchBorderColor$colourValue}"
        
        ,sidebarTabTextColor = "{sidebarTabTextColor$colourValue}"
        ,sidebarTabTextSize = "{sidebarTabTextSize$numberValue}"
        ,sidebarTabBorderStyle = "none"
        ,sidebarTabBorderColor = "none"
        ,sidebarTabBorderWidth = "{sidebarTabBorderWidth$numberValue}"
        
        ,sidebarTabBackColorSelected = "{sidebarTabBackColorSelected$colourValue}"
        ,sidebarTabTextColorSelected = "{sidebarTabTextColorSelected$colourValue}"
        ,sidebarTabRadiusSelected = "0px"
        
        ,sidebarTabBackColorHover = "{sidebarTabBackColorHover$colourValue}"
        ,sidebarTabTextColorHover = "{sidebarTabTextColorHover$colourValue}"
        ,sidebarTabBorderStyleHover = "none solid none none"
        ,sidebarTabBorderColorHover = "{sidebarTabBorderColorHover$colourValue}"
        ,sidebarTabBorderWidthHover = "{sidebarTabBorderWidthHover$numberValue}"
        ,sidebarTabRadiusHover = "0px"
        
        ### boxes
        ,boxBackColor = "{boxBackColor$colourValue}"
        ,boxBorderRadius = "{boxBorderRadius$numberValue}"
        ,boxShadowSize = "none"
        ,boxShadowColor = ""
        ,boxTitleSize = "{boxTitleSize$numberValue}"
        ,boxDefaultColor = "{boxDefaultColor$colourValue}"
        ,boxPrimaryColor = "{boxPrimaryColor$colourValue}"
        ,boxInfoColor = "{boxInfoColor$colourValue}"
        ,boxSuccessColor = "{boxSuccessColor$colourValue}"
        ,boxWarningColor = "{boxWarningColor$colourValue}"
        ,boxDangerColor = "{boxDangerColor$colourValue}"
        
        ,tabBoxTabColor = "{tabBoxTabColor$colourValue}"
        ,tabBoxTabTextSize = "{tabBoxTabTextSize$numberValue}"
        ,tabBoxTabTextColor = "{tabBoxTabTextColor$colourValue}"
        ,tabBoxTabTextColorSelected = "{tabBoxTabTextColorSelected$colourValue}"
        ,tabBoxBackColor = "{tabBoxBackColor$colourValue}"
        ,tabBoxHighlightColor = "{tabBoxHighlightColor$colourValue}"
        ,tabBoxBorderRadius = "{tabBoxBorderRadius$numberValue}"
        
        ### inputs
        ,buttonBackColor = "{buttonBackColor$colourValue}"
        ,buttonTextColor = "{buttonTextColor$colourValue}"
        ,buttonBorderColor = "{buttonBorderColor$colourValue}"
        ,buttonBorderRadius = "{buttonBorderRadius$numberValue}"
        
        ,buttonBackColorHover = "{buttonBackColorHover$colourValue}"
        ,buttonTextColorHover = "{buttonTextColorHover$colourValue}"
        ,buttonBorderColorHover = "{buttonBorderColorHover$colourValue}"
        
        ,textboxBackColor = "{textboxBackColor$colourValue}"
        ,textboxBorderColor = "{textboxBorderColor$colourValue}"
        ,textboxBorderRadius = "{textboxBorderRadius$numberValue}"
        ,textboxBackColorSelect = "{textboxBackColorSelect$colourValue}"
        ,textboxBorderColorSelect = "{textboxBorderColorSelect$colourValue}"
        
        ### tables
        ,tableBackColor = "{tableBackColor$colourValue}"
        ,tableBorderColor = "{tableBorderColor$colourValue}"
        ,tableBorderTopSize = "{tableBorderTopSize$numberValue}"
        ,tableBorderRowSize = "{tableBorderRowSize$numberValue}"
      )'
    )
    
    output$uiUpdatedTheme <- renderUI({
      themeSettings
    })

    output$uiThemeOutput <- renderUI({
      fluidRow(
        
        tabBox(
          id = "tbxThemeOutput",
          selected = "Selected Settings",
          title = "Theme Output",
          width = 12,
          
          tabPanel(
            title = "Selected Settings",
            
            fluidRow(
              
              column(
                
                width = 4,
                
                br(),
                
                h5("Once your choices are finalised, copy the below generated customTheme code and include it in your project."),
                
                aceEditor(
                  outputId = "tbxThemeSettingsOutput",
                  value = as.character(themeSettingsText),
                  mode = "r",
                  theme = "chrome",
                  readOnly = TRUE,
                  height = "400px"
                ),
                
                br(),
                
                h5("Then call the object in shinydashboard to apply the custom theme settings."),
                
                aceEditor(
                  outputId = "tbxThemeSettingsOutputInstructions",
                  value = "
                    ...
                    ### ui body
                      dashboardBody(
                    
                        ### changing theme
                        customTheme
                    
                        ### ui tabs
                        ,tabItems(
                          tabItem(
                          ...",
                  mode = "r",
                  theme = "chrome",
                  readOnly = TRUE,
                  height = "170px"
                )
                
              )
              
            )
            
          )
          
        )
        
      )
      
    })
    
  })
  
  observeEvent(
    input$cmdSidebarSearch,
    {
      shinyalert(
        title = "Oops!",
        text = "This button does not do anything!",
        type = "info"
      )
    }
  )

}

# Dashboard launcher ------------------------------------------------------
shinyApp(ui = ui, server = server)
