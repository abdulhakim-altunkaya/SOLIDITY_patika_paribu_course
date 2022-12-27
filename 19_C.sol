//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract C {
    bytes public data;
    function callOtherContract(address otherContract, string memory _word) external {
        (bool success, bytes memory _data ) = otherContract.call{value: 0}(abi.encodeWithSignature("changeWord(string)", _word));
        require(success, "call failed for some reason");
        data = _data;
    }

}