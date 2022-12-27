//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract A {
    string public myWord = "Hello";

    function changeWord(string memory _word) external {
        myWord = _word;
    }
}