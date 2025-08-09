
########################################################################
# creating a new repository
git init test_repo
cd test_repo
# clonning an existing repository
git clone <url>
# touch new_file.txt
git add new_file.txt
git commit -m "add new_file.txt"
# checking the status of the repository
git status

########################################################################
# viewing the commit history
git log
# viewing the commit history in a single line
git log --oneline
# viewing the commit history with a graphical representation
git log --graph --oneline --all
# viewing the differences between the working directory and the index
git diff
# viewing the differences between the index and the last commit
git diff --cached
# viewing the differences between the working directory and the last commit
git diff HEAD

##########################################################################
# creating a new branch
git branch new_feature
# switching to a different branch
git checkout new_feature
# creating and switching to a new branch in one command
git checkout -b another_feature
# merging a branch into the current branch
git checkout main
git merge new_feature
# deleting a branch
git branch -d another_feature

############################################################################
rm b.txt
git add . -A
git commit -m "remove b.txt"
# viewing the commit history with a specific file
git log -- b.txt
# sharing changes with a remote repository
git push origin main
# pulling changes from a remote repository
git fetch origin