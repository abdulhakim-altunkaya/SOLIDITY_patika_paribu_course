//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

contract FeeCollector {
    address public owner; //kontratın sahibi
    uint public balance; //kontratın bakiyesi

    //Kontratın sahibini ata
    constructor(){
        owner = msg.sender;
    }
    //receiver adresine amount kadar ether gönder
    function withdraw(uint amount, address payable receiver) external payable {
        require(msg.sender == owner, "you are not owner");//sadece kontrat sahibi bu fonksiyonu çağırabilir
        require(amount <= balance, "not enough balance");//Bakiyeden fazlasını çekmelerini engelle
        receiver.transfer(amount);
        balance -= amount;
    }

    //Kontrata ether gönder ve bakiyesini güncelle
    fallback() external payable {
        balance += msg.value;
    }
    receive() external payable {
        balance += msg.value;
    }
}