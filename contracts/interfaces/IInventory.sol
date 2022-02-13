//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;



interface IInventory{

    enum Location {
        Example1,
        Example2
    }

    ///@dev Product manipulation functions here for adding, updating, removing etc
    
    function addProduct(string calldata _externalId, string calldata _name,uint256 _price, uint256 _qty, string calldata _description, string calldata _location ) external returns(bool);

    function updateProduct(string calldata _externalId, string calldata _name,uint256 _price, uint256 _qty, string calldata _description, string calldata _location ) external returns(bool);

    function disableProduct(uint256 _id) external returns(bool);

    function deleteProduct(uint256 _id) external returns(bool);

    function setLocation(uint256 _id, string memory location) external returns(bool);
    
    function updateQty(uint256 _id, uint256 _changeAmt) external returns(bool);
    
    function updatePrice(uint256 _id, uint256 _newPrice) external returns (bool);

    function updateLocation(uint256 _id, string calldata _location) external returns(bool);

    function updateDescription(uint256 _id, string calldata _description) external returns(bool);

    function updateExternalId(uint256 _id, string calldata _externalId) external returns(bool);

    function updateName(uint256 _id, string calldata _name) external returns(bool);

    ///@dev view functions for retrieving data goes here

    function getProductCount() external returns(uint256);

    function getProductById(uint256 _id) external returns(string memory externalId, string memory name,uint256 price, uint256 qty, string memory location, string memory description );

    function getQuantity(uint256 _id) external returns(uint256);

    function getName(uint256 _id) external returns(string memory);

    function getPrice(uint256 _id) external returns (uint256);

    function getLocation(uint256 _id) external returns(string memory);

    function getId(string calldata) external returns(uint256);

    function getDescription(uint256 _id) external returns(string memory);

    
}
