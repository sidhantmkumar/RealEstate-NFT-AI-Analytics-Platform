// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract PropertyRegistry {

    struct Property {
        uint256 propertyId;
        address owner;
        uint256 price;
        string city;
        string locality;
        string description;
        int256 latitude;
        int256 longitude;
        uint256 timestamp;
        bool isRegistered;
    }

    mapping(uint256 => Property) public properties;

    event PropertyRegistered(
        uint256 propertyId,
        address owner,
        uint256 price,
        string city,
        string locality,
        int256 latitude,
        int256 longitude
    );

    event PropertyUpdated(
        uint256 propertyId,
        uint256 newPrice,
        string newDescription
    );

    event OwnershipTransferred(
        uint256 propertyId,
        address oldOwner,
        address newOwner
    );

    modifier onlyOwner(uint256 _propertyId) {
        require(properties[_propertyId].owner == msg.sender, "Not property owner");
        _;
    }

    function registerProperty(
        uint256 _propertyId,
        uint256 _price,
        string memory _city,
        string memory _locality,
        string memory _description,
        int256 _lat,
        int256 _lon
    ) public 
    {
        require(!properties[_propertyId].isRegistered, "Already registered");

        properties[_propertyId] = Property(
            _propertyId,
            msg.sender,
            _price,
            _city,
            _locality,
            _description,
            _lat,
            _lon,
            block.timestamp,
            true
        );

        emit PropertyRegistered(
            _propertyId,
            msg.sender,
            _price,
            _city,
            _locality,
            _lat,
            _lon
        );
    }

    function updateProperty(
        uint256 _propertyId,
        uint256 _newPrice,
        string memory _newDescription
    ) public onlyOwner(_propertyId) 
    {
        Property storage prop = properties[_propertyId];
        prop.price = _newPrice;
        prop.description = _newDescription;

        emit PropertyUpdated(_propertyId, _newPrice, _newDescription);
    }

    function transferOwnership(
        uint256 _propertyId,
        address _newOwner
    ) public onlyOwner(_propertyId) 
    {
        address old = properties[_propertyId].owner;
        properties[_propertyId].owner = _newOwner;

        emit OwnershipTransferred(_propertyId, old, _newOwner);
    }

    function getProperty(uint256 _propertyId)
        public view returns (Property memory)
    {
        return properties[_propertyId];
    }
}
