//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7;

contract ErrorsTest {

    error OwnerError(address caller, string message);

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert OwnerError(msg.sender, _word)
        } else {
            
        }
    }

    string public secretWord;

    function sendMessage(string memory _word) external onlyOwner(_word) {
        secretWord = _word;
    }

    //require: validate input and access control
    //unused gas returned, state updates are reverted
    function testRequire(uint _num) public pure {
        require(i < 10, "i must be smaller");
    }

    //revert and require are the same, but if you would like to use
    //man if conditions, then better to use revert.
    //unused gas returned, state updates are reverted
    function testRevert(uint _num) public pure {
        if( _num > 9) {
            revert("_num should be smaller");
        }
    }

    //assert is used to check if a condition is all time true. 
    //Generally used with testings. If assert condition is false, then it
    //means there might be a buggie inside the contract
    uint internal totalBalance = 1000;
    function testAssert() external {
        assert(totalBalance > 800, "somebody has stolen funds");
    }
}