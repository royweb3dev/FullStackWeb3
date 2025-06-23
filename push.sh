#!/bin/bash
#
# A smart script with an AUTO-GENERATED commit message feature.
# It uses the current directory name to create a descriptive commit message
# and provides a 5-second window to cancel.
#

# --- Load Environment Variables from .env file ---
CONFIG_FILE=".env"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file '$CONFIG_FILE' not found."
    exit 1
fi
export $(grep -v '^#' "$CONFIG_FILE" | xargs)


# --- Auto-Generate Commit Message ---
CURRENT_DIR_NAME=${PWD##*/} 
AUTO_MESSAGE="docs(${CURRENT_DIR_NAME}): update progress and notes"


# --- User Interaction with Timeout ---
echo "-----------------------------------------------------"
echo "AUTO COMMIT MESSAGE:"
echo "$AUTO_MESSAGE"
echo "-----------------------------------------------------"
echo "Committing in 5 seconds. Press Ctrl+C to cancel."

# This `sleep` command simply waits for 5 seconds.
sleep 5


# --- Git Automation ---
echo "Proceeding with auto-generated message."
echo "Staging all files..."
git add .

echo "Committing changes..."
git commit -m "$AUTO_MESSAGE"

echo "Pushing changes to GitHub..."
git push origin main


# --- Check for Success and Notify ---
if [ $? -eq 0 ]; then
    echo "Push successful!"
    echo "Sending notification to Telegram..."
    
    MESSAGE="✅ *Push Successful*%0A%0A"
    MESSAGE+="*Repo:* [FullStackWeb3](https://github.com/royweb3dev/FullStackWeb3)%0A"
    MESSAGE+="*Commit:* \`$AUTO_MESSAGE\`%0A"
    MESSAGE+="*Timestamp:* `date`"
    
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d "chat_id=$TELEGRAM_CHAT_ID" \
        -d "text=$MESSAGE" \
        -d "parse_mode=Markdown" > /dev/null

    echo "Notification sent."
else
    echo "Error: 'git push' failed. Please check your connection or repository status."
fi

echo "---"
echo "Script finished."
