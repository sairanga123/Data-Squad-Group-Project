timegraph <- function(df){
  
  dp <-df%>%
    group_by(created)%>%
    summarise(n = n())
  
  i = min(dp$created)
  step = 2
  times <- c(i)
  while(i <= max(dp$created)){
    i= i+5*60
    times[step] = i
    step = step+1
  }
  
  bins <- cut(dp$created, breaks = times)
  binneddp <- tapply(dp$n, bins, sum)
  
  count <- c()
  for (i in 1:length(binneddp)) {
    count[i] <- binneddp[[i]]
  }
  
  return(plot(count~times[1:length(times)-1], type = "l", xlab = "time (5min intervals)", main = "Total Tweets over Time"))
}
