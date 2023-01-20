// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./ERC721A.sol";

contract NFTIsERC721A is Ownable, ERC721A {
    using Strings for uint;

    constructor() ERC721A("BenBK", "BBK") {}

    function mint(uint256 quantity) external onlyOwner {
        _mint(msg.sender, quantity);
    }

    function tokenURI(uint _tokenId) public view virtual override returns (string memory) {
        require(_exists(_tokenId), "URI query for nonexistent token");

        return string(abi.encodePacked("ipfs://bafybeiedxgkw7am2nbkx7fejasxybds5pyt44jq33lj7yn34v3hoti3qde/", _tokenId.toString(), ".json"));
    }
}