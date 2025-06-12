#!/bin/bash
#
# A "smart" script to automate adding, committing, and pushing changes.
# It can accept a commit message as an argument for speed, or prompt for one if none is given.
# Example (auto message): ./push.sh "feat: add new component"
# Example (interactive):  ./push.sh
#

# --- Load Environment Variables ---
CONFIG_FILE="commit_env.sh"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file '$CONFIG_FILE' not found."
    exit 1
fi
source "$CONFIG_FILE"

# --- Determine Commit Message ---
COMMIT_MESSAGE="$1" # Get the first argument passed to the script

if [ -z "$COMMIT_MESSAGE" ]; then
  # If no message was passed as an argument, switch to interactive mode
  echo "No commit message provided. Entering interactive mode..."
  echo "Please enter your commit message:"
  read INTERACTIVE_MESSAGE
  
  if [ -z "$INTERACTIVE_MESSAGE" ]; then
    echo "No commit message entered. Aborting."
    exit 1
  fi
  COMMIT_MESSAGE="$INTERACTIVE_MESSAGE"
fi

# --- Git Automation ---
echo "-----------------------------------"
echo "Commit Message: $COMMIT_MESSAGE"
echo "-----------------------------------"
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
    
    # URL encode the commit message to handle special characters
    ENCODED_MESSAGE=$(printf '%s' "$COMMIT_MESSAGE" | jq -sRr @uri)
    
    # Format the Telegram message
    MESSAGE="✅ *Push Successful*%0A%0A"
    MESSAGE+="*Repo:* [FullStackWeb3]($GITHUB_REPO_URL/tree/main)%0A"
    MESSAGE+="*Commit:* \`$COMMIT_MESSAGE\`%0A"
    MESSAGE+="*Timestamp:* `date`"
    
    # Use curl to send the message
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
