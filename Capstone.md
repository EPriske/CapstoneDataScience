Capstone
========================================================
author: Erick Priske
date: 09.12.2021
autosize: true

Introduction
========================================================
Complete Github Repository  <https://github.com/EPriske/CapstoneDataScience>.

The goal of this exercise is to create a product to highlight the prediction algorithm that you have built and to provide an interface that can be accessed by others. For this project you must submit:

A Shiny app that takes as input a phrase (multiple words) in a text box input and outputs a prediction of the next word.

A slide deck consisting of no more than 5 slides created with R Studio Presenter (https://support.rstudio.com/hc/en-us/articles/200486468-Authoring-R-Presentations) pitching your algorithm and app as if you were presenting to your boss or an investor.

Summary
========================================================
To be able to realize this project, we used everything we learn on the complete Data Science specialization, from loading data, doing a exploratory analysis, creating a model and functions to do predictions and creating an app and presentation of our work.

The exploratory analysis that I did for this app can be found on the next Rpub publication. 
<https://rpubs.com/EPriske/CapstoneWeek2>

I had to work with a big RAM(1 GB RAM) limitation on "Rstudio Cloud", which made it hard to work with big files and creating the model. I reduce the amount of lines from all the files, to be able to create a model that could work with 1 GB RAM or less, this will limit the accuracy of the predictions. 


Creation of the model
========================================================

After doing the exploratory analysis, I decided to do a sample of each of the three files, I took 25,000 lines from each file, then I cleaned the data, first I removed all capitalization od the words, then I remove any symbol that could interfere with our predictions, after doing this I saved every file in a Tidy file that would be later used.

With the Tidy files done, the next step was to do the different "ngrams" for our predictions. I used the ngram library in R to be able to do this. For this project I used Unigrams, Bigrams, Trigrams and Quadgrams. Everyone of this was saved in a separate file that was used for the Shiny app predictions.

The creation of the Quadgrams was done in a completely separate R file, again because of the RAM limitations.


Shiny App
========================================================

To use the Shiny app please follow the next link

<https://erick-priske.shinyapps.io/Capstone/>

Once the app is open you can start writing in the empty text box, the prediction will be displayed in the right side of the app, and under the prediction there will be displayed what type of function was used (Bigram, Trigram or Quadgram). You can type the prediction or something else and the app will keep trying to predict.

Conclusion
========================================================

Finishing this Capstone project was a big challenge, specially trying to find solution on how to do the complete model with a 1 GB RAM limitation, I had to do a lot of research to try to solve this problem, I sacrificed accuracy for functionality but at the end I was able to make the Shiny app.

Having to go into a complete new topic like Natural Lenguague Prediction was another challenge, since I never learned from it before, researching forums and videos helped me to solve this challenge. At the end I realized that I followed every step that we learn during our 10 course specialization.

