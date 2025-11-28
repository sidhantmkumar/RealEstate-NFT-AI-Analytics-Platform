# RealEstate-NFT-AI-Analytics-Platform
## 🏡 Real Estate Intelligence Platform

An end-to-end Data Engineering + Machine Learning + Geospatial + Blockchain (NFT Marketplace) + Power BI system built using modern cloud and Web3 technologies.
This project simulates a production-grade property intelligence & tokenization platform — combining Snowflake, Python, ML models, Folium maps, Solidity smart contracts, Sepolia testnet, Web3 frontend, and Power BI analytics.

## 🎯 Project Overview

This Real Estate Intelligence Platform integrates multiple technologies to:

- Clean, structure, and warehouse real-estate data in Snowflake

- Predict property prices using ML

- Enhance data using geospatial enrichment (lat/lon)

- Tokenize properties as NFTs on Ethereum testnet

- Build a Web3 marketplace for buying/selling properties

- Visualize insights in a professional Power BI dashboard

- It is designed as a 0.1% top-tier data engineering + AI + blockchain portfolio project.

## 🚀 Objective

To build a complete real-estate analytics & Web3 platform that provides:

✔ Automated data pipelines (RAW → STAGING → CURATED → GOLD → FINAL_MASTER)

✔ AI-powered price prediction

✔ Geospatial intelligence via property heatmaps

✔ Property NFTs on the Sepolia testnet

✔ A Web3 marketplace to list/buy tokenized real estate

✔ Enterprise-grade BI dashboards

✔ Complete orchestration + documentation for deployment

## 🛠️ Tools & Technologies
**Data Engineering**

- Python (pandas, numpy)

- Snowflake (Warehouse, Staging, Curated, Gold layers)

- SQL (ETL transformations, metadata logging)

**Machine Learning**

- scikit-learn (RandomForest, pipeline, preprocessing)

- Hyperparameter tuning

- Model export (model_best.pkl)

**Geospatial**

- geopy

- folium heatmaps

- HTML map exports

**Blockchain**

- Solidity

- OpenZeppelin

- Sepolia Testnet

- Remix IDE

- MetaMask

**Contracts:**

- PropertyNFT.sol

- PropertyMarketplace.sol

- BlockchainAudit.sol

**Visualization**

- Power BI (5-page dashboard)

- KPI Cards, Donut Charts, Scatterplots, Category Analysis

**Web3 Frontend**

- HTML

- CSS

- JavaScript (ethers.js)

- Collaboration & Delivery

**GitHub repository**

- Full README documentation

- Demo-ready architecture

## 🧩 Methodology (Phase-by-Phase Summary)
**Phase 1 — Data Cleaning & Standardization**

- Cleaned raw dataset

- Parsed price, area, location

- Extracted city/locality

- Exported residential_cleaned.csv

**Phase 2 — Snowflake Data Pipeline**

- Created complete data-warehouse architecture:

- RAW → STAGING → CURATED → GOLD

- Added surrogate keys

- Converted datatypes

- Created curated & gold analytical layers

**Deliverables:**

- Snowflake SQL scripts

- staging, curated, gold tables

**Phase 3 — Metadata Logging**

- Implemented enterprise logging table DATA_LOAD_LOG:

- load timestamp

- source filename

- row count

- status

**Phase 4 — Machine Learning**

- Feature engineering

- Cleaned inputs for model

- Trained RandomForest model

- Tuned with GridSearchCV

- Exported:

- model_best.pkl

- predicted_prices.csv

**Phase 5 — Geospatial Intelligence**

- Generated lat/lon using geopy

- Created HTML maps:

- heatmap_properties.html

- price_map_properties.html

- Saved enriched dataset

**Phase 6 — Blockchain Smart Contracts**

Developed 3 audited contracts:

- PropertyNFT.sol — mint NFTs for property

- PropertyMarketplace.sol — list/buy/delist property NFTs

- BlockchainAudit.sol — record events for Snowflake

- Compiled & tested using Remix.

**Phase 7 — Sepolia Testnet Deployment**

- Setup MetaMask + Sepolia faucet

- Deployed all contracts:

- NFT address

- Marketplace address

- Exported ABIs for frontend

**Phase 8 — Full Integration**

- Merged ML + Geo + Gold into:

**FINAL_MASTER**
- Rows: 14.5K

- Columns include:

- AI predicted price

- Latitude/longitude

- Property metadata

**Phase 9 — Web3 Frontend (DApp)**

- Created:

- index.html

- style.css

- ABI integration

- Wallet Connect

- Fetch listings

- NFT ownership view

**Phase 10 — Power BI Dashboard**

- 5-page dashboard connected to Snowflake:

- KPIs

- City-wise insights

- Price vs Area

- Categories

- Final master table

- Geospatial slicers

- Dashboard delivered as:

- PBIX template

PDF export
## 📈 Key Insights

- Price correlates strongly with area, location, and price_per_sqft.

- RandomForest delivers strong predictive performance.

- Geospatial heatmaps reveal pricing clusters across Chennai.

- NFTs allow properties to be tokenized and listed immutably.

- The marketplace contract enables decentralized property transfers.

- Power BI ties the entire experience together with clean dashboards.

## 🧰 How to Run
**1️⃣ Clone the repository**
- git clone https://github.com/<your-username>/real-estate-intelligence.git

**2️⃣ Install Python dependencies**
- pip install pandas numpy scikit-learn folium geopy

**3️⃣ Load ML Notebook**

- Open the notebook in Colab or Jupyter.

**4️⃣ View the Geospatial Maps**

- Open the HTML files in any browser.

**5️⃣ Interact with the DApp**

- Open frontend_dapp/index.html in a browser with MetaMask installed.

**6️⃣ Explore Power BI Dashboard**

- Open .pbix file using Power BI Desktop.
## 🧾 License

MIT License — free to use and modify.

## 👨‍💻 Author

Sidhant Kumar

Data Engineering | Machine Learning | Blockchain | Power BI

[GitHub](https://github.com/sidhantmkumar) | [LinkedIn](https://in.linkedin.com/in/sidhant-k-1315ba289)

## ✅ Short Summary

A full 0.1% top-tier portfolio project combining Data Engineering, Machine Learning, Blockchain, Geospatial Mapping, and BI — delivering an end-to-end Real Estate Intelligence Platform
