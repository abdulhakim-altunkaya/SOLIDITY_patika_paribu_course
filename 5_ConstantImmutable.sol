//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract ConstantImmutable {
    uint public constant MYORDER = 8;

    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }
}

//Declaring a state variable as constant/immutable allows us to save gas
//constant variables can never be updated
//immutable variables can be updated with Constructor
//constant variables are capital by convention