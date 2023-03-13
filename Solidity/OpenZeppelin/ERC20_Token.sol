
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

//import OpenZeppelin libraries

contract MyToken is Ownable, ERC20 {}
// Creates a contract called MyToken that inherits from the Ownable and ERC20 libraries
