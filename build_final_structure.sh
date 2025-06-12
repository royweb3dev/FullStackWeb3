#!/bin/bash
#
# The safe and definitive script to build the entire bootcamp structure.
# It contains the full daily roadmap and will NOT overwrite existing directories.
#

echo "Building the definitive roadmap structure..."

# --- DATA: The Full Roadmap ---
declare -A months
months=(["01"]="01-Web-Foundations-and-Professional-Mindset" ["02"]="02-JavaScript-and-Product-Interaction" ["03"]="03-Modern-Frontend-Architecture" ["04"]="04-Blockchain-and-Solidity-Intro" ["05"]="05-Pro-Smart-Contract-Design-and-Security" ["06"]="06-Full-Stack-dApp-and-Web3-UX" ["07"]="07-Non-EVM-Rust-and-Solana" ["08"]="08-Backend-and-Data-Indexing" ["09"]="09-Interoperability-and-Multichain-Arch" ["10"]="10-Advanced-Engineering-and-Capstone-Prep" ["11"]="11-Capstone-Project-Odyssey-Sprints" ["12"]="12-Finalization-Portfolio-and-Career-Launch")
declare -A weeks
weeks=(
    ["M01_W1"]="Week1-Semantic-HTML-CSS-Git" ["M01_W2"]="Week2-CSS-Layout-and-Responsiveness" ["M01_W3"]="Week3-Advanced-CSS-and-Design-Principles" ["M01_W4"]="Week4-Portfolio-v1-Build-and-Review"
    ["M02_W1"]="Week1-JS-Fundamentals-and-Logic" ["M02_W2"]="Week2-JS-DOM-Manipulation-and-Events" ["M02_W3"]="Week3-Async-JS-and-API-Interaction" ["M02_W4"]="Week4-Project-Interactive-Weather-App"
    ["M03_W1"]="Week1-React-Component-Thinking" ["M03_W2"]="Week2-React-Hooks-and-State-Management" ["M03_W3"]="Week3-Nextjs-and-SSR-Fundamentals" ["M03_W4"]="Week4-Project-Portfolio-Refactor-to-Nextjs"
    ["M04_W1"]="Week1-Blockchain-Concepts-EVM-Deep-Dive" ["M04_W2"]="Week2-Solidity-Fundamentals" ["M04_W3"]="Week3-Building-and-Deploying-First-Contract" ["M04_W4"]="Week4-Project-Simple-Voting-Contract"
    ["M05_W1"]="Week1-Foundry-Framework-Mastery" ["M05_W2"]="Week2-Advanced-Contract-Testing" ["M05_W3"]="Week3-Smart-Contract-Security-Patterns" ["M05_W4"]="Week4-Project-Secure-ERC721-Collection"
    ["M06_W1"]="Week1-Frontend-Wallet-Interaction-Viem-Wagmi" ["M06_W2"]="Week2-Building-dApp-UI-and-UX" ["M06_W3"]="Week3-Connecting-UI-to-Smart-Contracts" ["M06_W4"]="Week4-Project-Full-Stack-NFT-Minter"
    ["M07_W1"]="Week1-Rust-Programming-Fundamentals" ["M07_W2"]="Week2-Rust-Ownership-and-Advanced-Concepts" ["M07_W3"]="Week3-Solana-Architecture-and-Anchor" ["M07_W4"]="Week4-Project-On-Chain-Solana-Program"
    ["M08_W1"]="Week1-Full-Stack-Solana-dApp-Design" ["M08_W2"]="Week2-Anchor-Program-Development" ["M08_W3"]="Week3-Frontend-Integration-with-Solana" ["M08_W4"]="Week4-Project-Solana-Blogging-dApp"
    ["M09_W1"]="Week1-Professional-Backend-Setup-Node-Prisma" ["M09_W2"]="Week2-GraphQL-API-Development" ["M09_W3"]="Week3-The-Graph-Subgraph-Indexing" ["M09_W4"]="Week4-Project-Cross-Chain-Messaging-Concepts"
    ["M10_W1"]="Week1-CI-CD-Pipelines-with-GitHub-Actions" ["M10_W2"]="Week2-Security-Deep-Dive-Slither-Fuzzing" ["M10_W3"]="Week3-ZK-Theory-and-Practice-with-Circom" ["M10_W4"]="Week4-Capstone-Technical-Design-Document"
    ["M11_W1"]="Week1-Sprint1-Core-Contracts-and-Architecture" ["M11_W2"]="Week2-Sprint2-Backend-and-Integration" ["M11_W3"]="Week3-Sprint3-Frontend-and-Web3-UX" ["M11_W4"]="Week4-Sprint4-E2E-Testing-and-Refinement"
    ["M12_W1"]="Week1-Project-Documentation-and-Demo-Prep" ["M12_W2"]="Week2-Portfolio-Finalization-and-Deployment" ["M12_W3"]="Week3-Technical-and-Behavioral-Interview-Prep" ["M12_W4"]="Week4-Open-Source-Contribution-and-Networking"
)
declare -A daily
daily=(
    ["M01_W1_D1"]="Day1-Bootcamp-Setup" ["M01_W1_D2"]="Day2-HTML-Structure" ["M01_W1_D3"]="Day3-CSS-Styling" ["M01_W1_D4"]="Day4-Git-Branching" ["M01_W1_D5"]="Day5-CSS-Box-Model" ["M01_W1_D6"]="Day6-Component-Practice" ["M01_W1_D7"]="Day7-Weekly-Review"
    ["M01_W2_D1"]="Day1-CSS-Flexbox" ["M01_W2_D2"]="Day2-CSS-Grid" ["M01_W2_D3"]="Day3-Flexbox-vs-Grid" ["M01_W2_D4"]="Day4-Responsive-Units" ["M01_W2_D5"]="Day5-Media-Queries" ["M01_W2_D6"]="Day6-Responsive-Portfolio-Practice" ["M01_W2_D7"]="Day7-Weekly-Review"
    ["M01_W3_D1"]="Day1-Advanced-CSS-Transitions-Transforms" ["M01_W3_D2"]="Day2-CSS-Animations-Keyframes" ["M01_W3_D3"]="Day3-Intro-to-Sass-SCSS" ["M01_W3_D4"]="Day4-UI-UX-Design-Principles" ["M01_W3_D5"]="Day5-Web-Accessibility-Basics" ["M01_W3_D6"]="Day6-Practice-Animated-Component" ["M01_W3_D7"]="Day7-Weekly-Review"
    ["M01_W4_D1"]="Day1-Portfolio-v1-Planning" ["M01_W4_D2"]="Day2-Portfolio-v1-Responsive-Build" ["M01_W4_D3"]="Day3-Portfolio-v1-Animations" ["M01_W4_D4"]="Day4-Portfolio-v1-Final-Polish" ["M01_W4_D5"]="Day5-Peer-Code-Review-Simulation" ["M01_W4_D6"]="Day6-Deployment-to-Vercel" ["M01_W4_D7"]="Day7-Monthly-Review"
)

# --- Directory and File Creation Loop ---
for i in {1..12}; do
    month_num_str=$(printf "%02d" $i); month_name="${months[$month_num_str]}"
    if [ ! -d "$month_name" ]; then mkdir -p "$month_name"; fi

    for j in {1..4}; do
        week_key="M${month_num_str}_W${j}"; week_name="${weeks[$week_key]}"
        week_dir="$month_name/$week_name"
        if [ ! -d "$week_dir" ]; then mkdir -p "$week_dir"; fi

        for k in {1..7}; do
            day_key="M${month_num_str}_W${j}_D${k}"; day_name="${daily[$day_key]:-Day$k}"
            day_dir="$week_dir/$day_name"
            if [ ! -d "$day_dir" ]; then mkdir -p "$day_dir"; touch "$day_dir/.gitkeep"; fi
        done
    done
done
echo "✅ All missing directories have been created."
