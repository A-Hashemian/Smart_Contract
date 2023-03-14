
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

//import OpenZeppelin libraries

// Creates a contract called MyToken that inherits from the Ownable and ERC20 libraries
contract MyToken is Ownable, ERC20 {


//The SafeMath library is used to perform mathematical operations on uint256 types and prevent integer overflow or underflow
using SafeMath for uint256;

mapping (address => bool) public minters;
uint256 public maxSupply;

//a mapping called minters that maps address to bool and a uint256 variable called maxSupply are declared


constructor(uint256 initialSupply, uint256 _maxSupply) ERC20("My Token", "MTKN") {

_mint(msg.sender, initialSupply);
maxSupply = _maxSupply;

}


//addMinter and removeMinter functions allow the owner of the contract to add or remove an address from the minters list

function addMinter(address _minter) external onlyOwner {
    minters[_minter] = true;
}

function removeMinter(address _minter) external onlyOwner {
    minters[_minter] = false;
}

function mint(address _to, uint256 _amount) external {
    require(minters[msg.sender], "Only minters can call this function");
    require(totalSupply().add(_amount) <= maxSupply, "Exceeds maximum supply");
    _mint(_to, _amount);
}

function burn(uint256 _amount) external {
    _burn(msg.sender, _amount);
}

}

