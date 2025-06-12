#!/bin/bash
# A smart script to create the v4 directory structure, skipping any that already exist.
echo "Building the definitive v4 structure..."
declare -A months
months=(
    ["01"]="01-Web-Foundations-and-Professional-Mindset" ["02"]="02-JavaScript-and-Product-Interaction"
    ["03"]="03-Modern-Frontend-Architecture" ["04"]="04-Blockchain-and-Solidity-Intro"
    ["05"]="05-Pro-Smart-Contract-Design-and-Security" ["06"]="06-Full-Stack-dApp-and-Web3-UX"
    ["07"]="07-Non-EVM-Rust-and-Solana" ["08"]="08-Backend-and-Data-Indexing"
    ["09"]="09-Interoperability-and-Multichain-Arch" ["10"]="10-Advanced-Engineering-and-Capstone-Prep"
    ["11"]="11-Capstone-Project-Odyssey-Sprints" ["12"]="12-Finalization-Portfolio-and-Career-Launch"
)
declare -A weeks
weeks=(
    ["M01_W1"]="Week1-Semantic-HTML-CSS-Git" ["M01_W2"]="Week2-CSS-Layout-and-Responsiveness" ["M01_W3"]="Week3-Advanced-CSS-and-Design-Principles" ["M01_W4"]="Week4-Portfolio-v1-Build-and-Review"
    ["M02_W1"]="Week1-JS-Fundamentals-and-Logic" ["M02_W2"]="Week2-JS-DOM-Manipulation-and-Events" ["M02_W3"]="Week3-Async-JS-and-API-Interaction" ["M02_W4"]="Week4-Project-Interactive-Weather-App"
    # ... (sisa array minggu ada di sini untuk kelengkapan)
)
for i in {1..12}; do
    month_num=$(printf "%02d" $i); month_name="${months[$month_num]}"
    if [ ! -d "$month_name" ]; then mkdir -p "$month_name"; echo "# Month $month_num: ${month_name//-/ }" > "$month_name/README.md"; fi
    for j in {1..4}; do
        week_key="M${month_num}_W${j}"; week_name="${weeks[$week_key]:-Week$j}"
        week_dir="$month_name/$week_name"
        if [ ! -d "$week_dir" ]; then mkdir -p "$week_dir"; echo "# ${week_name//-/ }" > "$week_dir/README.md"; touch "$week_dir/.gitkeep"; fi
    done
done
echo "Structure created."
