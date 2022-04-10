pragma solidity 0.4.8;

contract Coin {
/*
* @title A Simple Subcurrency Example
* @author Amin Hashemian
* 
* @dev This is only for demo the simple Coin example
*
*/
address public minter;
uint public totalCoins;

event LogCoinsMinted(address deliveredTo, uint amount);
event LogCoinsSent(address sentTo, uint amount);

mapping (address => uint) balances;
function Coin(uint initialCoins) {
minter = msg.sender;
totalCoins = initialCoins;
balances[minter] = initialCoins;
}

function mint(address owner, uint amount) {
if (msg.sender != minter) return;
balances[owner] += amount;
totalCoins += amount;
LogCoinsMinted(owner, amount);
}

function send(address receiver, uint amount) {
if (balances[msg.sender] < amount) return;
balances[msg.sender] -= amount;
balances[receiver] += amount;
LogCoinsSent(receiver, amount);
}

}