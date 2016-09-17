library(base64enc)

library(RCurl)
library(ROAuth)
library(twitteR)
library(httr)

# Set SSL certs globally
options(RCurlOptions=
          list(cainfo = system.file("CurlSSL", 
                                    "cacert.pem", 
                                    package = "RCurl")))

# Obtain this specifically for your Twitter account
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

consumerKey <- "q1JnLdXNBkvgBiGbNYY03plil"
consumerSecret <- "zYRJHaObwBznFsCQwNc0VPwx2dn44TJk2NVJQZ6dN7SDB0Y4VC"
accessToken <- "108017054-wJVau7GYTu538FE2gGPEffjVOK9m0TaYF3y5j0gt"
accessSecret <- "6QOGmp8OIPjIBT5OghjGgoIL6MkPQLvHwoTQxZfQEuYJG"

setup_twitter_oauth(consumerKey, 
                    consumerSecret, 
                    accessToken, 
                    accessSecret)