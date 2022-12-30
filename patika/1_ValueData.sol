//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract ValueData {
    //A)DATA TYPES: value and reference 
    //1.VALUE TYPES: data stores a value
    bool public a = false;
    uint public b = 25;
        // uint256:  2**256 - 1
        // uint0:  2**8 - 1 
        // uint16:  2**16 - 1
    int public i = -2689;
        //int256 -- 2**255 - 1
    //To get the max and min integers
    int public mintInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = address(5);
    bytes32 public c;

    /*
    2.REFERENCE TYPES: they dont store an actual value, 
    they store a reference which points where the actual value is


    B) TYPES OF THE VARIABLES
    State variables: declared outside the functions, stored on the blockchain
    Local variables: declared inside the functions, not stored on the blockchain
    Global variables: blockchain related technical variables
    msg.sender (address), block.timestamp (uint), block.number(uint);

    C) DEFAULT VALUES
    uint - 0
    int - 0
    address - address(0): 0x000...(40 zeros after x)
    string - ""
    bytes32 - 32 bytes hexadecimal representation of zero -- 0X0000...(64 zeros after 0) 
    */
}