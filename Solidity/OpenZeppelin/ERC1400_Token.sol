
pragma solidity ^0.8.0;

// Import ERC-1400 token standard and Ownable contract from OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.1/contracts/token/ERC1400/ERC1400.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.3.1/contracts/access/Ownable.sol";


// Create a new contract named MySecurityToken which extends ERC-1400 and Ownable

contract MySecurityToken is ERC1400, Ownable {


// Constructor function which initializes the token with the given parameters
    constructor(
        string memory name,
        string memory symbol,
        uint256 granularity,
        address[] memory controllers,
        bytes32[] memory defaultPartitions
    ) ERC1400(name, symbol, granularity, controllers, defaultPartitions) {}

 // Function to issue new tokens to a specified address, can only be called by the contract owner
    function issue(
        address tokenHolder,
        uint256 amount,
        bytes memory data
    ) public onlyOwner {
        _issue(tokenHolder, amount, data);
    }
}
