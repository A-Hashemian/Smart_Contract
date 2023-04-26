
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
    
       function balanceOf(address owner) public view returns (uint256) {
        // Get the token balance of the specified address
        return _balances[owner];
    }
    
       function transfer(address to, uint256 value) public returns (bool) {
        // Check that the sender has enough tokens to transfer
        require(value <= _balances[msg.sender]);

        // Update the sender and recipient's token balances
        _balances[msg.sender] -= value;
        _balances[to] += value;

        // Emit a Transfer event
        emit Transfer(msg.sender, to, value);
        return true;
    }
    
      function approve(address spender, uint256 value) public returns (bool) {
        // Approve the specified address to spend the sender's tokens
        _allowed[msg.sender][spender] = value;

        // Emit an Approval event
        emit Approval(msg.sender, spender, value);
        return true;
    }
    
       function transferFrom(address from, address to, uint256 value) public returns (bool) {
        // Check that the sender has enough tokens to transfer and has been approved for the specified spending limit
        require(value <= _balances[from]);
        require(value <= _allowed[from][msg.sender]);

        // Update the sender, recipient, and spender's token balances
        _balances[from] -= value;
        _balances[to] += value;
        _allowed[from][msg.sender] -= value;

        // Emit a Transfer event
        emit Transfer(from, to, value);
        return true;
    }
}
