
library(shiny)
library(shinydashboard)
library(shinyWidgets)

source("functions_global.R")


shinyServer(function (input, output, session) {    
  rv<-reactiveValues()

# call functions that creates sidebar menu  
  output$menu<-renderMenu({
    sidebarMenuFunc()
  })

# observe event for Load data button
# creates tabBoxes with tabPanels in dashboardbody
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
  

