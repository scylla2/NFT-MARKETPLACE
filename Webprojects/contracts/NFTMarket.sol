// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";//prevent re-entrancy attacks

contract NFTMarket is ReentrancyGuard{
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;
    Counters.Counter private _itemsSold; //total items sold

    address payable owner; //owner of contract
    uint256 listingPrice = 0.025 ether; //people have to pay to put their NFT on the platform

    constructor(){
        owner = payable(msg.sender)
    }

    Struct MarketItem{
        uint itemId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        bool sold;
    }

    mapping(uint256 =>MarketItem) private IdMarketItem;

    event MarketItemCreated(
        uint indexed itemId,
        ddress indexed nftContract,
        uint256 tokenId,
        address seller,
        address owner,
        bool sold
    );

    //emit MarketItemCreated()

    function getListingPrice() public view returns (uint256){
          return listingPrice;
    }
    function createMarketItem(
        address nftContract,
        uint256 tokenId,
        uint256) public payable nonReentrance{
            require(price >0, "Price cant be zero);
            require(msg.value ==listingPrice, "Price ust be equal to listing price");

            _itemIds.increment()
            uint256 ItemId = _itemIds.cureent();

            idMarket[itemId] = MarketItem(
                itemId,
                nftContract,
                tokenId,
                payableId(msg.sender),
                payable(address(0)),
                price,
                false
            );

                IERC721(bftContract) .safeTransferfrom(msg.sender, address(this),tokenID); 

                emit MarketItemCreated(itemId, nftContract,tokenId, msg.sender, address(0), price, false);          
        }      
}
