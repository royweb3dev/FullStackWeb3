#!/bin/bash
#
# A smart script with an AUTO-GENERATED commit message feature.
# It uses the current directory name to create a descriptive commit message.
# It provides a timeout to override with a custom message.
#

# --- Load Environment Variables from .env file ---
CONFIG_FILE=".env"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file '$CONFIG_FILE' not found."
    exit 1
fi
export $(grep -v '^#' "$CONFIG_FILE" | xargs)


# --- Auto-Generate Commit Message ---
# Get the current directory name (e.g., Day7-Weekly-Review)
CURRENT_DIR_NAME=${PWD##*/} 

# Create a default commit message
# Example: "docs(Day7): update progress and notes"
AUTO_MESSAGE="docs(${CURRENT_DIR_NAME}): update progress and notes"


# --- User Interaction with Timeout ---
echo "-----------------------------------------------------"
echo "AUTO COMMIT MESSAGE:"
echo "$AUTO_MESSAGE"
echo "-----------------------------------------------------"
echo "Committing in 5 seconds. Press Ctrl+C to cancel and enter a custom message."

# This `read` command will wait for 5 seconds for any input.
# If the user presses Enter or does nothing, it continues.
# If the user presses Ctrl+C, the script exits.
read -t 5 -p "(Press Enter to use auto-message now, or wait...) "

# The exit code ($?) will be > 128 if the timeout is reached.
# We will treat timeout as an approval of the auto-message.
if [ $? -ne 0 ] && [ $? -le 128 ]; then
    echo
    echo "Operation cancelled by user. Exiting."
    exit 1
fi

# If we reach here, it means the user either pressed Enter or waited 5 seconds.
COMMIT_MESSAGE="$AUTO_MESSAGE"
echo
echo "Proceeding with auto-generated message."


# --- Git Automation ---
echo "Staging all files..."
git add .

echo "Committing changes..."
git commit -m "$COMMIT_MESSAGE"

echo "Pushing changes to GitHub..."
git push origin main


# --- Check for Success and Notify ---
if [ $? -eq 0 ]; then
    echo "Push successful!"
    echo "Sending notification to Telegram..."
    
    MESSAGE="✅ *Push Successful*%0A%0A"
    MESSAGE+="*Repo:* [FullStackWeb3](https://github.com/royweb3dev/FullStackWeb3)%0A"
    MESSAGE+="*Commit:* \`$COMMIT_MESSAGE\`%0A"
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
