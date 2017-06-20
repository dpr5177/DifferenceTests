#Difference Tests

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  
#Reactive for the effect size that the user selects
es <- reactive({
  return(input$ef.size)
})

#Reactive for the sample size that the user selects
n1 <- reactive({
  return(input$samp.size)
})

global <- reactiveValues(clicked = FALSE)

observe({
  if(length(input$tab1)){
    if(input$tab1) global$clicked <- TRUE
  } 
})

output$table1 <- renderUI({
  if(!is.null(input$tab1) & global$clicked){
    actionButton(inputId= "tab1", label = "", 
                 style = "color: white; 
                  background-color: #1C2C5B;

                 "
                 )
  }
  else{
    actionButton(inputId = "tab1","")
  }
})


output$values <- renderText({
  es1 <- es()
  n2 <- n1()
  sigma1 = 4
  sigma2 = 4
  se1 = sqrt(((sigma1^2)/n2)+((sigma2^2)/n2))
  #diff = es1*1.5 
  diff = es1
  z = diff/se1
  pval = 2*pnorm(z,lower.tail = FALSE)
  
  paste("The p-value of the test is ", round(pval,4))
})
  
})
