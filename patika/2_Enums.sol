//SPDX-License-Identifier: MIT

pragma solidity >= 0.8.7;

contract Enums {
    //They help us to express different options
    //bool helps us to explain true or false
    enum ShippingEnum {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Cancelled
    }
    ShippingEnum internal itemEnum;

    struct ShippingStruct {
        address buyer;
        ShippingEnum status;
    }

    ShippingStruct[] public orders;

    function getStatus() external view returns(ShippingEnum) {
        return itemEnum;
    }

    function setStatus(ShippingEnum _stat) external {
        itemEnum = _stat;
    }

    function ship() external {
        itemEnum = ShippingEnum.Cancelled;
    }

    function reset() external {
        //set the enum variable to its default value
        delete itemEnum;
    }

    function create(ShippingEnum _st) external {
        ShippingStruct memory record = ShippingStruct(msg.sender, _st);
        orders.push(record);
    }
}