// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyFirstNFT is ERC721URIStorage{
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(string => uint8) hashes;
    
    uint256 public tokenCounter;
    constructor () ERC721 ("Dogie", "DOG"){
        tokenCounter = 0;
    }
    
    function awardItem(
        address recipient, 
        string memory hash, 
        string memory metadata) 
        public
        returns (uint256)
        { 
            require(hashes[hash] != 1); 
            hashes[hash] = 1; 
            _tokenIds.increment(); 
            uint256 newItemId = _tokenIds.current(); 
            _mint(recipient, newItemId);  _setTokenURI(newItemId, metadata); 
            return newItemId;
         }
    
    function tokenURI(
        uint256 tokenId
        )
        public
        view
        override(ERC721URIStorage)
        returns (string memory)
        {
            return super.tokenURI(tokenId);
        }
}