
library(shiny)
library(shinydashboard)
library(shinyWidgets)

source("SideBarMenu.R")


shinyServer(function (input, output, session) {    
    output$menu<-renderMenu({
      sidebarMenuFunc()
    })
  })
  

