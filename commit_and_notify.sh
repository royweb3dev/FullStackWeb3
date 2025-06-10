#!/bin/bash
#
# Automates commits and sends notifications.
# Reads credentials from a standard .env file.
#

# --- Load Environment Variables from .env file ---
if [ -f .env ]; then
    # Use grep and cut to parse variables, making it robust
    export TELEGRAM_BOT_TOKEN=$(grep TELEGRAM_BOT_TOKEN .env | cut -d '=' -f2)
    export TELEGRAM_CHAT_ID=$(grep TELEGRAM_CHAT_ID .env | cut -d '=' -f2)
    export GITHUB_REPO_URL=$(grep GITHUB_REPO_URL .env | cut -d '=' -f2)
else
    echo "Error: .env file not found. Please create it with your credentials."
    exit 1
fi

# --- The rest of the script is the same ---
echo "Starting the commit and push process..."
git add .

echo "Please enter your commit message:"
read COMMIT_MESSAGE

if [ -z "$COMMIT_MESSAGE" ]; then
    echo "No commit message entered. Aborting."
    exit 1
fi

git commit -m "$COMMIT_MESSAGE"
git push origin main

if [ $? -eq 0 ]; then
    echo "Push successful! Sending notification..."
    MESSAGE="✅ *Push Successful* %0A%0A"
    MESSAGE+="*Repository:* [FullStackWeb3]($GITHUB_REPO_URL) %0A"
    MESSAGE+="*Commit:* \`$COMMIT_MESSAGE\` %0A"
    MESSAGE+="*Timestamp:* $(date)"
    
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d "chat_id=$TELEGRAM_CHAT_ID" -d "text=$MESSAGE" -d "parse_mode=Markdown" > /dev/null
    echo "Notification sent."
else
    echo "Error: 'git push' failed."
fi

echo "---"
echo "Script finished."
