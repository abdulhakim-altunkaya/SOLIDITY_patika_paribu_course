//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract IfElse {
    function getNumber(uint _x) external pure returns(string memory) {
        if (_x < 10) {
            return "a bigger number we want";
        } else if(_x < 100) {
            return "thats an ideal number";
        }
        return "go away";
    }

    function getNumber2(uint _a) external pure returns(string memory) {
        return _a < 10 ? "a bigger number we want" : _a < 100 ? "thats an ideal number" : "go away";
    }
}