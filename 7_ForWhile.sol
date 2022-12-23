//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract ForWhile {
    uint[] internal myArray1;
    uint[] internal myArray2;
    function loops(uint lastNumber) external {

        for(uint i=0; i<lastNumber; i++) {
            myArray1.push(i);
            if (i == 3) {
                continue; //for loop will not stop but myArray2.push(i) will not be executed
            } else if(i == 15) {
                break; //for loop will stop
            }
            myArray2.push(i);
        }

    }
    function getArray1() external view returns(uint[] memory) {
        return myArray1;
    }
    function getArray2() external view returns(uint[] memory) {
        return myArray2;
    }

    uint[] internal myList;
    function whileLoop(uint _n) external returns(uint[] memory) {
        while(_n<20) {
            myList.push(_n);
            _n++;
        }
        return myList;
    }
    function getArray3() external view returns(uint[] memory) {
        return myList;
    }

    function forLoop2(uint _number) external pure returns(uint) {
        uint sumNumber;
        for(uint i=0; i<_number; i++) {
            sumNumber += i;
        }
        return sumNumber;
    }
}