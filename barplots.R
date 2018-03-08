# source("./APIs.R")

citiesbarplot <- function(policy){    
    # grouped bar plots
  if(policy == "gun_control"){  
    data_gun_control_support <- c(nrow(San_Francisco_gun_control_df_support), nrow(Seattle_gun_control_df_support), 
                                  nrow(Washington_gun_control_df_support), nrow(Oklahoma_gun_control_df_support), nrow(Omaha_gun_control_df_support))
    data_gun_control_against <- c(nrow(San_Francisco_gun_control_df_against), nrow(Seattle_gun_control_df_against), 
                                  nrow(Washington_gun_control_df_against), nrow(Oklahoma_gun_control_df_against), nrow(Omaha_gun_control_df_against))
    gun_control_data <- rbind(data_gun_control_support, data_gun_control_against)
    gun_control_grouped <- barplot(gun_control_data, beside = TRUE, names.arg = c("San Francisco", "Seattle", "Washington DC", "Oklahoma City", "Omaha"), 
                                   main = "Gun Control Position in 5 Cities", xlab = "Position", ylab = "# of Tweets", col = c("green", "orange"))
    legend("topright", legend = c("Support", "Against"), fill = c("green", "orange"))
  }else if(policy == "net_neutrality"){  
     net_neutrality_control_support <- c(nrow(San_Francisco_net_neutrality_df_support), nrow(Seattle_net_neutrality_df_support), 
                                  nrow(Washington_net_neutrality_df_support), nrow(Oklahoma_net_neutrality_df_support), nrow(Omaha_net_neutrality_df_support))
    net_neutrality_control_against <- c(nrow(San_Francisco_net_neutrality_df_against), nrow(Seattle_net_neutrality_df_against), 
                                  nrow(Washington_net_neutrality_df_against), nrow(Oklahoma_net_neutrality_df_against), nrow(Omaha_net_neutrality_df_against))
    net_neutrality_data <- rbind(net_neutrality_control_support, net_neutrality_control_against)
    net_neutrality_grouped <- barplot(net_neutrality_data, beside = TRUE, names.arg = c("San Francisco", "Seattle", "Washington DC", "Oklahoma City", "Omaha"), 
                                   main = "Net Neutrality Position in 5 Cities", xlab = "Position", ylab = "# of Tweets", col = c("green", "orange"))
    legend("topright", legend = c("Support", "Against"), fill = c("green", "orange"))
  }else if(policy == "immigration_ban"){  
    immigration_ban_control_support <- c(nrow(San_Francisco_immigration_ban_df_support), nrow(Seattle_immigration_ban_df_support), 
                                        nrow(Washington_immigration_ban_df_support), nrow(Oklahoma_immigration_ban_df_support), nrow(Omaha_immigration_ban_df_support))
    immigration_ban_control_against <- c(nrow(San_Francisco_immigration_ban_df_against), nrow(Seattle_immigration_ban_df_against), 
                                        nrow(Washington_immigration_ban_df_against), nrow(Oklahoma_immigration_ban_df_against), nrow(Omaha_immigration_ban_df_against))
    immigration_ban_data <- rbind(immigration_ban_control_support, immigration_ban_control_against)
    immigration_ban_grouped <- barplot(immigration_ban_data, beside = TRUE, names.arg = c("San Francisco", "Seattle", "Washington DC", "Oklahoma City", "Omaha"), 
                                      main = "Immigration Ban Position in 5 Cities", xlab = "Position", ylab = "# of Tweets", col = c("green", "orange"))
    legend("topright", legend = c("Support", "Against"), fill = c("green", "orange"))
  }
}    
