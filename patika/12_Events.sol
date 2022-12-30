//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

/*
Events are saving data to the blockchain
Index and Events are used together. Imagine you want to
search event logs for a specific address lets say. Then
by tagging address as "index", you can search and find it. 
*/
contract EventTest {
    //events are saving data to the blockchain

    event Log(address sender, uint val);
    event IndexedLog(address indexed sender, uint val);

    function send1(uint val) external view returns(string memory) {
        return "success you transferred";
        emit Log(msg.sender, val);
    }

    function send2(uint val) external returns

    

}