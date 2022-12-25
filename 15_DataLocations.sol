//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract DataTest {
    //storage: state variables
    //memory: data is loaded onto memory
    //calldata: it is like memory but can only be used for function input


    /*STORAGE AND MEMORY POINTERS */
    mapping(address=> uint) public balances;
    balances[msg.sender] = 88;
    //value of above variable will be updated
    function changeValue() external {
        uint storage var1 = balances[msg.sender];
        var1 = 99;
    }
    //value of above variable will not be updated
    function changeValue2() external {
        uint memory var2 = balances[msg.sender];
        var2 = 77;
    }
}