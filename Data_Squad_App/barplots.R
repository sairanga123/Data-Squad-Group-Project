source("server.R")

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

