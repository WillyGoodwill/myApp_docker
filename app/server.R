
library(shiny)
library(shinydashboard)
library(shinyWidgets)

source("SideBarMenu.R")


server<-function(input, output, session) {    
    output$menu<-renderMenu({
      sidebarMenuFunc()
    })
  }

