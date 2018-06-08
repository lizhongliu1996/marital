

suppressPackageStartupMessages(library(tidyverse))

library(shiny)
library(tidyverse)
library(marital)

flcounty<-floridaCountyMarital@geography
flcounty$NAME<-str_sub(flcounty$NAME,1,str_locate(flcounty$NAME,"County")[,1]-2)
aCounty <- flcounty %>%
  distinct(NAME) %>%
  arrange(NAME)

Mstatus<-c("Never married","Married","Married, spouse absent","Married, other","Widowed","Divorced")

theSex1 <-c("Male")
theSex2 <-c("Female")

ui <- fluidPage(
  sidebarPanel(

    selectInput(inputId = "county",
                "Choose a county:",
                selected = "Miami-Dade",
                choices = aCounty$NAME
    ) , # end selectInput county


    p("The places listed above are cities or census defined places (CDP)
      that the US government identified.")

    ), # end sidebarPanel

  mainPanel(
    fluidRow(
      column(6, plotOutput("maleNeverPlot", height = 250)), # notice the ,
      column(6, plotOutput("femaleNeverPlot", height = 250))
    ), #end of this fluidRow notice comma needed before the next fluidRow()
    fluidRow(
      column(6, plotOutput("malePlot", height = 250)), # notice the ,
      column(6, plotOutput("femalePlot", height = 250))
    ),#end of this fluidRow notice comma needed before the next fluidRow()
    fluidRow(
      column(6, plotOutput("maleAbsentPlot", height = 250)), # notice the ,
      column(6, plotOutput("femaleAbsentPlot", height = 250))
    ),#end of this fluidRow notice comma needed before the next fluidRow()
    fluidRow(
      column(6, plotOutput("maleOtherPlot", height = 250)), # notice the ,
      column(6, plotOutput("femaleOtherPlot", height = 250))
    ),#end of this fluidRow notice comma needed before the next fluidRow()
    fluidRow(
      column(6, plotOutput("maleWidowedPlot", height = 250)), # notice the ,
      column(6, plotOutput("femaleWidowedPlot", height = 250))
    ),#end of this fluidRow notice comma needed before the next fluidRow()
    fluidRow(
      column(6, plotOutput("maleDivorcedPlot", height = 250)), # notice the ,
      column(6, plotOutput("femaleDivorcedPlot", height = 250))
    )#end of this fluidRow notice comma needed before the next fluidRow()
  )#end of mainpanel
) # end UI

server <- function(input, output, session) {
  thePlace <- reactive({
    req(input$county)
    input$county
  })

  output$maleNeverPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[1], theSex1)
  )
  output$femaleNeverPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[1], theSex2)
  )

  output$malePlot <- renderPlot(
    agePlot(thePlace(), Mstatus[2], theSex1)
  )
  output$femalePlot <- renderPlot(
    agePlot(thePlace(), Mstatus[2], theSex2)
  )

  output$maleAbsentPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[3], theSex1)
  )
  output$femaleAbsentPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[3], theSex2)
  )

  output$maleOtherPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[4], theSex1)
  )
  output$femaleOtherPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[4], theSex2)
  )

  output$maleWidowedPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[5], theSex1)
  )
  output$femaleWidowedPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[5], theSex2)
  )

  output$maleDivorcedPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[6], theSex1)
  )
  output$femaleDivorcedPlot <- renderPlot(
    agePlot(thePlace(), Mstatus[6], theSex2)
  )
}

shinyApp(ui, server)




