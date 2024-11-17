// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0

pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";
import "@openzeppelin/contracts@5.0.2/utils/Strings.sol";

contract Joker3 is ERC721, Ownable {
    uint256 private nextToken;
    uint256 public totalOfNft;

    constructor(address initialOwner) ERC721("UVBF", "UVBF") Ownable(initialOwner) {}

    function transferNFT(address from, address to, uint256 tokenId) public {
        safeTransferFrom(from, to, tokenId);
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        string memory baseURI = "https://ipfs.io/ipfs/QmXAe7oyxC7u3FiUEGHy1skhkuuzsRsbdrndQKpTtyBA2u";
        return string(abi.encodePacked(baseURI, Strings.toString(tokenId), "uvbf.jpg"));
    }

    function mint(address to) public {
        uint256 tokenId = nextToken++;
        _mint(to, tokenId);
        totalOfNft++;
    }
}