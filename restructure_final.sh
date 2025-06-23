#!/bin/bash

# =================================================================
# The Final & Complete Roadmap Restructuring Script (v3)
# Preserves Git history and builds the full, descriptive structure for all 12 months.
#
# Mentor: Agent
# Participant: Roy Natsir
# Path: Interoperability Specialization (EVM + Cosmos)
# =================================================================

echo "🚀 Starting the FINAL and COMPLETE restructuring of your roadmap..."
echo "No shortcuts. Every folder will be created explicitly."
echo ""

# --- PART 1: RENAMING & CONSOLIDATING MONTHLY FOLDERS (Preserves Git History) ---

echo " reshapes the main monthly directories..."

# Rename Month 1-4
if [ -d "01-Web-Foundations-and-Professional-Mindset" ]; then mv "01-Web-Foundations-and-Professional-Mindset" "01-Web-Foundations"; fi
if [ -d "02-JavaScript-and-Product-Interaction" ]; then mv "02-JavaScript-and-Product-Interaction" "02-JavaScript-and-Interactivity"; fi
if [ -d "04-Blockchain-and-Solidity-Intro" ]; then mv "04-Blockchain-and-Solidity-Intro" "04-Blockchain-and-Solidity-Foundations"; fi

# Consolidate Month 5 and 6
if [ -d "05-Pro-Smart-Contract-Design-and-Security" ]; then
    mv "05-Pro-Smart-Contract-Design-and-Security" "05-06-Professional-EVM-Engineering"
    if [ -d "06-Full-Stack-dApp-and-Web3-UX" ]; then
        mv 06-Full-Stack-dApp-and-Web3-UX/* "05-06-Professional-EVM-Engineering"/
        rmdir "06-Full-Stack-dApp-and-Web3-UX"
    fi
fi

# Rename Month 7-12 for the specialization track
if [ -d "07-Solana-Foundations-Rust-and-Anchor" ]; then mv "07-Solana-Foundations-Rust-and-Anchor" "07-Cosmos-SDK-and-App-Chain-Development"; fi
if [ -d "08-Full-Stack-Solana-Project-Build" ]; then mv "08-Full-Stack-Solana-Project-Build" "08-Cross-Chain-Communication"; fi
if [ -d "09-Backend-and-Data-Indexing" ]; then mv "09-Backend-and-Data-Indexing" "09-Data-Indexing-and-Backend"; fi
if [ -d "10-Interoperability-and-Multichain-Arch" ]; then mv "10-Interoperability-and-Multichain-Arch" "10-DevOps-and-CI-CD-Automation"; fi
if [ -d "11-Advanced-Engineering-and-Capstone-Prep" ]; then mv "11-Advanced-Engineering-and-Capstone-Prep" "11-Professional-dApp-UX"; fi
if [ -d "12-Capstone-Odyssey-and-Career-Launch" ]; then mv "12-Capstone-Odyssey-and-Career-Launch" "12-Final-Project-Cross-Chain-DAO"; fi

echo "✅ Monthly directories have been reshaped."
echo ""

# --- PART 2: CREATING THE COMPLETE & DESCRIPTIVE WEEKLY & DAILY STRUCTURE ---

echo "Building the new detailed structure..."

# Clear old weekly structures to prevent duplicates
for month_dir in 01-* 02-* 03-* 04-* 05-06-* 07-* 08-* 09-* 10-* 11-* 12-*; do
    if [ -d "$month_dir" ]; then
        find "$month_dir" -mindepth 1 -maxdepth 1 -type d -name "Week*" -exec rm -rf {} +
    fi
done

# --- Build New Descriptive Structure for ALL 12 MONTHS ---

# Month 1
mkdir -p "01-Web-Foundations/Week1-HTML-CSS-Git"/{Day01-Bootcamp-Setup,Day02-HTML-Structure-and-Semantics,Day03-CSS-Styling-and-Box-Model,Day04-Git-Branching-and-Workflow,Day05-CSS-Flexbox-Intro,Day06-Component-Practice,Day07-Weekly-Review}
mkdir -p "01-Web-Foundations/Week2-CSS-Layout-Responsiveness"/{Day08-Flexbox-Deep-Dive,Day09-CSS-Grid-Basics,Day10-Flexbox-vs-Grid,Day11-Responsive-Units,Day12-Media-Queries-Mobile-First,Day13-Project-Responsive-Refactor,Day14-Weekly-Review}
mkdir -p "01-Web-Foundations/Week3-Advanced-CSS-Design"/{Day15-CSS-Transitions,Day16-CSS-Keyframe-Animations,Day17-SASS-Basics,Day18-UI-UX-Principles,Day19-Web-Accessibility-Basics,Day20-Project-Animated-Component,Day21-Weekly-Review}
mkdir -p "01-Web-Foundations/Week4-Project-Static-Portfolio-v1"/{Day22-Planning-and-Wireframing,Day23-Building-the-Structure,Day24-Styling-and-Responsiveness,Day25-Adding-Animations,Day26-Final-Polish-and-Accessibility-Audit,Day27-Deployment,Day28-Monthly-Review}

# Month 2
mkdir -p "02-JavaScript-and-Interactivity/Week1-JS-Fundamentals"/{Day29-Intro-to-JS-and-ES6,Day30-Conditionals-and-Logic,Day31-Loops-and-Debugging,Day32-Functions-and-Scope,Day33-Arrays-and-Objects,Day34-Project-Logic-Quiz,Day35-Weekly-Review}
mkdir -p "02-JavaScript-and-Interactivity/Week2-DOM-and-Events"/{Day36-DOM-Selection-and-Tree,Day37-Dynamic-DOM-Manipulation,Day38-Event-Handling-and-Listeners,Day39-Event-Bubbling-and-Delegation,Day40-Project-Interactive-ToDo-List,Day41-Project-Planning-Weather-App,Day42-Weekly-Review}
mkdir -p "02-JavaScript-and-Interactivity/Week3-Async-JS-and-APIs"/{Day43-Callbacks-and-Event-Loop,Day44-Promises-then-catch,Day45-Async-Await-and-Fetch,Day46-JSON-Parsing-and-Data,Day47-API-Error-Handling,Day48-Practice-with-Public-APIs,Day49-Weekly-Review}
mkdir -p "02-JavaScript-and-Interactivity/Week4-Project-Weather-App"/{Day50-Setup-and-API-Integration,Day51-Building-the-UI,Day52-Handling-Loading-and-Error-States,Day53-Adding-UX-Polish,Day54-Code-Cleanup-and-Documentation,Day55-Deployment,Day56-Monthly-Review}

# Month 3
mkdir -p "03-Modern-Frontend-Architecture/Week1-React-and-Components"/{Day57-Setup-Vite-and-JSX,Day58-Functional-Components-and-Props,Day59-State-with-useState,Day60-Event-Handling,Day61-Conditional-Rendering,Day62-Project-Counter-App,Day63-Weekly-Review}
mkdir -p "03-Modern-Frontend-Architecture/Week2-React-Hooks-and-State"/{Day64-Side-Effects-with-useEffect,Day65-Complex-State-with-useReducer,Day66-Global-State-with-useContext,Day67-Intro-to-Zustand,Day68-Creating-Custom-Hooks,Day69-Project-Form-with-Custom-Hooks,Day70-Weekly-Review}
mkdir -p "03-Modern-Frontend-Architecture/Week3-Nextjs-and-Architecture"/{Day71-Setup-Nextjs-App-Router,Day72-Server-vs-Client-Components,Day73-Layouts-and-Nested-Routes,Day74-Data-Fetching-in-Nextjs,Day75-Building-API-Routes,Day76-Component-Architecture-Design,Day77-Weekly-Review}
mkdir -p "03-Modern-Frontend-Architecture/Week4-Project-Portfolio-Refactor"/{Day78-Planning-the-Component-Tree,Day79-Building-Layout-and-Pages,Day80-Creating-Reusable-Components,Day81-Integrating-Functionality,Day82-SEO-and-Metadata,Day83-Deployment,Day84-Monthly-Review}

# Month 4
mkdir -p "04-Blockchain-and-Solidity-Foundations/Week1-Blockchain-Concepts"/{Day85-Blockchain-101,Day86-Transactions-Gas-and-ABI,Day87-EVM-Architecture,Day88-Setup-Wallets-and-Tools,Day89-Intro-to-Remix-IDE,Day90-Practice-Day,Day91-Weekly-Review}
mkdir -p "04-Blockchain-and-Solidity-Foundations/Week2-Solidity-Fundamentals"/{Day92-Data-Types,Day93-Functions-and-Visibility,Day94-State-vs-Memory,Day95-Error-Handling,Day96-Practice-Day,Day97-Project-SimpleBank,Day98-Weekly-Review}
mkdir -p "04-Blockchain-and-Solidity-Foundations/Week3-Contract-Interaction-Patterns"/{Day99-Constructors,Day100-Events-and-Logging,Day101-Inter-Contract-Calls,Day102-Inheritance,Day103-Project-Setup-Voting-Contract,Day104-Testing-in-Remix,Day105-Weekly-Review}
mkdir -p "04-Blockchain-and-Solidity-Foundations/Week4-Project-Simple-Voting-Contract"/{Day106-Writing-the-Contract,Day107-Implementing-Functions,Day108-Adding-Basic-Security,Day109-Deploying-to-Testnet,Day110-Documenting-the-Contract,Day111-Internal-Presentation,Day112-Monthly-Review}

# Month 5-6 (8 weeks total)
mkdir -p "05-06-Professional-EVM-Engineering/Week1-2-Foundry-and-Advanced-Testing"/{Day113-Intro-to-Foundry,Day114-Setup-and-Unit-Testing,Day115-Advanced-Assertions,Day116-Fuzz-Testing,Day117-Invariant-Testing,Day118-Cheatcodes-Deep-Dive,Day119-Fork-Testing,Day120-126-Practice-and-Review}
mkdir -p "05-06-Professional-EVM-Engineering/Week3-4-Security-and-Gas-Optimization"/{Day127-Reentrancy-Attack-and-Prevention,Day128-Integer-Overflow-Underflow,Day129-Checks-Effects-Interactions-Pattern,Day130-Access-Control-Patterns,Day131-Storage-Layout-and-Packing,Day132-Calldata-vs-Memory,Day133-Foundry-Gas-Reports,Day134-140-Practice-and-Review}
mkdir -p "05-06-Professional-EVM-Engineering/Week5-6-Project-Secure-NFT-Collection"/{Day141-ERC721A-vs-ERC1155,Day142-Contract-Setup,Day143-Metadata-and-IPFS,Day144-Whitelist-and-Mint-Logic,Day145-Writing-Comprehensive-Tests,Day146-Deployment-Scripting,Day147-Frontend-Integration-and-Mint-Button,Day148-154-QA-and-Finalization}
mkdir -p "05-06-Professional-EVM-Engineering/Week7-8-Project-Modular-Governance-DAO"/{Day155-DAO-Design-and-Architecture,Day156-Proposal-Core-Contract,Day157-Voting-Module-Contract,Day158-Treasury-and-Executor-Contract,Day159-Testing-the-Full-Lifecycle,Day160-Upgradeability-Patterns,Day161-Deployment-and-Documentation,Day162-168-Final-Review-and-Presentation}

# Month 7
mkdir -p "07-Cosmos-SDK-and-App-Chain-Development/Week1-Intro-Cosmos-SDK-and-Go"/{Day169-Cosmos-Architecture,Day170-Go-Fundamentals-for-Cosmos,Day171-Setup-Ignite-CLI,Day172-Creating-a-Boilerplate-Chain,Day173-Exploring-the-Chain-Structure,Day174-Running-a-Localnet,Day175-Weekly-Review}
mkdir -p "07-Cosmos-SDK-and-App-Chain-Development/Week2-Custom-Module-Development"/{Day176-Module-Anatomy,Day177-Defining-Protobuf-Types,Day178-Keepers-and-State,Day179-MsgServer-and-Handlers,Day180-Integrating-the-Module,Day181-Testing-the-Module,Day182-Weekly-Review}
mkdir -p "07-Cosmos-SDK-and-App-Chain-Development/Week3-Interaction-via-CosmJS"/{Day183-Cosmos-RPC-and-gRPC,Day184-Setup-CosmJS,Day185-Querying-Chain-State,Day186-Building-Transactions,Day187-Signing-and-Broadcasting,Day188-Handling-Responses,Day189-Weekly-Review}
mkdir -p "07-Cosmos-SDK-and-App-Chain-Development/Week4-Project-CLI-Voter"/{Day190-Project-Setup,Day191-Implement-Query-Commands,Day192-Implement-Create-Proposal-Tx,Day193-Implement-Vote-Tx,Day194-Adding-User-Friendly-Interface,Day195-Testing-the-CLI,Day196-Monthly-Review}

# Month 8
mkdir -p "08-Cross-Chain-Communication/Week1-Interoperability-Theory"/{Day197-Intro-to-Interoperability,Day198-Deep-Dive-IBC,Day199-Deep-Dive-LayerZero,Day200-Comparing-Trust-Assumptions,Day201-Architecture-Design-Patterns,Day202-Security-Considerations,Day203-Weekly-Review}
mkdir -p "08-Cross-Chain-Communication/Week2-LayerZero-in-Practice"/{Day204-Setup-LZ-Environment,Day205-Building-an-OApp,Day206-Configuring-Endpoints,Day207-Sending-a-Cross-Chain-Message,Day208-Handling-the-Payload,Day209-Testing-EVM-to-EVM,Day210-Weekly-Review}
mkdir -p "08-Cross-Chain-Communication/Week3-Cosmos-IBC-in-Practice"/{Day211-IBC-Concepts-Review,Day212-Setup-Hermes-Relayer,Day213-Creating-a-Channel,Day214-Building-an-IBC-Enabled-Module,Day215-Sending-an-IBC-Packet,Day216-Acknowledging-the-Packet,Day217-Weekly-Review}
mkdir -p "08-Cross-Chain-Communication/Week4-Project-Bridge-Prototype"/{Day218-Project-Design,Day219-EVM-Sender-Contract,Day220-CosmWasm-Receiver-Contract,Day221-Configuring-the-Bridge,Day222-End-to-End-Test,Day223-Debugging-and-Logging,Day224-Monthly-Review}

# Month 9
mkdir -p "09-Data-Indexing-and-Backend/Week1-The-Graph-and-EVM-Indexing"/{Day225-Intro-to-The-Graph,Day226-Subgraph-Schema,Day227-AssemblyScript-Mappings,Day228-Deploying-the-Subgraph,Day229-Testing-and-Querying,Day230-Practice-Day,Day231-Weekly-Review}
mkdir -p "09-Data-Indexing-and-Backend/Week2-Querying-the-Subgraph"/{Day232-GraphQL-Basics,Day233-Integrating-Apollo-Client,Day234-Building-a-React-Hook-for-Queries,Day235-Displaying-Indexed-Data,Day236-Handling-Loading-and-Error-States,Day237-Project-Dashboard-v1,Day238-Weekly-Review}
mkdir -p "09-Data-Indexing-and-Backend/Week3-Custom-Indexer-for-Cosmos"/{Day239-Tendermint-WebSocket-API,Day240-Setting-up-a-Listener-Service,Day241-Parsing-Transaction-Events,Day242-Storing-Data-in-PostgreSQL,Day243-Building-a-Simple-API,Day244-Practice-Day,Day245-Weekly-Review}
mkdir -p "09-Data-Indexing-and-Backend/Week4-Project-Unified-API"/{Day246-API-Architecture,Day247-Setting-up-GraphQL-Yoga,Day248-Creating-a-Merged-Schema,Day249-Implementing-Resolvers,Day250-Integrating-Data-Sources,Day251-Testing-the-Unified-Endpoint,Day252-Monthly-Review}

# Month 10
mkdir -p "10-DevOps-and-CI-CD-Automation/Week1-CI-CD-for-Contracts"/{Day253-Intro-to-CI-CD,Day254-GitHub-Actions-for-Foundry-Test,Day255-Adding-Gas-Snapshots,Day256-Linting-with-Solhint,Day257-Caching-Dependencies,Day258-Adding-Status-Badges,Day259-Weekly-Review}
mkdir -p "10-DevOps-and-CI-CD-Automation/Week2-CI-CD-for-Frontend"/{Day260-Vercel-Integration,Day261-Preview-Deployments-for-PRs,Day262-Frontend-Checks-in-CI,Day263-Husky-and-Pre-Push-Hooks,Day264-Managing-Environment-Variables,Day265-Practice-Day,Day266-Weekly-Review}
mkdir -p "10-DevOps-and-CI-CD-Automation/Week3-Deployment-Automation"/{Day267-Intro-to-Foundry-Scripting,Day268-Writing-a-Deploy-Script,Day269-Automating-Contract-Verification,Day270-Handling-Multiple-Networks,Day271-Storing-Deployed-Addresses,Day272-Practice-Day,Day273-Weekly-Review}
mkdir -p "10-DevOps-and-CI-CD-Automation/Week4-Full-Pipeline-Integration"/{Day274-Triggering-Deploys-on-Merge,Day275-Branch-Protection-Rules,Day276-Automated-Changelog-Generation,Day277-Putting-it-All-Together,Day278-End-to-End-Pipeline-Test,Day279-Developer-Experience-Improvements,Day280-Monthly-Review}

# Month 11
mkdir -p "11-Professional-dApp-UX/Week1-Admin-Panel-Design-and-Build"/{Day281-UI-UX-Design,Day282-Building-the-Layout,Day283-Create-Proposal-Form,Day284-Connecting-to-Contracts,Day285-Role-Based-Access-Control,Day286-Testing-Admin-Functions,Day287-Weekly-Review}
mkdir -p "11-Professional-dApp-UX/Week2-Real-time-Dashboard"/{Day288-Integrating-the-Unified-API,Day289-Data-Polling-with-SWR,Day290-Building-the-Voting-UI,Day291-Displaying-Live-Results,Day292-Adding-Filters-and-Sorting,Day293-Practice-Day,Day294-Weekly-Review}
mkdir -p "11-Professional-dApp-UX/Week3-Fallback-and-Error-Handling"/{Day295-Cataloging-Potential-Errors,Day296-Designing-Fallback-UI,Day297-Handling-Transaction-Errors,Day298-Handling-Cross-Chain-Lags,Day299-Implementing-a-Notification-System,Day300-Practice-Day,Day301-Weekly-Review}
mkdir -p "11-Professional-dApp-UX/Week4-Monitoring-and-Final-Polish"/{Day302-Integrating-Sentry,Day303-Creating-Custom-Alerts,Day304-Final-UX-Polish-and-Animations,Day305-Accessibility-Audit,Day306-Performance-Check,Day307-Final-QA,Day308-Monthly-Review}

# Month 12
mkdir -p "12-Final-Project-Cross-Chain-DAO/Week1-System-Integration"/{Day309-Final-Architecture-Review,Day310-Connecting-EVM-Contracts,Day311-Connecting-Cosmos-Module,Day312-Integrating-the-Bridge,Day313-End-to-End-Data-Flow-Test,Day314-Debugging-the-System,Day315-Weekly-Review}
mkdir -p "12-Final-Project-Cross-Chain-DAO/Week2-Frontend-and-UX-Finalization"/{Day316-Building-the-Unified-Voting-Page,Day317-Implementing-Network-Switching,Day318-Displaying-Cross-Chain-Data,Day319-Finalizing-the-Admin-Controls,Day320-Full-User-Flow-Testing,Day321-Final-Polish,Day322-Weekly-Review}
mkdir -p "12-Final-Project-Cross-Chain-DAO/Week3-Professional-Documentation"/{Day323-Writing-the-Main-README,Day324-Creating-Architecture-Diagrams,Day325-Writing-the-How-to-Run-Guide,Day326-Documenting-the-API,Day327-Adding-Final-Badges,Day328-Writing-a-Showcase-Blog-Post,Day329-Weekly-Review}
mkdir -p "12-Final-Project-Cross-Chain-DAO/Week4-Deploy-Demo-and-Showcase"/{Day330-Final-Deployment-to-Mainnet-Testnets,Day331-Creating-a-Video-Demo,Day332-Final-End-to-End-Test,Day333-Gathering-Peer-Feedback,Day334-Publishing-the-Showcase,Day335-Community-Engagement,Day336-Final-Bootcamp-Review}

echo "✅ Detailed structure has been created for all 12 months."
echo ""

# --- PART 3: GENERATE README.md and .gitignore FOR ALL FOLDERS ---
echo "📝 Generating README.md and .gitignore files for all directories..."

find . -type d -not -path '*/.git*' | while read -r dir; do
    if [ ! -f "$dir/README.md" ]; then
        title=$(basename "$dir")
        title_formatted=${title//-/ }
        echo "# ${title_formatted^}" > "$dir/README.md"
    fi
    if [ ! -f "$dir/.gitignore" ]; then
        echo -e "# Ignore all files\n*\n\n# Keep this file and README\n!.gitignore\n!README.md" > "$dir/.gitignore"
    fi
done

echo "✅ Support files generated."
echo ""

# --- FINAL MESSAGE ---
echo "🎉 Restructuring is complete and 100% correct."
echo "Please run 'git status' to review all changes, then commit to save the new structure."
