// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract ChristmasNFT is ERC721("ChristmasNFT", "MeryChri") {
    uint256 public nextTokenId = 0;

    constructor() {}

    function mint() public {
        uint256 tokenId = nextTokenId;
        nextTokenId++;
        _safeMint(_msgSender(), tokenId);
    }

    function tokenURI(
        uint256 tokenID
    ) public view override returns (string memory) {
        require(
            _exists(tokenID),
            "ERC721Metadata: URI query for nonexistent token"
        );
        string memory svg = getSVG(tokenID);
        bytes memory json = abi.encodePacked(
            '{"name": "Happy Christmas 2022! #',
            Strings.toString(tokenID),
            '", "description": "This is an NFT made for the 2022 Christmas Exchange. Contract address (0xBD262D0CBa0Dd4B0F9cAe8F60F46DEB4217e51Ae). We wish a merry Christmas!", "image": "data:image/svg+xml;base64,',
            Base64.encode(bytes(svg)),
            '"}'
        );
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(json)
                )
            );
    }

    function getSVG(uint256 tokenId) private pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 400 400">\
                    <style>text{fill:#F5F1E9;30px;font-family:sans-serif;}</style>\
                    <rect width="100%" height="100%" fill="#f52f2c" />\
                    <text x="10%" y="30%" font-size="40px">Merry Christmas 2022!</text>\
                    <text x="10%" y="60%" font-size="30px">#',
                    Strings.toString(tokenId),
                    "</text></svg>"
                )
            );
    }
}
