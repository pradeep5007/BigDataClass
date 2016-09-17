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

consumerKey <- "n3feHYGuDPAdN59TPTyskjCWz"
consumerSecret <- "9qs6F8coRAgswnN5BR3x38NQUbg3YCpaJ8yLanJ3KnDIzLKXF5"
accessToken <- "1466213366-a3vdDalX69MJFdn12wO0hlxLafCkQ2MXM19sRJN"
accessSecret <- "fBxhillsv52sUoYPDifnEquoqxIX3H3tI0bK7qeE6KWOU"

setup_twitter_oauth(consumerKey, 
                    consumerSecret, 
                    accessToken, 
                    accessSecret)