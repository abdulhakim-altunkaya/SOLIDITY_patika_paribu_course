//SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.7;

contract ModifierTest {
    uint public count = 0;
    modifier onlyOwner() {
        require(msg.sender == msg.sender, "you are not owner");
        _;
        count++;
    }

    function seeSecret() external onlyOwner returns(string memory) {
        return "secret word is House";
    }
}