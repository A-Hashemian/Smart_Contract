
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.1/contracts/token/ERC777/ERC777.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.1/contracts/token/ERC777/IERC777Recipient.sol";

contract MyToken is ERC777 {
  constructor(
        uint256 initialSupply,
        address[] memory defaultOperators
    ) ERC777("My Token", "MTK", defaultOperators) {
        _mint(msg.sender, initialSupply, "", "");
    }
    
        function mint(uint256 amount) public {
        _mint(msg.sender, amount, "", "");
    }
    
   function send(address recipient, uint256 amount) public {
        _send(msg.sender, recipient, amount, "", "");
    }
}






