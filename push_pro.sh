#!/bin/bash

# --- Load Environment Variables ---
CONFIG_FILE=".env"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "❌ Error: .env file not found."
    exit 1
fi
export $(grep -v '^#' "$CONFIG_FILE" | xargs)

# --- Prepare Commit Info ---
CURRENT_DIR_NAME=${PWD##*/}
TODAY=$(date +%Y-%m-%d)
BRANCH=$(git branch --show-current)

AUTO_MESSAGE="docs(${CURRENT_DIR_NAME}): Day-X progress update on ${TODAY}"

# --- User Input (optional override) ---
echo "-----------------------------------------------------"
echo "AUTO COMMIT MESSAGE:"
echo "$AUTO_MESSAGE"
echo "-----------------------------------------------------"
read -t 6 -p "Press [Enter] to continue, or type a custom message: " USER_INPUT
echo ""

if [[ ! -z "$USER_INPUT" ]]; then
  AUTO_MESSAGE="$USER_INPUT"
fi

# --- Git Preview ---
echo "📂 Git Status:"
git status -s
echo ""
read -t 4 -p "Auto-stage & push in 4 seconds... (Ctrl+C to cancel)" DUMMY
echo ""

# --- Push Sequence ---
git add .
git commit -m "$AUTO_MESSAGE"
git push origin "$BRANCH"

# --- Telegram Notification ---
if [ $? -eq 0 ]; then
    echo "✅ Push successful."
    MESSAGE="✅ *Push Successful*%0A%0A"
    MESSAGE+="*Repo:* [FullStackWeb3](https://github.com/royweb3dev/FullStackWeb3)%0A"
    MESSAGE+="*Branch:* \`$BRANCH\`%0A"
    MESSAGE+="*Commit:* \`$AUTO_MESSAGE\`%0A"
    MESSAGE+="*Timestamp:* `date`"

    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
        -d "chat_id=$TELEGRAM_CHAT_ID" \
        -d "text=$MESSAGE" \
        -d "parse_mode=Markdown" > /dev/null

    echo "📬 Telegram notification sent."
else
    echo "❌ Push failed. Please check connection/repo."
fi

echo "---"
echo "Script finished."
