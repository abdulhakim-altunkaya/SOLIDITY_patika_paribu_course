//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

interface IA {
    function getElement(uint num) external view returns(uint);
    function getName(string calldata name) external;
}

contract B {
    
}