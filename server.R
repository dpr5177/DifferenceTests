#Difference Tests
#Waiter Experiment
library(shinyjs)
library(shiny)
library(shinyBS)

jsResetCode <- "shinyjs.reset = function() {history.go(0)}"
#disable actionButton function
disableActionButton <- function(id,session) {
  session$sendCustomMessage(type="jsCode",
                            list(code= paste("$('#",id,"').prop('disabled',true)"
                                             ,sep="")))
}

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  
#Reactive for the effect size that the user selects
es <- reactive({
  return(input$ef.size)
})

#Reactive for the sample size that the user selects
n12 <- reactive({
  return(input$samp.size)
})

#Reactive for if random assignment
random <-reactive({
  return(input$rand)
})

#Reactive for the tips
t1 <- reactive({
  return(input$tip1)
})
t2 <- reactive({
  return(input$tip2)
})

#Initial way of changing the color
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
                  height: 35px;
                  width: 35px;
                 "
                 )
  }
  else{
    actionButton(inputId = "tab1",label = "",
                 style = "
                  height: 35px;
                  width: 35px;
                 "
                 )
  }
})

#for the numeric input of tips
val1 <- reactiveValues(tabtip = c())
observe({
  val$tabtip[2] = input$tabtip2
  val$tabtip[3] = input$tabtip3
  val$tabtip[4] = input$tabtip4
  val$tabtip[5] = input$tabtip5
  val$tabtip[6] = input$tabtip6
  val$tabtip[7] = input$tabtip7
  val$tabtip[8] = input$tabtip8
  val$tabtip[9] = input$tabtip9
  val$tabtip[10] = input$tabtip10
  val$tabtip[11] = input$tabtip11
  val$tabtip[12] = input$tabtip12
  val$tabtip[13] = input$tabtip13
  val$tabtip[14] = input$tabtip14
  val$tabtip[15] = input$tabtip15
  val$tabtip[16] = input$tabtip16
  val$tabtip[17] = input$tabtip17
  val$tabtip[18] = input$tabtip18
  val$tabtip[19] = input$tabtip19
  val$tabtip[20] = input$tabtip20
  val$tabtip[21] = input$tabtip21
  val$tabtip[22] = input$tabtip22
  val$tabtip[23] = input$tabtip23
  val$tabtip[24] = input$tabtip24
  val$tabtip[25] = input$tabtip25
  
  #extra two for other things
})

nocantip <- reactive({
  return(input$tabtip27)
})

cantip <- reactive({
  return(input$tabtip28)
})

#Part of the other way
val <- reactiveValues(tab = c())
observe({
  val$tab[2] = input$tab2
  val$tab[3] = input$tab3
  val$tab[4] = input$tab4
  val$tab[5] = input$tab5
  val$tab[6] = input$tab6
  val$tab[7] = input$tab7
  val$tab[8] = input$tab8
  val$tab[9] = input$tab9
  val$tab[10] = input$tab10
  val$tab[11] = input$tab11
  val$tab[12] = input$tab12
  val$tab[13] = input$tab13
  val$tab[14] = input$tab14
  val$tab[15] = input$tab15
  val$tab[16] = input$tab16
  val$tab[17] = input$tab17
  val$tab[18] = input$tab18
  val$tab[19] = input$tab19
  val$tab[20] = input$tab20
  val$tab[21] = input$tab21
  val$tab[22] = input$tab22
  val$tab[23] = input$tab23
  val$tab[24] = input$tab24
  val$tab[25] = input$tab25
  
  #extra 3 for other stuff
  val$tab[26] = input$tab26
  # val$tab[27] = 0
  # val$tab[28] = 0
})
#for the n's
val2 <- reactiveValues(sum3 = 0 )
val3 <- reactiveValues(calc1 = 0)
# observeEvent(val$tab,({
#   ra = random()
#   nums = sample(2:25, 12)
#   if (val$tab[26] == 1){
#     for(j in 2:25){
#       if(j %in% nums){
#         updateNumericInput(session,paste("tabtip",2,sep = ""),value = 10)
#       }
#     }
#   }
# }))
observeEvent(input$reset_button, {js$reset()}) 

#The other way of changing the color
val4 <- reactiveValues(nums1 = 0 )
observeEvent(input$tab26,({
  val4$nums1 = sample(2:25, 12)
}))

