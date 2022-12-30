//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract ConstructorContract {
    string public word;

    constructor(string memory a) {
        word = a;
    }

    function getWord() external view returns(string memory) {
        return word;
    }

    function setWord(string memory _word) external payable {
        require(msg.value >= 1 ether, "send enough money dude");
        word = _word;
    }

}