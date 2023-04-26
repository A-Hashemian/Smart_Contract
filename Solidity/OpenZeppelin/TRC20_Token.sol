
pragma solidity ^0.5.8;

contract TRC20Token {
    string public name;          // The name of the token
    string public symbol;        // The symbol of the token
    uint8 public decimals = 18;  // The number of decimals, strongly suggested to be 18
    uint256 public totalSupply;  // The total token supply
    
    mapping (address => uint256) private _balances;  // Mapping of each address's token balance
    mapping (address => mapping (address => uint256)) private _allowed;  // Mapping of each address's approved spending limits
    
     constructor(uint256 initialSupply, string memory tokenName, string memory tokenSymbol) public {
        // Set the initial token supply and allocate all tokens to the contract creator
        totalSupply = initialSupply * 10 ** uint256(decimals);
        _balances[msg.sender] = totalSupply;

        // Set the token name and symbol
        name = tokenName;
        symbol = tokenSymbol;
    }
}
