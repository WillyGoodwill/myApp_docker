library(shiny)
library(shinydashboard)

#  function for sidebarmenu that creates dropdown control with checkboxes inside
dropdownButton<-function(label="Select",status=c("default","primary"), ...,width = NULL){
    status<-match.arg(status)
    #content
    html_ul<-list(
        class='dropdown-menu',
        style=if(!is.null(width))
            paste0("width: ",validateCssUnit(width), "; "), #height:500px;
        lapply(X=list(...),FUN=tags$li,style="margin-left: 10px; margin-right: 10px; color: #000000;")

    )
    #dropdown button 
    html_button<-list(
        class=paste0("btn btn-",status,"dropdown-toggle"),
        style=paste0("width: 260px", ";  color: #000000;"),
        type='button',
        `data-toggle` = 'dropdown'
    )
    html_button<-c(html_button,list(label))
    html_button<-c(html_button,list(tags$span(class='caret')))

    #result
    tags$div(
        class='dropdown',
        do.call(tags$button, html_button),
        do.call(tags$ul,html_ul),
        tags$script(
            "$('.dropdown-menu').click(function(e){
                e.stopPropagation();
                });")
            )
            
}
# adding treeview option to children to collapse/expand 
convertMenuItem<-function(mi,tabName){
    mi$children[[1]]$attribs['data-toggle']="tab"
    mi$children[[1]]$attribs['data-value']=tabName
    if (length(mi$attribs$class)>0&&mi$attribs$class=="treeview"){
        mi$attribs$class=NULL
    }
    mi
}

#creating sidebarmenu with controls 
sidebarMenuFunc<-function(){
    sidebarMenu(
        convertMenuItem(
        menuItem("Data",
                tabName="m1",
                icon=icon("th"),
                div(id='test',
                dropdownButton(label = "Check some boxes", status = "primary", width = 260,
                            tags$div(class="container",
                                checkboxGroupInput(inputId = "ctrlReport",'',choices = c('report1','report2','report3','report4'), width=260,selected=c('group1'))
                                )   
                    ),
                checkboxGroupInput(inputId="ctrlCountry",'Select country',
                    choices=c('US','UK','RU','CH'),
                    inline=TRUE,
                    width='260',
                    selected='FI'),
                splitLayout(cellWidth=c('50%','50%'),
                    dateInput(inputId='datefrom','From',format='mm/yyyy',value=Sys.Date()-70),
                    dateInput(inputId='dateto','To',format='mm/yyyy',value=Sys.Date()-50)
                ),
                selectInput(inputId='ctrlFlag','Select risk flag1',c('Y','N'), multiple=FALSE,selected='Y'),
                actionButton(inputId="ctrlBtn",
                    label="Load data",
                    width=260,
                    style='color:white;
                    background-color: #367fa9;
                    border-width: 0px;'
                )
                )
                            
        ),'m1'),
        convertMenuItem(
        menuItem("Analysis",
                tabName="m2",
                icon=icon("th")
                
        ),'m2'),
        convertMenuItem(
        menuItem("Charts",
                tabName="m3",
                icon=icon("bar-chart-o")
                
            ),'m3')
    
    )
}

#function that creates tabBox with tabPanels as the result of reaction on Load data button 
createBox<-function(m){
    tabBox(
        title=paste0("title",m),
        id=paste0("tabset",m),
        #height="350px",
        tabPanel(
            value="1",
            title="tab1"
            
        ),
        tabPanel(
            value="2",
            title="tab2"
            
        ),tabPanel(
            value="3",
            title="tab3"
            
        )

    )

}