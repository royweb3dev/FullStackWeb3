#!/bin/bash
#
# A smart script to create the definitive v5 directory structure.
# It intelligently skips any directories that already exist.
#
echo "Building definitive v5 structure, skipping existing folders..."

declare -A months
months=(
    ["01"]="01-Web-Foundations-and-Professional-Mindset"
    ["02"]="02-JavaScript-and-Product-Interaction"
    ["03"]="03-Modern-Frontend-Architecture"
    ["04"]="04-Blockchain-and-Solidity-Intro"
    ["05"]="05-Pro-Smart-Contract-Design-and-Security"
    ["06"]="06-Full-Stack-dApp-and-Web3-UX"
    ["07"]="07-Solana-Foundations-Rust-and-Anchor"
    ["08"]="08-Full-Stack-Solana-Project-Build"
    ["09"]="09-Backend-and-Data-Indexing"
    ["10"]="10-Interoperability-and-Multichain-Arch"
    ["11"]="11-Advanced-Engineering-and-Capstone-Prep"
    ["12"]="12-Capstone-Odyssey-and-Career-Launch"
)

declare -A weeks
weeks=(
    ["M01_W1"]="Week1-Semantic-HTML-CSS-Git" ["M01_W2"]="Week2-CSS-Layout-and-Responsiveness" ["M01_W3"]="Week3-Advanced-CSS-and-Design-Principles" ["M01_W4"]="Week4-Portfolio-v1-Build-and-Review"
    ["M02_W1"]="Week1-JS-Fundamentals-and-Logic" ["M02_W2"]="Week2-JS-DOM-Manipulation-and-Events" ["M02_W3"]="Week3-Async-JS-and-API-Interaction" ["M02_W4"]="Week4-Project-Interactive-Weather-App"
    ["M03_W1"]="Week1-React-Component-Thinking" ["M03_W2"]="Week2-React-Hooks-and-State-Management" ["M03_W3"]="Week3-Nextjs-and-SSR-Fundamentals" ["M03_W4"]="Week4-Project-Portfolio-Refactor-to-Nextjs"
    ["M04_W1"]="Week1-Blockchain-Concepts-and-EVM-Deep-Dive" ["M04_W2"]="Week2-Solidity-Fundamentals" ["M04_W3"]="Week3-Building-and-Deploying-First-Contract" ["M04_W4"]="Week4-Project-Simple-Voting-Contract"
    ["M05_W1"]="Week1-Foundry-Framework-Mastery" ["M05_W2"]="Week2-Advanced-Contract-Testing" ["M05_W3"]="Week3-Smart-Contract-Security-Patterns" ["M05_W4"]="Week4-Project-Secure-ERC721-Collection"
    ["M06_W1"]="Week1-Frontend-Wallet-Interaction-Viem-Wagmi" ["M06_W2"]="Week2-Building-dApp-UI-and-UX" ["M06_W3"]="Week3-Connecting-UI-to-Smart-Contracts" ["M06_W4"]="Week4-Project-Full-Stack-NFT-Minter"
    ["M07_W1"]="Week1-Rust-Programming-Fundamentals" ["M07_W2"]="Week2-Rust-Ownership-and-Advanced-Concepts" ["M07_W3"]="Week3-Solana-Architecture-and-Anchor" ["M07_W4"]="Week4-Project-On-Chain-Solana-Program"
    ["M08_W1"]="Week1-Full-Stack-Solana-dApp-Design" ["M08_W2"]="Week2-Anchor-Program-Development" ["M08_W3"]="Week3-Frontend-Integration-with-Solana" ["M08_W4"]="Week4-Project-Solana-Blogging-dApp"
    ["M09_W1"]="Week1-Professional-Backend-Setup-Node-Prisma" ["M09_W2"]="Week2-GraphQL-API-Development" ["M09_W3"]="Week3-The-Graph-Subgraph-Indexing" ["M09_W4"]="Week4-Project-Integrating-Systems"
    ["M10_W1"]="Week1-Interoperability-Concepts-LayerZero" ["M10_W2"]="Week2-Advanced-Interoperability-Axelar-Cosmos" ["M10_W3"]="Week3-Multichain-Architecture-Patterns" ["M10_W4"]="Week4-Project-Cross-Chain-Messaging-Proof-of-Concept"
    ["M11_W1"]="Week1-DevOps-CI-CD-and-Docker" ["M11_W2"]="Week2-Security-Deep-Dive-Slither-Fuzzing" ["M11_W3"]="Week3-ZK-Theory-and-Practice-with-Circom" ["M11_W4"]="Week4-Capstone-Technical-Design-Document"
    ["M12_W1"]="Week1-Capstone-Sprint-and-Demo-Prep" ["M12_W2"]="Week2-Portfolio-Finalization-and-Deployment" ["M12_W3"]="Week3-Technical-and-Behavioral-Interview-Prep" ["M12_W4"]="Week4-Open-Source-Contribution-and-Networking"
)

for i in {1..12}; do
    month_num=$(printf "%02d" $i); month_name="${months[$month_num]}"
    if [ ! -d "$month_name" ]; then mkdir -p "$month_name"; echo "# Month $month_num: ${month_name//-/ }" > "$month_name/README.md"; fi
    for j in {1..4}; do
        week_key="M${month_num}_W${j}"; week_name="${weeks[$week_key]:-Week$j-Placeholder}"
        week_dir="$month_name/$week_name"
        if [ ! -d "$week_dir" ]; then mkdir -p "$week_dir"; echo "# ${week_name//-/ }" > "$week_dir/README.md"; touch "$week_dir/.gitkeep"; fi
    done
done

echo "Structure check and creation complete."
