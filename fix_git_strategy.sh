#!/bin/bash
#
# Script to fix the repository's .gitignore strategy.
# It replaces all nested .gitignore files with a single root .gitignore
# and uses the .gitkeep convention for empty directories.
# This script is safe to run from the project root directory.
#

echo "🚀 Starting definitive .gitignore strategy correction..."

# Step 1: Find and forcefully delete all incorrect .gitignore files in subdirectories.
echo "--> Removing all nested .gitignore files..."
find . -type f -name ".gitignore" -not -path "./.gitignore" -exec rm -f {} +
echo "✅ All nested .gitignore files have been deleted."

# Step 2: Create .gitkeep files in all daily directories to ensure they are tracked by Git.
echo "--> Creating .gitkeep files in all 'Day*' directories..."
find . -type d -name "Day*" -exec touch {}/.gitkeep \;
echo "✅ .gitkeep files created."

# Step 3: Create a new, comprehensive .gitignore file in the root directory.
# This will overwrite any existing root .gitignore file with a professional template.
echo "--> Creating a professional root .gitignore file..."
cat << EOF > .gitignore
# Environment variables - NEVER commit secrets
.env
.env.*
!.env.example

# Node.js dependencies
/node_modules

# Build output & compiled files
/dist
/build
/.next/
*.o
*.pyc

# OS-generated files
.DS_Store
Thumbs.db

# IDE / Editor specific
.vscode/
*.swp
*~

# Log files
npm-debug.log*
yarn-error.log
debug.log

# Temporary script files
*.sh
EOF
echo "✅ New root .gitignore has been created."

echo "🎉 Correction complete. Your project now follows standard Git practices."
echo "Please review the changes with 'git status' and then commit them."
