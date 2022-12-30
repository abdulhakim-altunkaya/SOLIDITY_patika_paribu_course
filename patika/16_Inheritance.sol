//SPDX-License-Identifier: MIT

pragma solidity >= 0.8.7;

contract A {

    struct Car {
        string model;
        uint price;
    }
    Car public myCar = Car("Mercedes", 1000);
    Car public yourCar = Car("BMW", 15900);

    function foo() external view virtual returns(Car memory) {
        return myCar;
    }

}
/*If I want to customize and use the function of contract A, then I should use inheritance with "virtual/override"  */
contract B is A {
    function foo() external view override returns(Car memory) {
        return yourCar;
    }
}
