//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract Iterable {
    uint count = 1;

    mapping(uint => string) public secretWordsMapping;

    uint[] internal trackingArray;

    function addMapping(string memory _word) external {
        secretWordsMapping[count] = _word;
        trackingArray.push(count);
        count++;
    }

    //in the mapping below do not use this conditional statement:
    //if(secretWordsMapping[trackingArray[i]] ==  "")
    //To check if a value exists in a mapping or not, you need to see its value length
    //And you cannot just use length, you need to find the byte length of the value. Correct one:
    //if(bytes(secretWordsMapping[trackingArray[i]]).length < 1)
    function getMappingLength() external view returns(uint) {
        uint mappingLength;
        for(uint i=0; i<trackingArray.length; i++) {
            if(bytes(secretWordsMapping[trackingArray[i]]).length < 1) {
                mappingLength;
            } else {
                mappingLength++;
            }
        }
        return mappingLength;
    }
    
    function deleteMapping(uint _index) external {
        delete secretWordsMapping[_index];
    }

    string[] public mappingValues;
    function createMappingValues() external {
        for(uint i=0; i<trackingArray.length; i++) {
            if(bytes(secretWordsMapping[trackingArray[i]]).length < 1) {
                mappingValues;
            } else {
                mappingValues.push( secretWordsMapping[trackingArray[i]] );
            }
        }
    }

    function getMappingValues() external view returns(string[] memory) {
        return mappingValues;
    }
    
}