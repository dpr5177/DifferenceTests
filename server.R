#Difference Tests
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
# global <- reactiveValues(clicked = FALSE)
# 
# observe({
#   if(length(input$tab1)){
#     if(input$tab1) global$clicked <- TRUE
#   } 
# })
# 
# output$table1 <- renderUI({
#   if(!is.null(input$tab1) & global$clicked){
#     actionButton(inputId= "tab1", label = "", 
#                  style = "color: white; 
#                   background-color: #1C2C5B;
#                   height: 35px;
#                   width: 35px;
#                  "
#                  )
#   }
#   else{
#     actionButton(inputId = "tab1",label = "",
#                  style = "
#                   height: 35px;
#                   width: 35px;
#                  "
#                  )
#   }
# })

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
  val$tabtip[27] = input$tabtip27
  val$tabtip[28] = input$tabtip28
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

#Adding the part for random assignment
observeEvent(val$tab,({
  average = 0
  ra = random()
  nums = sample(2:25, 12)
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
  
  #to calc avg1
  for(t in 2:25){
    if(t %in% nums){
      val3$calc1 = val3$calc1 + val$tabtip[t]
    }
  }
  #disable from clicking more if they did random
  if(val$tab[26] == 1){
    for (q in 2:25){
      disableActionButton(paste("tab",q,sep = ""),session)
    }
  }
  
  #for tip values
  if (val$tab[26] == 1){
    for(k in 2:25){
      if(k %in% nums){
        newVal = runif(1, 20.0, 23.0)
        newVal = round(newVal,2)
        updateNumericInput(session,paste("tabtip",k,sep = ""),value = newVal)
      }
    }
  }
  if (val$tab[26] == 1){
    for(l in 2:25){
      if(l %in% nums == FALSE){
        newVal = runif(1, 18.0, 20.0)
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
  #average = val3$calc1
  average1 = 0
  for(g in 2:25){
    if(val$tab[g]==1){
      average1 = average1 + val$tabtip[g]
    }
  }
  average2 = 0
  for(g in 2:25){
    if(val$tab[g]==0){
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
  #average = val3$calc1
  average1 = 0
  for(g in 2:25){
    if(val$tab[g]==1){
      average1 = average1 + val$tabtip[g]
    }
  }
  average2 = 0
  for(g in 2:25){
    if(val$tab[g]==0){
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
  #average = val3$calc1
  average1 = 0
  for(g in 2:25){
    if(val$tab[g]==1){
      average1 = average1 + val$tabtip[g]
    }
  }
  average2 = 0
  for(f in 2:25){
    if(val$tab[f]==0){
      average2 = average2 + val$tabtip[f]
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
  z = diff1/se1
  
  se2 = sigma3*sqrt((1/sum1)+(1/sum2))
  
  #t = [ (x1 - x2) - d ] / SE 
  t1 = diff1 / se2
  pvalue2 = pt(t1,DF,lower.tail = FALSE)
  
  pvalue = 2*pnorm(z,lower.tail = FALSE)
  paste("The standard error is",round(se1,3), "The z value is ", round(z,2), "and the p-value is ", round(pvalue,3), "and the DF is ", round(DF,4), "and the actual pvalue is", round(pvalue2,3), "and the pooled SD is ", sigma3 )
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
  
})
