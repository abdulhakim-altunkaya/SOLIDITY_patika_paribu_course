//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "./20_D.sol";

contract E {

    IApple public myContract;

    function setContract(address otherContract) external {
        myContract = IApple(otherContract);
    }

    function getValue() external view returns(string memory) {
        return myContract.getFruit();
    }
    function changeValue(string memory _fru) external {
        myContract.changeFruit(_fru);
    }
    /*
    function getValue2() external view returns(uint) {
        return myContract.extraFunction();
    } 
    */


}