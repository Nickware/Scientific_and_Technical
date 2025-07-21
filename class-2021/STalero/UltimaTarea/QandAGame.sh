#! bin/bash
#Title:Q&A Game
#Author: Santiago Talero Parra (20202107025)
#version: 0.0.1

#Introduction to the game
echo "Welcome to the QandA Game. Do you think you will reach the master level?"
echo "Let´s start with the game. There are a serie of five questions, answer them right with the letters A, B, C and D. I will give you the master level if you get 4 or 5 questions right"
counter=0 #a counter let increase value depending what values we can associated it

echo "Well, get ready"
echo "1. How many parts has the Newton-Leibniz Theorem?"
echo "A. 3"
echo "B. 7"
echo "C. 2"
echo "D. 4"
#The user give a answer
read answer1
#we consider the cases that the user choose. Each case print a answer 
case $answer1 in
    A)
    echo "Wrong answer"
    ;;
    B)
    echo "Not even near it"
    ;;
    C)
    echo "Correct, the Newton-Leibniz Theorem, better know as Fundamental Theorem of Calculus, has 2 parts that describes integrals and derivates"
    ;;
    D)
    echo "Nop, but you can divide this answer by 2 ;)"
    ;;
esac
#conditional to increase or not the counter if the asnwer is correct or not
if [ $answer1 = C ]; then
  counter=$[counter+1]
fi

#this process is replicate for each question
echo "Okay, next question"
echo "2. Who wrote The Raven?"
echo "A. Mario Vargas Llosa"
echo "B. Santiago Gamboa"
echo "C. J.R.R. Tolkien"
echo "D. Edgar Alan Poe"
read answer2
case $answer2 in
    A)
    echo "Fail"
    ;;
    B)
    echo "Incorrect"
    ;;
    C)
    echo "Wrong"
    ;;
    D)
    echo "Excellent, Edgar Alan Poe had his own essence in psychological terror literature"
    ;;
esac
if [ $answer2 = D ]; then
  counter=$[counter+1]
fi

echo "Alrigth, next question"
echo "3. Guernica was painted by?"
echo "A. Pablo Picasso"
echo "B. Vincent Van Gogh"
echo "C. Leonardo Da Vinci"
echo "D. Antonio García Villarán"
read answer3
case $answer3 in
    A)
    echo "Correct, Pablo Picasso painted Guernia as a message for the world due pain and suffering by the bombing on Guernica that people had during 1937"
    ;;
    B)
    echo "Not even near it"
    ;;
    C)
    echo "No, is not him"
    ;;
    D)
    echo "Wrong, not is Antonio"
    ;;
esac
if [ $answer3 = A ]; then
  counter=$[counter+1]
fi

echo "You're on your way, move to the next question"
echo "4. What is the name of the actual singer of the armenian heavy metal System of a Down band?"
echo "A. José José"
echo "B. James Hetfield"
echo "C. Joey Jordison"
echo "D. Serj Tankian"
read answer4
case $answer4 in
    A)
    echo "Of course no"
    ;;
    B)
    echo "No, he is form another band"
    ;;
    C)
    echo "Fail"
    ;;
    D)
    echo "Correct, Serj is actually an activist who try to protect and recognize the armenian people around the world"
    ;;
esac
if [ $answer4 = D ]; then
  counter=$[counter+1]
fi

echo "Well, the last question"
echo "5. The north magnetic pole is the same at the north geographic direction?"
echo "A. Yes"
echo "B. No"
read answer5
case $answer5 in
    A)
    echo "Wrong, they are inverted"
    ;;
    B)
    echo "Correct, through experiments the human determinated that the magnetic poles and geographical location are inverted each other"
    ;;
esac
if [ $answer5 = B ]; then
  counter=$[counter+1]
fi

echo "So... we´re gonna see you score. If you had 4 or 5 questions answered right, you will become a master. Otherwise. keep reading more."
echo $counter #displays the value from the counter
if [ $counter -gt 3 ]; then  #conditional to give the master title. Otherwise, the user must still trying
    echo "Congratulations, you become a Master, I'm proud of you"
else
    echo "Game over, play again if you wan it"
fi