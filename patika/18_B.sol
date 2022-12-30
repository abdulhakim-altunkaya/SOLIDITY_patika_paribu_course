//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./17_A.sol";

contract B is A {

    string public myCity = "Oslo";

    function changeWord(string memory _word) external override {
        myWord = _word;
        myCity = "El Paso";
    }
}