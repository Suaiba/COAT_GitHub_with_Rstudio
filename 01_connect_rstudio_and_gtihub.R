#Code to run on console in RStudio to connect RStudio and GitHub
#The first step is to sign up for a (free) GitHub account.

#Then need to create a Personal Access Token (PAT) on GitHub
#To do this type and execute these in console of rstudio

library(usethis)

create_github_token()
#This will take you to the appropriate page on the GitHub website
#You can generate a token a name, remember to and copy it and save it (don’t lose it because it will never appear again!).

#Can store the Personal Access Token in rstudio to connect rstudio to github using:
library(usethis)
library(gitcreds)
gitcreds_set()