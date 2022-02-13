//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/interfaces/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {

    constructor(uint256 initialSupply) ERC20("RHAO", "ME") {
        _mint(msg.sender, initialSupply);
    }

    function _extraMint(address account, uint256 amount) public {
        _mint(account,amount);
    }
}