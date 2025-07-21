#Welcome
#!/bin/bash
#Authors: LTriana, ZGómez, MRodríguez
#Date: 10/10/2021
#version: 1.0

#QuestionGame

echo Hi, may I have your name?
read name
echo  "Welcome to the questions game, $name!"
echo -e " If you get all the answers correct, \n\r I will give you the congratulations and master title."
echo " Let's start! Remember to asnwer with "a", "b", "c" or "d". "
#Initialize a counter that will count the correct answers
counter=0

#First question
echo -e "1. First something about our country: \n\rHow many departments does Colombia have?"
echo -e "a. 30 \n\rb. 27 \n\rc. 32 \n\rd. 20"
read "answer"
#Conditional
if [ "$answer" = "c" ]; then
echo -e ">> All right! Colombia is divided in 32 departments \n\rand a capital district."
else
echo -e ">> Oh, maybe you need to study a little more \n\rabout Colombian geography. 
The correct answer is 32. "
fi
#If it is correct add a number to the counter
if [ "$answer" = "c" ]; then
  counter=$[counter+1]
fi

#Second question
echo -e "\n2. A little bit of history does not harm. \n\rWhen was the fall of the Berlin Wall?"
echo -e "a. 1939 \n\rb. 1989 \n\rc. 1985 \n\rd. 1990"
read "answer"
#Conditional
if [ "$answer" = "b" ]; then
echo -e ">> Great! It was on 9 November, \n\rit is a significant date as a symbol of reunification."
else
echo -e ">> Sorry, it is incorrect, actually the fall was \n\ron november 9 of the year 1989."
fi
#If it is correct add a number to the counter
if [ "$answer" = "b" ]; then
  counter=$[counter+1]
fi

#Third question
echo -e "\n3. How many days is a leap year?"
echo -e "a. 366 \n\rb. 365 \n\rc. 364 \n\rd. 360"
read "answer"
if [ "$answer" = "a" ]; then
echo -e ">> Correct, you are doing great!"
else
echo -e ">> It is incorrect, remember that leap years \n\rare years where an extra, or intercalary, day is added \n\rto the end of the shortest month, February. \n\rFor that reason answer is 366."
fi
#If it is correct add a number to the counter
if [ "$answer" = "a" ]; then
  counter=$[counter+1]
fi

#Fourth question
echo -e "\n4. Now, a look at space... \n\rIn which year the first man spacecraft landed on the moon?"
echo -e "a. 1969 \n\rb. 1980 \n\rc. 1999 \n\rd. 1979"
read "answer"
#Conditional
if [ "$answer" = "a" ]; then
echo -e ">> Indeed!, as you may know it was Apollo 11  was \n\rthe spaceflight that first landed humans on the Moon."
else
echo -e ">> Oh, no! Apollo 11  was the spaceflight \n\rthat first landed humans on the Moon in 1969. "
fi
#If it is correct add a number to the counter
if [ "$answer" = "a" ]; then
  counter=$[counter+1]
fi

#Fifth question
echo -e "\n5. Continuing loking toward sky... \n\rWhat is the estimated age of the universe?"
echo -e "a. Around 200 million years.  \n\rb. There are no studies about the topic. \n\rc. 38 billion years. \n\rd. Around 14 billion years."
read "answer"
#Conditional
if [ "$answer" = "d" ]; then
echo ">> You got it! ."
else
echo -e ">> Better luck next time. \n\rAstronomers estimate the age of the universe is \n\r13.8 billion years, nearly 14 billion."
fi
#If it is correct add a number to the counter
if [ "$answer" = "d" ]; then
  counter=$[counter+1]
fi

#Give the score
echo -e "\n\rYour score is $counter..." 

#If the score is bigger than 3 shows the first message, besides the second
if [ $counter -gt 3 ]; then
echo -e "\n\rCongratulations! You are a master. \n\r:)"
 else 
  echo -e "\n\rKnowledge is unlimited, don´t feel bad, \n\ryou can learn new things always, \n\rwe all are masters at different topics! \n\r:)"
fi
