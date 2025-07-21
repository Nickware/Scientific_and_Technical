#! /usr/bin/bash.exe 
# Homework "Hi,Bash"
# Pablo P. Bonilla
# 29082021
# 0.0.2

echo "Start git"
git init 
echo "Pulling folders"
git pull 
echo "Status:"
gif status
echo "Adding files"
git add -A
echo "To comment enter your comment:"
read COM
git commit -m "$COM" 

