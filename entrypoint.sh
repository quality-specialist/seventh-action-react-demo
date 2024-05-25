#!/bin/sh

echo "Hello from entrypoint.sh!!"

# Check if Git is initialized
if [ ! -d ".git" ]; then
    echo "Initializing new Git repository..."
    git init
    git remote add origin $REMOTE_URL
    git add -A
    git commit -m "Initial Commit"
    git branch -M main
    echo "Git repository initialized, remote set, and initial commit made."
else
    echo "Git repository already initialized."
    # Check if the remote 'origin' exists
    if git remote get-url origin > /dev/null 2>&1; then
        git remote set-url origin $REMOTE_URL
        echo "Remote URL updated."
    else
        git remote add origin $REMOTE_URL
        echo "Remote 'origin' added."
    fi
fi

echo "Good bye from entrypoint.sh!!"

# Start the main process
exec "$@"
