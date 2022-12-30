//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract MappingTest {
    mapping(address => uint) public balances;
    function setBalance(uint _balance) external {
        balances[msg.sender] = _balance;
    }
    function deleteBalance() external {
        delete balances[msg.sender];
    }

    mapping(uint => mapping(address => uint)) public balances2;
    function setBetterBalance(uint index, uint balance) external {
        balances2[index][msg.sender] = balance;
    }

}