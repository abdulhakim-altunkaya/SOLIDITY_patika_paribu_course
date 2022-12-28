//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract A {
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function depositEther1(uint _value) external payable {
    }
    function depositEther2() external payable {
    }

    function getValues() external view returns(uint, uint) {
        return(x, value);
    }

    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

}
//WAY-1: call (19)
//-Base contract file is NOT needed
//-Base contract should be deployed
//-No need for "is", "virtual/override"
//-State of base contract can be changed.

//WAY-2: contract instance (25)
//-Base contract file is needed
//-Base contract should be deployed
//-No need for "is", "virtual/override"
//-State of base contract can be changed.

//WAY-3: direct calling and super (24)
//-Base contract file is needed
//-Base contract does NOT need to be deployed
//-"is", "virtual", "override" are needed
//-state of base contract does NOT change

contract B {
    function assignX1(address otherContract, uint num) external {
        A targetContract = A(otherContract);
        targetContract.setX(num);
    }

    //Or you can do it without contract instance
    function assignX2(address otherContract, uint num) external {
        A(otherContract).setX(num);
    }

    //You can also give other contract name as a type
    function assignX3(A otherContract, uint num) external {
        otherContract.setX(num);
    }

    //PART-2: get multiple values from another contract
    function getAllValues(address otherContract) external view returns(uint, uint) {
        (uint a, uint b) = A(otherContract).getValues();
        return (a, b);
    }
    

    //PART-3: call another contract function and send ether to another contract
    function deposit1(address otherContract, uint _value) external {
        A targetContract = A(otherContract);
        targetContract.depositEther1(_value); 
    }

    //CONTRACT --> CONTRACT
    function deposit2(address otherContract, uint _value) external {
        A targetContract = A(otherContract);
        targetContract.depositEther2{value: _value}(); 
    }

    //CONTRACT --> ACCOUNT
    //You can ignore "send" and "transfer" as they are not recommended
    function transferEther1(address payable otherAccount, uint _value) external {
        (bool success, ) = otherAccount.call{value: _value}("");
        require(success, "call failed");
    } 
    //CONTRACT --> ACCOUNT (TO CONTRACTS WITH FALLBACK/RECEIVE/CONSTRUCTOR PAYABLE)
    //You can ignore "send" and "transfer" as they are not recommended
    function transferEther2(address payable otherAccount, uint _value) external {
        (bool success, ) = otherAccount.call{value: _value}("");
        require(success, "call failed");
    } 
    
    //ACCOUNT --> CONTRACT
    function depositB() external payable{}

    function getBalance2() external view returns(uint) {
        return address(this).balance;
    }

}

contract C {
    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

    fallback() external payable{}
    receive() external payable{}
}