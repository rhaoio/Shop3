//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "../contracts/interfaces/IInventory.sol";


contract Inventory is IInventory, Ownable{

    struct Product {
        string externalId;
        uint256 id;
        uint256 qty;
        uint256 price;
        string name;
        string location;
        string description;
        bool active;
    }

    mapping(string => uint256) private externalIDtoLocalID;
    
    Product[] private products;
    uint256 idCounter;

    
    constructor (){
        idCounter = 0;
    }
    
    event ProductChanged(uint256 productId);

    function addProduct(string calldata _externalId, string calldata _name,uint256 _price, uint256 _qty, string calldata _description, string calldata _location) external override onlyOwner returns(bool success){
        require(bytes(_name).length != 0, "Please enter product name.");
        require(_qty >= 0, "Quantity not allowed to be negative.");
        require(bytes(_description).length != 0, "Please enter a description.");
        require(bytes(_location).length != 0, "Please enter a location.");
        Product memory _product;
        externalIDtoLocalID[_externalId] = idCounter;
        _product.externalId = _externalId;
        _product.id = idCounter;
        _product.name = _name;
        _product.description = _description;
        _product.price = _price;
        _product.qty = _qty;
        _product.location = _location;
        _product.active = true;
        products.push(_product);
        idCounter += 1;
        
        return true;
    }

    function updateProduct(string calldata _externalId, string calldata _name,uint256 _price, uint256 _qty, string calldata _description, string calldata _location) external override onlyOwner returns(bool success){
        require(bytes(_name).length != 0, "Please enter product name.");
        require(_qty >= 0, "Quantity not allowed to be negative.");
        require(bytes(_description).length != 0, "Please enter a description.");
        require(bytes(_location).length != 0, "Please enter a location.");
        require(bytes(_externalId).length != 0, "Please enter a location.");
        
        
        ///Get id from externalId - position of _product in list of all products
        uint256 localId = externalIDtoLocalID[_externalId];
        Product memory _product = products[localId];
        _product.externalId = _externalId;
        _product.name = _name;
        _product.description = _description;
        _product.price = _price;
        _product.qty = _qty;
        _product.location = _location;
        _product.active = true;
        products[localId] = _product;
        emit ProductChanged(localId);
        return true;
    }
    
    function disableProduct(uint256 _id) external override onlyOwner returns(bool success){
        products[_id].active = false;
        success = true;
        return success;
    }
    
    function deleteProduct(uint256 _id) external override onlyOwner returns(bool success){
        return true;
    }

    function setLocation(uint256 _id, string memory _location) external override view onlyOwner returns(bool success){
        ///require(locationToId[_location] > 0,"location already set" );
        return true;
    }

    function updateQty(uint256 _id, uint256 _changeAmt) external override onlyOwner returns(bool ){
        products[_id].qty = _changeAmt;
        return true;
    }

    function changePrice(uint256 _id, uint256 _newPrice) external returns (bool){
        products[_id].price = _newPrice;
        return true;
    }

    function updateLocation(uint256 _id, string calldata _location) external override onlyOwner returns(bool){
        products[_id].location = _location;
        return true;
    }

    function updateDescription(uint256 _id, string calldata _description) external override onlyOwner returns(bool){
        products[_id].description = _description;
        return true;
    }

    function updateExternalId(uint256 _id, string calldata _externalId) override external returns(bool){
        products[_id].externalId = _externalId;
        return true;
    }

    function updateName(uint256 _id, string calldata _name) override external returns(bool){
        products[_id].name = _name;
        return true;
    }

    function updatePrice(uint256 _id, uint256 _newPrice) external returns (bool){
        products[_id].price = _newPrice;
        return true;
    }

    function getProductCount() external override view onlyOwner returns(uint256 count){
        return products.length;
    }
    function getProductById(uint256 _id) external override view onlyOwner returns(string memory externalId, string memory name,uint256 price, uint256 qty, string memory location, string memory description){
        return (products[_id].externalId,products[_id].name,products[_id].price, products[_id].qty, products[_id].location, products[_id].description );
    }

    
    function getQuantity(uint256 _id) external override view onlyOwner returns(uint256){
        return products[_id].qty;
    }

    function getName(uint256 _id) external override view onlyOwner returns(string memory){
        return products[_id].name;
    }

    function getPrice(uint256 _id) external override view onlyOwner returns (uint256 price){
        return products[_id].price;
    }

    function getLocation(uint256 _id) external override view onlyOwner returns(string memory){
        return products[_id].location;
    }

    function getId(string calldata _externalId) external override view onlyOwner returns(uint256){
        return externalIDtoLocalID[_externalId];
    }

    function getDescription(uint256 _id) external override view onlyOwner returns(string memory){
        return products[_id].description;
    }

}