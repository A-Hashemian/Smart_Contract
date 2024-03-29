pragma solidity ^0.5.2;
import "openzeppelin-solidity/contracts/token/ERC721/ERC721Metadata.sol";
contract Condos is ERC721Metadata {


/*  Id is a public variable used to hold the token ID
and MDTrack is a public hashmap that maps addresses to token IDs, which are of the integer type */
uint32 public Id;
mapping(address => uint32) public MDTrack;


// the constructor method that executes on contract deployment
constructor()
ERC721Metadata("Condos Token", "CONDO")
payable public {
Id = 0;
}

//ERC721Metadata Constructor Method
constructor (string memory name, string memory symbol) public {
 _name = name;
 _symbol = symbol;
 _registerInterface(_INTERFACE_ID_ERC721_METADATA);
 }

// The constructor initialized the name (Condos Token) and symbol (CONDO) for my token
// It also registers a new ERC165 interface type for our non-fungible token. I also assign an initial value of 0 to our ID parameter.


// define a method for creating NFTs and a method for transferring NFTs
//createNFT method
function createNFT(address receiver, string calldata metadata)
external returns (uint32)
{
Id++;
_mint(receiver,Id);
_setTokenURI(Id,metadata);
MDTrack[receiver] = Id;
return Id;
}


//The method mints new non-fungible tokens to the receiver's address. It also allows the owner to set initial metadata using the input parameters.
//The metadata is set using the setter for TokenURI from ERC721Metadata.sol
//Every time a new token is issued, the MDTrack hashmap is updated to map the holding address to the token ID.
//transferNFT method
function transferNFT(address sender,address receiver, uint32
transId, string calldata metadata) external
{
_transferFrom(sender, receiver, transId);
_setTokenURI(transId,metadata);
delete MDTrack[sender];
MDTrack[receiver] = Id;
}


}
}
