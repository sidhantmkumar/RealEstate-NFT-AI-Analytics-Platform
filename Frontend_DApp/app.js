let provider, signer;
let nft, market;

const MARKETPLACE_ADDRESS = "0xA6473C8e64E86F223A080a25023050Ba683B52D6";
const NFT_ADDRESS = "0x63190fFA0Acc9c832fc036B64401Cd173805b48B";  // your actual NFT contract

// Load ABIs
async function loadABIs() {
    const nftResp = await fetch("nftABI.json");
    const marketResp = await fetch("marketABI.json");

    const nftABI = await nftResp.json();
    const marketABI = await marketResp.json();

    nft = new ethers.Contract(NFT_ADDRESS, nftABI, signer);
    market = new ethers.Contract(MARKETPLACE_ADDRESS, marketABI, signer);

    console.log("ABIs loaded successfully!");
}

/* ---------------------- CONNECT WALLET ---------------------- */
document.getElementById("connectBtn").onclick = async function () {
    if (window.ethereum) {
        provider = new ethers.providers.Web3Provider(window.ethereum);
        await provider.send("eth_requestAccounts", []);
        signer = provider.getSigner();

        document.getElementById("walletAddress").innerText =
            "Connected: " + await signer.getAddress();

        await loadABIs();
    } else {
        alert("Install MetaMask first!");
    }
};

/* ---------------------- MINT NFT ---------------------- */
async function mintNFT() {
    try {
        const id = document.getElementById("mintPropertyId").value;
        const to = document.getElementById("mintTo").value;
        const uri = document.getElementById("metadataURI").value;

        const tx = await nft.mintPropertyNFT(id, to, uri);
        await tx.wait();

        document.getElementById("mintLog").innerText = "NFT Minted ✔ Tx: " + tx.hash;
    } catch (e) {
        document.getElementById("mintLog").innerText = "Error: " + e.message;
    }
}

/* ---------------------- LIST NFT ---------------------- */
async function listNFT() {
    try {
        let tokenId = document.getElementById("listTokenId").value;
        let price = document.getElementById("listPrice").value;

        // must approve first
        await nft.setApprovalForAll(MARKETPLACE_ADDRESS, true);

        const tx = await market.listProperty(tokenId, price);
        await tx.wait();

        document.getElementById("listLog").innerText = "NFT Listed ✔ Tx: " + tx.hash;
    } catch (e) {
        document.getElementById("listLog").innerText = "Error: " + e.message;
    }
}

/* ---------------------- BUY NFT ---------------------- */
async function buyNFT() {
    try {
        let tokenId = document.getElementById("buyTokenId").value;

        let listing = await market.getListing(tokenId);
        let price = listing.price.toString();

        const tx = await market.buyProperty(tokenId, { value: price });
        await tx.wait();

        document.getElementById("buyLog").innerText = "NFT Purchased ✔ Tx: " + tx.hash;
    } catch (e) {
        document.getElementById("buyLog").innerText = "Error: " + e.message;
    }
}
