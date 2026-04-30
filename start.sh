#!/bin/bash

# Run build scripts
./CompileEPK.sh
./CompileJS.sh
./MakeOfflineDownload.sh

echo "Do you want to commit the changes? (yes/no)"
read answer

if [ "$answer" = "yes" ] || [ "$answer" = "y" ]; then
    echo "Enter commit message:"
    read commitmsg

    git add .
    git commit -m "$commitmsg"
    git push origin main --force

    echo "Changes committed and pushed to origin main."
elif [ "$answer" = "no" ] || [ "$answer" = "n" ]; then
    echo "Commit skipped."
else
    echo "Invalid input. Please answer yes or no."
fi
