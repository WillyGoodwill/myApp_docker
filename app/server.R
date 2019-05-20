
library(shiny)
library(shinydashboard)
library(shinyWidgets)

source("SideBarMenu.R")


shinyServer(function (input, output, session) {    
  rv<-reactiveValues()
  
  output$menu<-renderMenu({
    sidebarMenuFunc()
  })

  observeEvent(input$ctrlBtn,{
    rv$box<-NULL
    k<<-1
    if(!is.null(input$ctrlCountry)&&!is.null(input$ctrlReport)){
      for (i in 1:length(input$ctrlCountry)){
        for (j in 1:length(input$ctrlReport)){
          local({
            rv$box[[k]]<-createBox(k)
          })
          k<-k+1


        }
      }

  output$ui<-renderUI({rv$box})
  }

  })




  })
  

