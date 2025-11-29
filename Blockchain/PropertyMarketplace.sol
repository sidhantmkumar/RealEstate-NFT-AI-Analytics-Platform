// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PropertyMarketplace is Ownable {

    IERC721 public propertyNFT;

    struct Listing {
        uint256 price;
        address seller;
        bool isListed;
    }

    // tokenId => listing
    mapping(uint256 => Listing) public listings;

    event PropertyListed(uint256 indexed tokenId, address indexed seller, uint256 price);
    event PropertyDelisted(uint256 indexed tokenId, address indexed seller);
    event PropertySold(uint256 indexed tokenId, address indexed seller, address indexed buyer, uint256 price);

    constructor(address nftContract) Ownable(msg.sender) {
        propertyNFT = IERC721(nftContract);
    }

    function listProperty(uint256 tokenId, uint256 price) external {
        require(propertyNFT.ownerOf(tokenId) == msg.sender, "Not the owner");
        require(price > 0, "Price must be > 0");

        listings[tokenId] = Listing(price, msg.sender, true);

        emit PropertyListed(tokenId, msg.sender, price);
    }

    function delistProperty(uint256 tokenId) external {
        Listing memory listing = listings[tokenId];
        require(listing.isListed, "Not listed");
        require(listing.seller == msg.sender, "Not the seller");

        listings[tokenId].isListed = false;

        emit PropertyDelisted(tokenId, msg.sender);
    }

    function buyProperty(uint256 tokenId) external payable {
        Listing memory listing = listings[tokenId];

        require(listing.isListed, "Property not listed");
        require(msg.value == listing.price, "Incorrect price");
        require(listing.seller != address(0), "Invalid seller");

        listings[tokenId].isListed = false;

        // Transfer NFT ownership
        propertyNFT.safeTransferFrom(listing.seller, msg.sender, tokenId);

        // Pay seller
        payable(listing.seller).transfer(msg.value);

        emit PropertySold(tokenId, listing.seller, msg.sender, msg.value);
    }

    // Helper function
    function getListing(uint256 tokenId)
        external
        view
        returns (uint256 price, address seller, bool isListed)
    {
        Listing memory listing = listings[tokenId];
        return (listing.price, listing.seller, listing.isListed);
    }
}