#Adding the part for random assignment
observeEvent(val$tab,({
  average = 0
  ra = random()
  nums = val4$nums1
  if (val$tab[26] == 1){
    updateButton(session,paste("tab",26,sep = ""), style = "color: white;
                   background-color: #1C2C5B;", disabled = TRUE)
  }
    
  if(val$tab[26] == 1){
    for(j in 2:25){
      if(j %in% nums){
         updateButton(session,paste("tab",j,sep = ""), style = "color: white;
                    background-color: #1C2C5B;", disabled = TRUE)
        val2$sum3 = val2$sum3 + 1
        
      }
    }
  }
  else {
    for (i in 2:25){
      if (val$tab[i] == 1){
        updateButton(session,paste("tab",i,sep = ""), style = "color: white;
                   background-color: #1C2C5B;", disabled = TRUE)
      }
    }
  }

  #disable from clicking
  for (q in 2:25){
    disableActionButton(paste("tab",q,sep = ""),session)
  }
  
  
  #for tip values
  tip1 = cantip()
  tip2 = nocantip()
  if (val$tab[26] == 1){
    for(k in 2:25){
      if(k %in% nums){
        newVal = rnorm(1, mean = tip1, sd = 2.8)
        #newVal = runif(1, 20.0, 23.0)
        newVal = round(newVal,2)
        updateNumericInput(session,paste("tabtip",k,sep = ""),value = newVal)
      }
    }
  }
  if (val$tab[26] == 1){
    for(l in 2:25){
      if(l %in% nums == FALSE){
        #newVal = runif(1, 18.0, 20.0)
        newVal = rnorm(1, mean = tip2, sd = 2.8)
        newVal = round(newVal,2)
        updateNumericInput(session,paste("tabtip",l,sep = ""),value = newVal)
      }
    }
  }
  
}))

observeEvent(input$tabtip28,({
  nums = val4$nums1
  tip1 = cantip()
  if (val$tab[26] == 1){
    for(k in 2:25){
      if(k %in% nums){
        newVal = rnorm(1, mean = tip1, sd = 2.8)
        #newVal = runif(1, 20.0, 23.0)
        newVal = round(newVal,2)
        updateNumericInput(session,paste("tabtip",k,sep = ""),value = newVal)
      }
    }
  }
}))
observeEvent(input$tabtip27,({
  tip2 = nocantip()
  nums = val4$nums1
  if (val$tab[26] == 1){
    for(l in 2:25){
      if(l %in% nums == FALSE){
        #newVal = runif(1, 18.0, 20.0)
        newVal = rnorm(1, mean =tip2, sd = 2.8)
        newVal = round(newVal,2)
        updateNumericInput(session,paste("tabtip",l,sep = ""),value = newVal)
      }
    }
  }
  
}))

#Reactive for the n1 and n2
n1 <- reactive({
  sum1 = 0
  if(val$tab[26] == 1){
    sum1 = val2$sum3
  }
  else{
    for(i in 2:25){
      if(val$tab[i]==1){
        sum1 = sum1 + 1
      }
    }
  }
  return(sum1)
})
output$n1text <-renderText({
  sum1 = n1()
  paste("n1 = ", sum1 )
})

output$n2text <-renderText({
  sum1 = n1()
  sum2 = 24 -sum1
  paste("n2 = ", sum2 )
})

#Text output for the average values
output$avg1 <-renderText({
  sum1 = n1()
  nums = val4$nums1
  average1 = 0
  average2 = 0
  for(k in 2:25){
    if(k %in% nums){
      average1 = average1 + val$tabtip[k]
    }
  }
  for(g in 2:25){
    if(g %in% nums ==FALSE){
      average2 = average2 + val$tabtip[g]
    }
  }
  sum2 = 24-sum1
  average2 = average2/sum2
  average1 = average1/sum1
  #paste("The average is ", average, "and a the value of the 24th is ", val$tabtip[25], "and the sum I am getting is ", val3$calc1, "The another value is ", val$tab[10])
  paste("The average for the candy tables is  ", round(average1,3),"The average for the no-candy table is", round(average2,3) )
})

#Text output for the effect
output$effect <-renderText({
  sum1 = n1()
  nums = val4$nums1
  average1 = 0
  average2 = 0
  for(k in 2:25){
    if(k %in% nums){
      average1 = average1 + val$tabtip[k]
    }
  }
  for(g in 2:25){
    if(g %in% nums ==FALSE){
      average2 = average2 + val$tabtip[g]
    }
  }
  sum2 = 24-sum1
  average2 = average2/sum2
  average1 = average1/sum1
  diff1 = average1 -average2
  paste("The effect is", round(diff1,3))
})

#Text output for the standard error and the z value and p-value
output$z <-renderText({
  sum1 = n1()
  nums = val4$nums1
  average1 = 0
  average2 = 0
  for(k in 2:25){
    if(k %in% nums){
      average1 = average1 + val$tabtip[k]
    }
  }
  for(g in 2:25){
    if(g %in% nums ==FALSE){
      average2 = average2 + val$tabtip[g]
    }
  }
  sum2 = 24-sum1
  average2 = average2/sum2
  average1 = average1/sum1
  diff1 = average1 -average2
  
  sigma1 = 0
  for(c in 2:25){
    if(val$tab[c]==1){
      newestVal = val$tabtip[c] - average1
      newestVal = abs(newestVal)
      sigma1 = sigma1 + newestVal
    }
  }
  sigma1 = sigma1/sum1
  
  sigma2 = 0
  for(d in 2:25){
    if(val$tab[d]==1){
      newestVal1 = val$tabtip[d] - average1
      newestVal1 = abs(newestVal1)
      sigma2 = sigma2 + newestVal1
    }
  }
  sigma2 = sigma2/sum2
  
  #THe poooled standard deviation
  sigma3 = 0
  average3 = 0
  for(m in 2:25){
    average3 = average3 + val$tabtip[m]
  }
  average3 = average3/24
  for(u in 2:25){
    newestVal3 = val$tabtip[u] - average3
    newestVal3 = abs(newestVal3)
    sigma3 = sigma3 + newestVal3
  }
  sigma3 = sigma3/24
  
  #DF = (s12/n1 + s22/n2)2 / { [ (s12 / n1)2 / (n1 - 1) ] + [ (s22 / n2)2 / (n2 - 1) ] } 
  #DF = (sigma1^2 /sum1 + sigma2^2 / sum2)^2 / (((sigma1^2/sum1)^2/(sum1-1) +(sigma2^2/sum2)^2/(sum2-1)))
  DF = 22
  
  
  se1 = sqrt(((sigma1^2)/sum1)+((sigma2^2)/sum2))
  
  se2 = sigma3*sqrt((1/sum1)+(1/sum2))
  
  z = diff1/se2
  
  #t = [ (x1 - x2) - d ] / SE 
  t1 = diff1 / se2
  pvalue2 = pt(t1,DF,lower.tail = FALSE)
  sum100 = 0
  for(o in 2:25){
    sum100 = sum100 + val$tabtip[o]
  }
  
  pvalue = 2*pnorm(z,lower.tail = FALSE)
  paste("The standard error is",round(se2,3), "The z value is ", round(z,2), "and the p-value is ", round(pvalue,3) )
})

output$values <- renderText({
  es1 <- es()
  n2 <- n12()
  sigma1 = 4
  sigma2 = 4
  se1 = sqrt(((sigma1^2)/n2)+((sigma2^2)/n2))
  #diff = es1*1.5 
  diff = es1
  z = diff/se1
  pval = 2*pnorm(z,lower.tail = FALSE)
  
  paste("The p-value of the test is ", round(pval,4))
})

nForOp1 <- reactive({
  sample(10:20, 1)
})

effectForOp1 <- reactive({
  runif(1, 0.5,1.5 )
})

opt1 <- reactiveValues(sim1 = 0)
observe({
  
  #first one is n
  n10 = nForOp1()
  
  #second one is the effect size
  effectSize = effectForOp1()
  
  
  sigma3 = 3.5
  
  sum5 = n10 / 2
  
  se2 = sigma3*sqrt((1/sum5)+(1/sum5))
  
  DF = n10 - 2
  t1 = effectSize  / se2
  pvalue2 = pt(t1,DF,lower.tail = FALSE)
  
  #third one is the p value
  opt1$sim1 = pvalue2
    
})

output$option1 <- renderTable({
  
  n1 = nForOp1()
  efs1 = effectForOp1()
  
  ctable = matrix(c(n1,efs1),nrow=1)
  colnames(ctable) = c("n","effect size")
  ctable
})
  
output$option1pval <-renderText({
  pvalue1 = opt1$sim1
  paste("pvalue = ", round(pvalue1,4))
})

nForOp2 <- reactive({
  sample(30:40, 1)
})

effectForOp2 <- reactive({
  runif(1, 0.5,1.5 )
})

opt2 <- reactiveValues(sim2 = 0)
observe({
  
  #first one is n
  n10 = nForOp2()
  
  #second one is the effect size
  effectSize = effectForOp1()
  
  
  sigma3 = 3.5
  
  sum5 = n10 / 2
  
  se2 = sigma3*sqrt((1/sum5)+(1/sum5))
  
  DF = n10 - 2
  t1 = effectSize  / se2
  pvalue2 = pt(t1,DF,lower.tail = FALSE)
  
  #third one is the p value
  opt2$sim2 = pvalue2
  
})

output$option2 <- renderTable({
  
  n2 = nForOp2()
  efs2 = effectForOp1()
  
  ctable = matrix(c(n2,efs2),nrow=1)
  colnames(ctable) = c("n","effect size")
  ctable
})

output$option2pval <-renderText({
  pvalue2 = opt2$sim2
  paste("pvalue = ", round(pvalue2,4))
})

nForOp3 <- reactive({
  sample(400:500, 1)
})

effectForOp3 <- reactive({
  runif(1, 1.6,2.4)
})

opt3 <- reactiveValues(sim3 = 0)
observe({
  
  #first one is n
  n10 = nForOp2()
  
  #second one is the effect size
  effectSize = effectForOp3()
  
  
  sigma3 = 3.5
  
  sum5 = n10 / 2
  
  se2 = sigma3*sqrt((1/sum5)+(1/sum5))
  
  DF = n10 - 2
  t1 = effectSize  / se2
  pvalue2 = pt(t1,DF,lower.tail = FALSE)
  
  #third one is the p value
  opt3$sim3 = pvalue2
  
})

output$option3 <- renderTable({
  
  n3 = nForOp2()
  efs3 = effectForOp3()
  
  ctable = matrix(c(n3,efs3),nrow=1)
  colnames(ctable) = c("n","effect size")
  ctable
})

output$option3pval <-renderText({
  pvalue3 = opt3$sim3
  paste("pvalue = ", round(pvalue3,4))
})

nForOp4 <- reactive({
  sample(400:500, 1)
})

effectForOp4 <- reactive({
  runif(1, 0.01,0.1)
})

opt4 <- reactiveValues(sim4 = 0)
observe({
  
  #first one is n
  n10 = nForOp2()
  
  #second one is the effect size
  effectSize = effectForOp4()
  
  
  sigma3 = 3.5
  
  sum5 = n10 / 2
  
  se2 = sigma3*sqrt((1/sum5)+(1/sum5))
  
  DF = n10 - 2
  t1 = effectSize  / se2
  pvalue2 = pt(t1,DF,lower.tail = FALSE)
  
  #third one is the p value
  opt4$sim4 = pvalue2
  
})

output$option4 <- renderTable({
  
  n4 = nForOp2()
  efs4 = effectForOp4()
  
  ctable = matrix(c(n4,efs4),nrow=1)
  colnames(ctable) = c("n","effect size")
  ctable
})

output$option4pval <-renderText({
  pvalue4 = opt4$sim4
  paste("pvalue = ", round(pvalue4,4))
})

#for ordering the question
order <- reactive({
  nums11 = sample(1:4,4)
})

#two different ways of ordering it the if and if else are probably less efficient
output$chooseA <- renderUI({
  numbers1 = order()
  if(numbers1[1] == 1){
    tableOutput("option1")
  }
  else if(numbers1[1] == 2){
    tableOutput("option2")
  }
  else if(numbers1[1] == 3){
    tableOutput("option3")
  }
  else{
    tableOutput("option4")
  }
})

output$chooseB <- renderUI({
  numbers1 = order()
  tableOutput(paste("option",numbers1[2],sep = ""))
})

output$chooseC <- renderUI({
  numbers1 = order()
  tableOutput(paste("option",numbers1[3],sep = ""))
})

output$chooseD <- renderUI({
  numbers1 = order()
  tableOutput(paste("option",numbers1[4],sep = ""))
})

# observe({
#   if (input$h == 1){
#     observeEvent(input$di1,{
#       if (input$di1 == "D"){
#         output$out1 = renderText(
#           paste("<span style= \" color: black\"> Correct! </span>"))
#         
#       }
#       else{
#         output$out1 = renderText(
#           paste("<span style= \" color: red\"> False </span>"))
#       }
#     })
#     observeEvent(input$di2,{
#       if (input$di2 == "B"){
#         output$out2 = renderText(
#           paste("<span style= \" color: black\"> Correct! </span>"))
#       }
#       else{
#         output$out2 = renderText(
#           paste("<span style= \" color: red\"> False </span>"))
#       }
#     })
#     observeEvent(input$di3,{
#       if (input$di3 == "A"){
#         output$out3 = renderText(
#           paste("<span style= \" color: black\"> Correct! </span>"))
#       }
#       else{
#         output$out3 = renderText(
#           paste("<span style= \" color: red\"> False </span>"))
#       }
#     })   
#     observeEvent(input$di4,{
#       if (input$di4 == "C"){
#         output$out4 = renderText(
#           paste("<span style= \" color: black\"> Correct! </span>"))
#       }
#       else{
#         output$out4 = renderText(
#           paste("<span style= \" color: red\"> False </span>"))
#       }
#     })
#     output$answer1 = renderText(
#       paste("The correct answers of Level 1: D B A C"))
#   }
# })

})
