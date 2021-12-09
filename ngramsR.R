library(ggplot2)
library(ngram)
library(dplyr)
library(RWeka)
library(forcats)
library(tm)
library(stringr)


setwd("/cloud/project/Capstone")
destfile = "./Coursera-SwiftKey.zip"
if(!file.exists(destfile)){
  url = "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
  file <- basename(url)
  download.file(url, file, method="curl")
  unzip(file)
}

twitter <- readLines("/cloud/project/Capstone/final/en_US/en_US.twitter.txt", n = 25000, encoding = 'UTF-8',warn = FALSE)
news <- readLines("/cloud/project/Capstone/final/en_US/en_US.news.txt", n = 25000, encoding = 'UTF-8',warn = FALSE)
blogs <- readLines("/cloud/project/Capstone/final/en_US/en_US.blogs.txt", n = 25000, encoding = 'UTF-8',warn = FALSE)

twitter <- tolower(twitter)
news <- tolower(news)
blogs <- tolower(blogs)

# split at all ".", "," and etc.
twitter <- unlist(strsplit(twitter, "[.,:;!?(){}<>]+" ))
news <- unlist(strsplit(news, "[.,:;!?(){}<>]+" ))
blogs <- unlist(strsplit(blogs, "[.,:;!?(){}<>]+" ))

# replace all non-alphanumeric characters with a space at the beginning/end of a word.
twitter <- gsub("^[^a-z0-9]+|[^a-z0-9]+$", " ", twitter) # at the begining/end of a line
twitter <- gsub("[^a-z0-9]+\\s", " ", twitter) # before space
twitter <- gsub("\\s[^a-z0-9]+", " ", twitter) # after space
twitter <- gsub("\\s+", " ", twitter) # remove mutiple spaces
twitter <- str_trim(twitter) # remove spaces at the beginning/end of the line
saveRDS(twitter, file = "Tidy_twitter")

news <- gsub("^[^a-z0-9]+|[^a-z0-9]+$", " ", news) # at the begining/end of a line
news <- gsub("[^a-z0-9]+\\s", " ", news) # before space
news <- gsub("\\s[^a-z0-9]+", " ", news) # after space
news <- gsub("\\s+", " ", news) # remove mutiple spaces
news <- str_trim(news) # remove spaces at the beginning/end of the line
saveRDS(news, file = "Tidy_news") 

blogs <- gsub("^[^a-z0-9]+|[^a-z0-9]+$", " ", blogs) # at the begining/end of a line
blogs <- gsub("[^a-z0-9]+\\s", " ", blogs) # before space
blogs <- gsub("\\s[^a-z0-9]+", " ", blogs) # after space
blogs <- gsub("\\s+", " ", blogs) # remove mutiple spaces
blogs <- str_trim(blogs) # remove spaces at the beginning/end of the line
saveRDS(blogs, file = "Tidy_blogs") 

## Training Set

set.seed(99999)

TRblogs <- sample(blogs, length(blogs)*0.05)
TRnews <- sample(news, length(news)*0.05)
TRtwitter <- sample(twitter, length(twitter)*0.05)
Training=c(TRblogs,TRnews,TRtwitter)

unigram <- NGramTokenizer(Training, Weka_control(min = 1,max=1))
saveRDS(unigram, file = "unigram") 
bigram <- NGramTokenizer(Training, Weka_control(min = 2,max= 2))
saveRDS(bigram, file = "bigram") 
trigram <-NGramTokenizer(Training, Weka_control(min = 3, max=3))
saveRDS(trigram, file = "trigram") 