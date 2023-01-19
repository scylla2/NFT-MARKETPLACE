// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIds;
    
    address contractsAddress;

    constructor(address marketplaceAddress) ERC721("Owusuverse Tokens", "OVT") {
        contractsAddress =marketplaceAddress;
        }
    
    //hard disk: storage(a change in state variable mean you are working within the storage)
    //RAM: memory(a change in functin means you are working within memory)
    //string is one of the variable that cause high gas fees in etherum
    }

    function createToken(address player, string memory tokenURI)
        public
        returns (uint256)
    {
        ///@notice create a new Token
        ///@param tokenURI : token URI
        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);
     //set a new id for token to be minted
        _tokenIds.increment();
        uint256 newItemId= _tokenIds.current();

        _mint(msg.sender, newItemId); //mint the token
        _setTokenURI(newItemId,tokenURI); //generate the URI
        setApprovalForAll(contractAddress, true); //grant transaction permission to marketplace
        
        //return toke Id 
        return newItemId;
    }
}