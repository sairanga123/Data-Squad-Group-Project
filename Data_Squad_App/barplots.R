source("APIs.R")

# barplots with retweets
gun_control_with_retweets <- barplot(c(nrow(gun_control_support), nrow(gun_control_against)), main="Position on Gun Control with Retweets", xlab = "Position", 
                                     ylab = "# of Tweets", names.arg = c("Support", "Against"), horiz = FALSE, col = c("grey", "grey"))
net_neutrality_with_retweets <- barplot(c(nrow(net_neutrality_support), nrow(net_neutrality_against)), main="Position on Net Neutrality with Retweets", xlab = "Position",
                                        ylab = "# of Tweets", names.arg = c("Support", "Against"), horiz = FALSE, col = c("grey", "grey"))
immigration_ban_with_retweets <- barplot(c(nrow(immigration_ban_support), nrow(immigration_ban_against)), main="Position on Immmigration Ban with Retweets", xlab = "Position",
                                           ylab = "# of Tweets", names.arg = c("Support", "Against"), horiz = FALSE, col = c("grey", "grey"))

# barplots without retweets
gun_control_without_retweets <- barplot(c(nrow(gun_control_support_wo_retweets), nrow(gun_control_against_wo_retweets)), main="Position on Gun Control without Retweets", 
                                        xlab = "Position", ylab = "# of Tweets", names.arg = c("Support", "Against"), horiz = FALSE, col = c("grey", "grey"))
net_neutrality_without_retweets <- barplot(c(nrow(net_neutrality_support_wo_retweets), nrow(net_neutrality_against_wo_retweets)), main="Position on Net Neutrality without Retweets", 
                                           xlab = "Position", ylab = "# of Tweets", names.arg = c("Support", "Against"), horiz = FALSE, col = c("grey", "grey"))
immigration_ban_without_retweets <- barplot(c(nrow(immigration_ban_support_wo_retweets), nrow(immigration_ban_against_wo_retweets)), main="Position on Immigration Ban without Retweets", 
                                                xlab = "Position", ylab = "# of Tweets", names.arg = c("Support", "Against"), horiz = FALSE, col = c("grey", "grey"))
citiesbarplot <- function(policy){    
    # grouped bar plots
  if(policy == "gun_control"){  
    data_gun_control_support <- c(nrow(San_Francisco_gun_control_df_support), nrow(Seattle_gun_control_df_support), 
                                  nrow(Washington_gun_control_df_support), nrow(Oklahoma_gun_control_df_support), nrow(Omaha_gun_control_df_support))
    data_gun_control_against <- c(nrow(San_Francisco_gun_control_df_against), nrow(Seattle_gun_control_df_against), 
                                  nrow(Washington_gun_control_df_against), nrow(Oklahoma_gun_control_df_against), nrow(Omaha_gun_control_df_against))
    gun_control_data <- rbind(data_gun_control_support, data_gun_control_against)
    gun_control_grouped <- barplot(gun_control_data, beside = TRUE, names.arg = c("San Francisco", "Seattle", "Washington", "Oklahoma City", "Omaha"), 
                                   main = "Gun Control Position in 5 Cities", xlab = "Position", ylab = "# of Tweets", col = c("green", "orange"))
    legend("topright", legend = c("Support", "Against"), fill = c("green", "orange"))
  }else if(policy == "net_neutrality"){  
     net_neutrality_control_support <- c(nrow(San_Francisco_net_neutrality_df_support), nrow(Seattle_net_neutrality_df_support), 
                                  nrow(Washington_net_neutrality_df_support), nrow(Oklahoma_net_neutrality_df_support), nrow(Omaha_net_neutrality_df_support))
    net_neutrality_control_against <- c(nrow(San_Francisco_net_neutrality_df_against), nrow(Seattle_net_neutrality_df_against), 
                                  nrow(Washington_net_neutrality_df_against), nrow(Oklahoma_net_neutrality_df_against), nrow(Omaha_net_neutrality_df_against))
    net_neutrality_data <- rbind(net_neutrality_control_support, net_neutrality_control_against)
    net_neutrality_grouped <- barplot(net_neutrality_data, beside = TRUE, names.arg = c("San Francisco", "Seattle", "Washington", "Oklahoma City", "Omaha"), 
                                   main = "Net Neutrality Position in 5 Cities", xlab = "Position", ylab = "# of Tweets", col = c("green", "orange"))
    legend("topright", legend = c("Support", "Against"), fill = c("green", "orange"))
  }else if(policy == "immigration"){  
    immigration_ban_control_support <- c(nrow(San_Francisco_immigration_ban_df_support), nrow(Seattle_immigration_ban_df_support), 
                                        nrow(Washington_immigration_ban_df_support), nrow(Oklahoma_immigration_ban_df_support), nrow(Omaha_immigration_ban_df_support))
    immigration_ban_control_against <- c(nrow(San_Francisco_immigration_ban_df_against), nrow(Seattle_immigration_ban_df_against), 
                                        nrow(Washington_immigration_ban_df_against), nrow(Oklahoma_immigration_ban_df_against), nrow(Omaha_immigration_ban_df_against))
    immigration_ban_data <- rbind(immigration_ban_control_support, immigration_ban_control_against)
    immigration_ban_grouped <- barplot(immigration_ban_data, beside = TRUE, names.arg = c("San Francisco", "Seattle", "Washington", "Oklahoma City", "Omaha"), 
                                      main = "Immigration Ban Position in 5 Cities", xlab = "Position", ylab = "# of Tweets", col = c("green", "orange"))
    legend("topright", legend = c("Support", "Against"), fill = c("green", "orange"))
  }
}    
