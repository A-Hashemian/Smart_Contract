pragma solidity ^0.5.2;
import "openzeppelin-solidity/contracts/token/ERC721/ERC721Metadata.sol";
contract Condos is ERC721Metadata {


/*  Id is a public variable used to hold the token ID
and MDTrack is a public hashmap that maps addresses to token IDs, which are of the integer type */
uint32 public Id;
mapping(address => uint32) public MDTrack;






}
