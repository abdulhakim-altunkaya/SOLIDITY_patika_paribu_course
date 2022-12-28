//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract A {
    uint public num = 10;

    //If i call this function "external" I will not be able to call
    //it from contract B. So, it must be public
    function changeNum(uint _n) public {
        num = _n;
    }

    function getAddress1() external view returns(address) {
        return address(this);
    }

}

//WAY-1: DIRECTLY CALLING
contract B is A{

    function callParentFunc1(uint nnn) external {
        A.changeNum(nnn); //Because of this line, I need to declare this function as public above.
    }

    function getAddress2() external view returns(address) {
        return address(this);
    }

}

//WAY-2: SUPER 
contract C is A{

    function callParentFunc2(uint nnn) external {
        super.changeNum(nnn); //Because of this line, I need to declare this function as public above.
    }

    function getAddress3() external view returns(address) {
        return address(this);
    }

}