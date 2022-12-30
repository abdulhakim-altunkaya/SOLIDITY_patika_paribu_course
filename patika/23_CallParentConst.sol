//SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.7;

//This is how you can access the constructors of other non-deployed contracts.
//Here when you access their contstructors, it doesnt mean they will be deployed.
//You will see functions and variables of XXX and YYY but their addresses are going to 
//be the same address as Z.

contract XXX {
    string public word;
    address public address1;
    constructor(string memory _w){
        word = _w;
        address1 = address(this);
    }

}

contract YYY {
    uint public myNum;
    address public address2;

    constructor(uint a){
        address2 = address(this);
        myNum = a;
    }

    function changeNumber(uint num) external {
        myNum = num;
    }

}

//If you will not change the inherited functions, then you wont need virtual override
contract Z is XXX, YYY {
    string public anything;

    address public address3;

    constructor(string memory a) XXX("apple") YYY(888) {
        anything = a;
        address3 = address(this);
    }

}

//And this another way doing the same thing as Z
contract P is XXX("pomelo"), YYY(1111) {

    string public anything2;

    address public address4;

    constructor(string memory a) {
        anything2 = a;
        address4 = address(this);
    }
}

//And this another way doing the same thing as Z
contract R is XXX, YYY {

    string public anything3;

    address public address5;

    constructor(string memory a, string memory b, uint numb) XXX(b) YYY(numb) {
        anything3 = a;
        address5 = address(this);
    }
}

