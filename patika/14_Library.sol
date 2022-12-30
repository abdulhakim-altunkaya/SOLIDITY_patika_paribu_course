//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;
library Math {
    //libraries cannot have state variables
    //library functions should only be declared as internal.
    //Making them public or external does not make sense.
    //Make them private is rarely needed.
    //If you declare below function as public, then you need to deploy 
    //library separately. But if you declare it "internal", then this 
    //function will be embedded inside LibraryTest contract.
    function compare(uint x, uint y) internal pure returns(uint) {
        return x < y ? y : x;
    }
}
contract LibraryTest {
    //Libraries allow us to separate and reuse code
    function compareNumbers(uint a, uint b) external pure returns(uint) {
        return Math.compare(a, b);
    }
}

library ForLoops {
    function findIndex(uint targetNum, uint[] memory arr) internal pure returns(uint) {
        for(uint i=0; i<arr.length; i++) {
            if(arr[i] == targetNum) {
                return i;
            }
        } 
        //dont forget to put this line.
        revert("not found");
    }
}

contract LibraryTest2 {
    uint[] public myArray = [9, 8, 52, 1];
    function findNumber(uint _num) external view returns(uint) {
        return ForLoops.findIndex(_num, myArray);
    }
}


library BasicOpsLibrary {
    function add(uint a, uint b) external pure returns(uint) {
        return a+b;
    }
}

//ENHANCING DATA TYPES: "using" keyword
contract LibraryTest3 {
    using BasicOpsLibrary for uint;

    function addNumbers(uint x, uint y) external pure returns(uint) {
        return x.add(y);
    }
    /*
    WITHOUT DATA TYPE ENHANCING (no need for "using..." line and):
    function addNumbers(uint x, uint y) external pure returns(uint) {
        return BasicOpsLibrary.add(x,y);
    }
    */
}