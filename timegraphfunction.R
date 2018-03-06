timegraph <- function(df){
  dp <-df%>%
    group_by(created)%>%
    summarise(n = n())
  
  i = min(dp$created)
  step = 2
  times <- c(i)
  while(i <= max(dp$created)){
    i= i+900
    times[step] = i
    step = step+1
  }
  
  bins <- cut(dp$created, breaks = times)
  binneddp <- tapply(dp$n, bins, sum)
  
  count <- c()
  for (i in 1:length(binneddp)) {
    count[i] <- binneddp[[i]]
  }
  
  plot(count~times[1:length(times)-1], type = "l", xlab = "time", main = "Total Tweets over Time")
}
