# Pablo Patiño
# 20092021
# Git upload automat

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

