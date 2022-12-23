
//SPDX-License-Identifier: MIT //License Version

pragma solidity >=0.8.7; //compiler version

contract Counter {
    uint public count; //count variable, visibility is public

    function increase() external { //function to increase the value of above variable
        count += 1; //increases by 1
    }

    function decrease() external { //function to decrease the value of above variable
        count -= 1; //decreases by 1
    }


}