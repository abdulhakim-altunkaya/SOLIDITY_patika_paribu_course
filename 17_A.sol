//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract A {
    string public myWord = "Hello";

    function changeWord(string memory _word) external {
        myWord = _word;
    }

    //Extra lines for contract C:
    event FallbackLog(string message);
    fallback() external {
        emit FallbackLog("fallback triggered");
    }
}