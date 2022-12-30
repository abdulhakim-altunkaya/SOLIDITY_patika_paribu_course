//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract StructTest {
    struct Cars {
        uint price;
        string model;
    }

    Cars public myCar = Cars(1000, "mercedes");

    mapping(address => Cars) public carOwners;

    function addCar(uint _price, string memory _model) external {
        carOwners[msg.sender] = Cars(_price, _model);
    }
    function addCar2(uint _price, string memory _model) external {
        carOwners[msg.sender] = Cars({model: _model, price: _price});
    }
    Cars public yourCar;
    function addCar3(uint _price, string memory _model) external {
        yourCar.model = _model;
        yourCar.price = _price; 
    }
}