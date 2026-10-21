#This is code to be run in console of rstudio to configure Git with your rstudio project

## install if needed (do this exactly once):
install.packages("usethis")

library(usethis)
#Use your GitHub username and email here
use_git_config(user.name = "xyz", user.email = "xyz@uit")

#If you want default branch to be main for working on use this line
usethis::git_default_branch_configure()