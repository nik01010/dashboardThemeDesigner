# Ui functions ------------------------------------------------------------
uiSidebarMenuItems <- function()
{
  userInterfaceOutput <- tagList(
    
    # sidebarUserPanel(
    #   name = "Anonymous user",
    #   subtitle = Sys.Date()
    # ),

    sidebarSearchForm(
      textId = "txtSidebarSearch",
      buttonId = "cmdSidebarSearch",
      label = "Search"
    ),
    
    menuItem(text = "Create Theme", tabName = "tabHome", icon = icon("cog")),
    
    menuItem(text = "Theme Output", tabName = "tabThemeOutput", icon = icon("list"))

  )
  
  return(userInterfaceOutput)
}
