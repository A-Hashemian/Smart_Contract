
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Context.sol";

contract MyToken is ERC1155, Context {
    constructor() ERC1155("https://example.com/token/{id}.json") {
        _mint(_msgSender(), 1, 100, "");
        _mint(_msgSender(), 2, 50, "");
    }

   function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC1155)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
