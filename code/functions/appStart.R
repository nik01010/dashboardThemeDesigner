# Import all Shiny module files -------------------------------------------
importShinyModules <- function(path = "./code/modules/")
{
  moduleFiles <- list.files(path = path, pattern = "\\.[Rr]", recursive = TRUE)
  
  for(i in 1:length(moduleFiles))
  {
    moduleFilePath <- paste0(path, moduleFiles[i])
    source(moduleFilePath)
  }
}
