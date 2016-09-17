library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)

searchString <- "Kaveri"
if(!exists("searches")) {
  searches <- searchTwitter(searchString, 
                            resultType="recent", 
                            n = 1000)
}

searches_text <- sapply(searches, 
                    function(x) {
                      iconv(x$getText(), 
                            "latin1", "ASCII", 
                            sub="")
                    })

searches_corpus <- Corpus(VectorSource(searches_text))

# List the stop words - words you do not want to
# be listed by frequency for obvious reasons
myStopWords <- c(stopwords('english'),
                 tolower(searchString))

tdm <- TermDocumentMatrix(
  searches_corpus,
  control = list(
    removePunctuation = TRUE,
    stopwords = myStopWords,
    removeNumbers = TRUE,
    tolower=TRUE)
)

tdms <- removeSparseTerms(tdm, 0.99)
m <- as.matrix(tdms)

# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing = TRUE)

# create a data frame with words and their frequencies
dm <- data.frame(word = names(word_freqs), 
                freq = word_freqs)

wordcloud(dm$word, 
          dm$freq, 
          random.color=TRUE,
          random.order = FALSE, 
          colors = brewer.pal(8, "Dark2"))
