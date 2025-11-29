// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PropertyNFT is ERC721, Ownable {

    mapping(uint256 => string) public tokenURI_Map;

    // pass name/symbol to ERC721 and set the initial owner for Ownable
    constructor() ERC721("RealEstateProperty", "PROP") Ownable(msg.sender) {}

    function mintPropertyNFT(
        uint256 propertyId,
        address to,
        string memory metadataURI
    ) public onlyOwner 
    {
        require(!_existsToken(propertyId), "NFT already minted");

        _mint(to, propertyId);
        tokenURI_Map[propertyId] = metadataURI;
    }

    function updateTokenURI(uint256 propertyId, string memory newURI)
        public onlyOwner
    {
        require(_existsToken(propertyId), "Token does not exist");
        tokenURI_Map[propertyId] = newURI;
    }

    function tokenURI(uint256 tokenId)
        public view override returns (string memory)
    {
        require(_existsToken(tokenId), "Token does not exist");
        return tokenURI_Map[tokenId];
    }

    /// INTERNAL: replaces deprecated _exists()
    function _existsToken(uint256 tokenId) internal view returns (bool) {
        // use ownerOf / _ownerOf depending on OZ version; _ownerOf is internal and gas-cheaper
        // we use _ownerOf which returns address(0) when not minted in newer OZ
        return _ownerOf(tokenId) != address(0);
    }
}
