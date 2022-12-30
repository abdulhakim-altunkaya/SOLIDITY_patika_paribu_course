//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

interface IApple {
    function getFruit() external view returns(string memory);
    function changeFruit(string memory _fru) external;
}

contract D {
    string public fruit;

    function getFruit() external view returns(string memory) {
        return fruit;
    }

    function changeFruit(string memory _fru) external {
        fruit = _fru;
    }

    function extraFunction() external pure returns(uint) {
        return 555;
    }
}