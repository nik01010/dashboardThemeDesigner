# Ui functions ------------------------------------------------------------
uiHome <- function()
{
  ns <- NS("moduleHome")
  userInterfaceOutput <- tagList(
    uiOutput(ns("uiHome"))
  )
  
  return(userInterfaceOutput)
}


# Server functions --------------------------------------------------------
serverHome <- function(input, output, session)
{
  ns <- NS("moduleHome")
  
  # Tab Ui
  output$uiHome <- renderUI({
    
    tagList(

      tabBox(
        id = "tbxThemeSettings",
        selected = "General",
        title = "Theme Settings",
        width = 12,
        
        tabPanel(
          title = "General",
          
          fluidRow(
            
            column(
              
              width = 2,
              
              br(),
              
              div(
                style = "font-size: 80%;",
                
                verbatimTextOutput(ns("appFontFamily")),
                
                uiColourInputFlat(namespaceId = "appFontColor", label = "App Font Colour", default = "rgb(45,45,45)"),
                uiColourInputFlat(namespaceId = "primaryFontColor", label = "Primary Font Colour", default = "rgb(15,15,15)"),
                uiColourInputFlat(namespaceId = "infoFontColor", label = "Info Font Colour", default = "rgb(15,15,15)"),
                uiColourInputFlat(namespaceId = "successFontColor", label = "Success Font Colour", default = "rgb(15,15,15)"),
                uiColourInputFlat(namespaceId = "warningFontColor", label = "Warning Font Colour", default = "rgb(15,15,15)"),
                uiColourInputFlat(namespaceId = "dangerFontColor", label = "Danger Font Colour", default = "rgb(15,15,15)"),
                uiColourInputFlat(namespaceId = "bodyBackColor", label = "Body Background Colour", default = "rgb(240,240,240)")
              )

            ),
            
            column(
              
              width = 9,
              offset = 1,
              
              h3("Examples:"),
              hr(),
              
              h1("Text size: h1"),
              h2("Text size: h1"),
              h3("Text size: h1"),
              h4("Text size: h1"),
              h5("Text size: h1"),
              h6("Text size: h6")
              
            )#,
            
            # column(
            #   
            #   width = 2,
            #   
            #   h3("Primary text", class = "text-primary"),
            #   h3("Info text", class = "text-info"),
            #   h3("Success text", class = "text-success"),
            #   h3("Warning text", class = "text-warning"),
            #   h3("Danger text", class = "text-danger")
            #   
            # )
            
          )
          
        ),
        
        tabPanel(
          title = "Header",
          
          fluidRow(
            
            column(
              
              width = 2,
              
              br(),
              
              div(
                style = "font-size: 80%;",
                
                uiColourInputFlat(namespaceId = "logoBackColor", label = "Logo Background Colour", default = "rgb(120,120,120)"),
                uiColourInputFlat(namespaceId = "headerButtonBackColor", label = "Header Button Background Colour", default = "rgb(120,120,120)"),
                uiColourInputFlat(namespaceId = "headerButtonIconColor", label = "Header Button Icon Colour", default = "rgb(220,220,220)"),
                uiColourInputFlat(namespaceId = "headerButtonBackColorHover", label = "Header Button Background Colour Hover", default = "rgb(100,100,100)"),
                uiColourInputFlat(namespaceId = "headerButtonIconColorHover", label = "Header Button Icon Colour Hover", default = "rgb(60,60,60)"),
                uiColourInputFlat(namespaceId = "headerBackColor", label = "Header Background Colour", default = "rgb(120,120,120)")
                
                # TODO: FIX THESE
                # headerBoxShadowColor
                # headerBoxShadowSize
              )
              
            )
            
          )

        ),
        
        tabPanel(
          title = "Sidebar",
          
          fluidRow(
            
            column(
              
              width = 2,
              
              br(),
              
              div(
                style = "font-size: 80%;",
              
                uiColourInputFlat(namespaceId = "sidebarBackColor", label = "Sidebar Background Colour", default = "rgb(255,255,255)"),
                uiNumericInput(namespaceId = "sidebarPadding", label = "Sidebar Padding", default = 0),
                uiNumericInput(namespaceId = "sidebarMenuPadding", label = "Sidebar Menu Padding", default = 0),
                uiColourInputFlat(namespaceId = "sidebarUserTextColor", label = "Sidebar User Text Colour", default = "rgb(115,115,115)"),
                uiColourInputFlat(namespaceId = "sidebarSearchBackColor", label = "Sidebar Search Background Colour", default = "rgb(240,240,240)"),
                uiColourInputFlat(namespaceId = "sidebarSearchIconColor", label = "Sidebar Search Icon Colour", default = "rgb(100,100,100)"),
                uiColourInputFlat(namespaceId = "sidebarSearchBorderColor", label = "Sidebar Search Border Colour", default = "rgb(220,220,220)")
                
                # TODO: FIX THESE
                # sidebarMenuBorderRadius
              )
              
            ),
            
            column(
              
              width = 2,
              
              br(),
              
              div(
                style = "font-size: 80%;",
                
                uiColourInputFlat(namespaceId = "sidebarTabTextColor", label = "Sidebar Tab Text Colour", default = "rgb(100,100,100)"),
                uiNumericInput(namespaceId = "sidebarTabTextSize", label = "Sidebar Tab Text Size", default = 14),
                uiNumericInput(namespaceId = "sidebarTabBorderWidth", label = "Sidebar Tab Border Width", default = 0),
                uiColourInputFlat(namespaceId = "sidebarTabBackColorSelected", label = "Sidebar Tab Background Colour Selected", default = "rgb(230,230,230)"),
                uiColourInputFlat(namespaceId = "sidebarTabTextColorSelected", label = "Sidebar Tab Text Colour Selected", default = "rgb(0,0,0)"),
                uiColourInputFlat(namespaceId = "sidebarTabBackColorHover", label = "Sidebar Tab Background Colour Hover", default = "rgb(245,245,245)"),
                uiColourInputFlat(namespaceId = "sidebarTabTextColorHover", label = "Sidebar Tab Text Colour Hover", default = "rgb(0,0,0)"),
                uiColourInputFlat(namespaceId = "sidebarTabBorderColorHover", label = "Sidebar Tab Border Colour Hover", default = "rgb(200,200,200)"),
                uiNumericInput(namespaceId = "sidebarTabBorderWidthHover", label = "Sidebar Tab Border Width Hover", default = 4)
                
                
                # TODO: FIX THESE:
                # sidebarMenuBackColor
                # sidebarShadowRadius
                # sidebarShadowColor 
                # sidebarTabBorderStyle 
                # sidebarTabBorderColor 
                # sidebarTabRadiusSelected 
                # sidebarTabBorderStyleHover
                # sidebarTabRadiusHover
              )

            )
            
          )
          
        ),
        
        tabPanel(
          title = "Boxes",
          
          fluidRow(
            
            column(
              
              width = 2,
              
              br(),
              
              div(
                style = "font-size: 80%;",
                
                uiColourInputFlat(namespaceId = "boxBackColor", label = "Box Background Colour", default = "rgb(255,255,255)"),
                uiNumericInput(namespaceId = "boxBorderRadius", label = "Box Border Radius", default = 5),
                uiNumericInput(namespaceId = "boxTitleSize", label = "Box Title Size", default = 18),
                uiColourInputFlat(namespaceId = "boxDefaultColor", label = "Box Default Colour", default = "rgb(225,225,225)"),
                uiColourInputFlat(namespaceId = "boxPrimaryColor", label = "Box Primary Colour", default = "rgb(95,155,213)"),
                uiColourInputFlat(namespaceId = "boxInfoColor", label = "Box Info Colour", default = "rgb(180,180,180)"),
                uiColourInputFlat(namespaceId = "boxSuccessColor", label = "Box Success Colour", default = "rgb(112,173,71)"),
                uiColourInputFlat(namespaceId = "boxWarningColor", label = "Box Warning Colour", default = "rgb(237,125,49)"),
                uiColourInputFlat(namespaceId = "boxDangerColor", label = "Box Danger Colour", default = "rgb(232,76,34)")
              )
              
              
            ),
            
            column(
              
              width = 2,
              
              br(),
              
              div(
                style = "font-size: 80%;",
                
                uiColourInputFlat(namespaceId = "tabBoxTabColor", label = "TabBox Tab Colour", default = "rgb(248,248,248)"),
                uiNumericInput(namespaceId = "tabBoxTabTextSize", label = "TabBox Tab Text Size", default = 14),
                uiColourInputFlat(namespaceId = "tabBoxTabTextColor", label = "TabBox Tab Text Colour", default = "rgb(100,100,100)"),
                uiColourInputFlat(namespaceId = "tabBoxTabTextColorSelected", label = "TabBox Tab Text Colour Selected", default = "rgb(45,45,45)"),
                uiColourInputFlat(namespaceId = "tabBoxBackColor", label = "TabBox Background Colour", default = "rgb(248,248,248)"),
                uiColourInputFlat(namespaceId = "tabBoxHighlightColor", label = "TabBox Highlight Colour", default = "rgb(200,200,200)"),
                uiNumericInput(namespaceId = "tabBoxBorderRadius", label = "TabBox Border Radius", default = 5)
                
                # TODO: FIX THESE
                # boxShadowSize
                # boxShadowColor
              )
              
            ),
            
            column(
              
              width = 7,
              offset = 1,
              
              h3("Examples:"),
              hr(),
              
              fluidRow(
                
                box(
                  title = "Box: default",
                  height = 90,
                  width = 2
                ),
                
                box(
                  title = "Box: no header",
                  height = 90,
                  width = 2,
                  solidHeader = TRUE,
                )
                
              ),
              
              fluidRow(
                
                box(
                  title = "Box: primary",
                  height = 90,
                  status = "primary",
                  width = 2
                ),
                
                box(
                  title = "Box: info",
                  height = 90,
                  status = "info",
                  width = 2
                ),
                
                box(
                  title = "Box: success",
                  height = 90,
                  status = "success",
                  width = 2
                ),
                
                box(
                  title = "Box: warning",
                  height = 90,
                  status = "warning",
                  width = 2
                ),
                
                box(
                  title = "Box: danger",
                  height = 90,
                  status = "danger",
                  width = 2
                )
                
              ),
              
              fluidRow(
                
                box(
                  title = "Box: primary",
                  height = 90,
                  status = "primary",
                  width = 2,
                  solidHeader = TRUE
                ),
                
                box(
                  title = "Box: info",
                  height = 90,
                  status = "info",
                  width = 2,
                  solidHeader = TRUE
                ),
                
                box(
                  title = "Box: success",
                  height = 90,
                  status = "success",
                  width = 2,
                  solidHeader = TRUE
                ),
                
                box(
                  title = "Box: warning",
                  height = 90,
                  status = "warning",
                  width = 2,
                  solidHeader = TRUE
                ),
                
                box(
                  title = "Box: danger",
                  height = 90,
                  status = "danger",
                  width = 2,
                  solidHeader = TRUE
                )
                
              ),
              
              fluidRow(
                
                box(
                  title = "Box: collapsible",
                  h5("Content row"),
                  h5("Additional content row"),
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  collapsed = FALSE,
                  width = 4
                ),
                
                box(
                  title = "Box: collapsible",
                  h5("Content row"),
                  h5("Additional content row"),
                  collapsible = TRUE,
                  collapsed = FALSE,
                  width = 4
                )
                
              ),
              
              fluidRow(
                
                box(
                  title = "Box: collapsed",
                  h5("Content row"),
                  collapsible = TRUE,
                  collapsed = TRUE,
                  status = "warning",
                  width =  4
                ),
                
                box(
                  title = "Box: collapsed",
                  h5("Content row"),
                  collapsible = TRUE,
                  collapsed = TRUE,
                  status = "danger",
                  width =  4
                )
                
              ),
              
              fluidRow(
                
                box(
                  title = "Box: collapsed (coloured)",
                  h5("Content row"),
                  h5("Additional content row"),
                  collapsible = TRUE,
                  collapsed = TRUE,
                  solidHeader = TRUE,
                  status = "warning",
                  width =  4
                ),
                
                box(
                  title = "Box: collapsed (coloured)",
                  h5("Content row"),
                  h5("Additional content row"),
                  collapsible = TRUE,
                  collapsed = TRUE,
                  solidHeader = TRUE,
                  status = "danger",
                  width =  4
                )
                
              )
              
            )
            
          )
          
        ),
        
        tabPanel(
          title = "Inputs",
          
          fluidRow(
            
            column(
              
              width = 2,
              
              br(),
              
              div(
                style = "font-size: 80%;",
                
                uiColourInputFlat(namespaceId = "buttonBackColor", label = "Button Background Colour", default = "rgb(215,215,215)"),
                uiColourInputFlat(namespaceId = "buttonTextColor", label = "Button Text Colour", default = "rgb(45,45,45)"),
                uiColourInputFlat(namespaceId = "buttonBorderColor", label = "Button Border Colour", default = "rgb(150,150,150)"),
                uiNumericInput(namespaceId = "buttonBorderRadius", label = "Button Border Radius", default = 5),
                uiColourInputFlat(namespaceId = "buttonBackColorHover", label = "Button Background Colour Hover", default = "rgb(190,190,190)"),
                uiColourInputFlat(namespaceId = "buttonTextColorHover", label = "Button Text Colour Hover", default = "rgb(0,0,0)"),
                uiColourInputFlat(namespaceId = "buttonBorderColorHover", label = "Button Border Colour Hover", default = "rgb(150,150,150)")
              )
              
            ),
            
            column(
              
              width = 2,
              
              br(),
              
              div(
                style = "font-size: 80%;",
                
                uiColourInputFlat(namespaceId = "textboxBackColor", label = "Textbox Background Colour", default = "rgb(255,255,255)"),
                uiColourInputFlat(namespaceId = "textboxBorderColor", label = "Textbox Border Colour", default = "rgb(118,118,118)"),
                uiNumericInput(namespaceId = "textboxBorderRadius", label = "Textbox Border Radius", default = 5),
                uiColourInputFlat(namespaceId = "textboxBackColorSelect", label = "Textbox Background Colour Selected", default = "rgb(245,245,245)"),
                uiColourInputFlat(namespaceId = "textboxBorderColorSelect", label = "Textbox Border Colour Selected", default = "rgb(108,108,108)")
              )

            ),
            
            column(
              
              width = 7,
              offset = 1,
              
              h3("Examples:"),
              hr(),
              
              column(
                
                width = 3,
                
                selectInput(
                  inputId = ns("dbxSelectInput"),
                  label = "Select Input",
                  choices = c(
                    "Option 1",
                    "Option 2",
                    "Option 3",
                    "Option 4",
                    "Option 5"
                  ),
                  selected = TRUE,
                  multiple = FALSE
                ),
                
                selectizeInput(
                  inputId = ns("dbxSelectizeInput"),
                  label = "Selectize Input (Multiple)",
                  choices = c(
                    "Option 1", "Option 2", "Option 3", "Option 4", "Option 5", "Option 6", "Option 7", "Option 8"
                  ),
                  selected = c(
                    "Option 1", "Option 2", "Option 3", "Option 4", "Option 5"
                  ),
                  multiple = TRUE
                ),
                
                textInput(
                  inputId = ns("txtTextInput"),
                  label = "Text Input",
                  value = NULL,
                  placeholder = "Write here..."
                ),
                
                dateInput(
                  inputId = ns("dteDateInput"),
                  label = "Date Input",
                  value = Sys.Date(),
                  weekstart = 1
                )
                
              ),
              
              column(
                
                width = 3,
                offset = 1,
               
                h5(strong("Button: Plain")),
                actionButton(
                  inputId = ns("cmdActionButton"),
                  label = "Press to Start",
                  width = 198
                ),
                
                h5(strong("Button: Icon")),
                actionButton(
                  inputId = ns("cmdActionButtonIcon"),
                  label = "Press to Start",
                  icon = icon("gear"),
                  width = 198
                ),
                
                h5(strong("Button: no label")),
                actionButton(
                  inputId = ns("cmdActionButtonNoLabel1"),
                  label = NULL,
                  icon = icon("envelope"),
                  width = 97
                ),
                actionButton(
                  inputId = ns("cmdActionButtonNoLabel2"),
                  label = NULL,
                  icon = icon("trash"),
                  width = 97
                )
                 
              )
              
            )
            
          )
          
        ),
        
        tabPanel(
          title = "Tables",
          
          fluidRow(
            
            column(
              
              width = 2,
              
              br(),
              
              div(
                style = "font-size: 80%;",
                
                uiColourInputFlat(namespaceId = "tableBackColor", label = "Table Background Colour", default = "rgb(248,248,248)"),
                uiColourInputFlat(namespaceId = "tableBorderColor", label = "Table Border Colour", default = "rgb(238,238,238)"),
                uiNumericInput(namespaceId = "tableBorderTopSize", label = "Table Border Top Size", default = 1),
                uiNumericInput(namespaceId = "tableBorderRowSize", label = "Table Border Row Size", default = 1)
              )
              
            ),
            
            column(
              
              width = 9,
              offset = 1,
              
              h3("Examples:"),
              hr(),
              
              column(
                
                width = 4,
                
                h4("Table"),
                tableOutput(ns("tblTable"))
                
              ),
              
              column(
                
                width = 8,
                
                h4("DataTable"),
                div(
                  style = "font-size: 80%;",
                  dataTableOutput(ns("tblDataTable"))
                )
                
              )
              
            )
            
          )
          
        ),
        
        tabPanel(
          title = "Other Examples",
          
          fluidRow(
            
            column(
              
              width = 3,
             
              br(),
              br(),
              actionButton(
                inputId = ns("cmdNotification"),
                label = "Notification",
                icon = icon("clock-o"),
                width = "100%"
              ),

              br(),
              br(),
              actionButton(
                inputId = ns("cmdProgressBar"),
                label = "Progress Bar",
                icon = icon("spinner"),
                width = "100%"
              ),
              
              br(),
              br(),
              actionButton(
                inputId = ns("cmdModalPopup"),
                label = "Modal pop-up",
                icon = icon("square-o"),
                width = "100%"
              )
               
            )
            
          )
          
        )
        
      )
          
    )
    
  })

  output$appFontFamily <- renderText({
    "App Font Family: Arial"
  })
  
  output$tblTable <- renderTable({
    data.frame(
      String = c("Item A", "Item B", "Item C", "Item D", "Item E"),
      Numeric = c(1.10, 1.20, 1.30, 1.40, 1.50),
      Date = c("2014-01-01", "2015-01-01", "2016-01-01", "2017-01-01", "2018-01-01"),
      ..... = c(".....", ".....", ".....", ".....", ".....")
    )
  })
  
  output$tblDataTable <- renderDataTable({
    datatable(
      # Table data
      data = EuStockMarkets,
      
      # Hiding row names
      rownames = FALSE,
      
      # Single row can be selected
      selection = "single",
      
      # Enabling buttons on top of table and scrollbar
      extensions = c("Buttons", "Scroller"),
      
      # Filter
      filter = "bottom",
      
      options = list(
        # Table components can be added/removed here
        dom = "Blfrtip",
        
        # Freezing panes
        fixedHeader = TRUE,
        
        # Specify buttons on top of table
        buttons = c("copy", "excel", I("colvis")),
        
        # Scroll heights
        scrollY = 300,
        scrollX = 500,
        
        # Page length and menu
        paging = TRUE,
        pageLength = 50,
        lengthMenu = list(
          c(50, 100, 500, -1),
          list("50", "100", "500", "All")
        )
      )
      
    )
  })
  
  observeEvent(
    input$cmdNotification, 
    {
    
      showNotification(
        ui = "This is an example notification!",
        duration = NULL,
        closeButton = TRUE
      )
    
    }
  )
  
  observeEvent(
    input$cmdProgressBar, 
    {
      withProgress(
        message = "Example task",
        value = 0,
        min = 0,
        max = 4,
        {
          incProgress(amount = 1, detail = "Sub-task 1")
          Sys.sleep(2)
          
          incProgress(amount = 1, detail = "Sub-task 2")
          withProgress(
            message = "Sub-task 2 detail",
            value = 0,
            min = 1,
            max = 5,
            {
              for (i in 1:5) {
                incProgress(amount = 1, detail = glue("Processing item {i}"))
                Sys.sleep(2)
              }
            }
          )
          
          incProgress(amount = 1, detail = "Sub-task 3")
          Sys.sleep(2)
        }
      )
    }
  )
  
  observeEvent(input$cmdModalPopup, {
    
    output$tblModalDataTable <- renderDataTable({
        head(mtcars)
    })
    
    mdlExample <- modalDialog(
      
      title = "Example Modal",
      size = "l",
      {
        
        fluidPage(
          
          fluidRow(
            
            h5(strong("Example content")),
            hr(),
            h5("Example wording..."),
            br(),
            
            textInput(
              inputId = "txtModalInput",
              label = "Example text input",
              placeholder = "Write here..."
            ),
            
            dataTableOutput(ns("tblModalDataTable"))
            
          )
          
        )
        
      }
      
    )
    
    showModal(mdlExample)
    
  })
}