//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

abstract contract Apple {
    function getFruit() external view virtual returns(string memory);
    function changeFruit(string memory _fru) external virtual;

    function hello() external pure returns(uint) {
        return 888;
    }
}

contract F is Apple {
    string public fruit;

    function getFruit() external view override returns(string memory) {
        return fruit;
    }

    function changeFruit(string memory _fru) external override {
        fruit = _fru;
    }

    function extraFunction() external pure returns(uint) {
        return 555;
    }
}