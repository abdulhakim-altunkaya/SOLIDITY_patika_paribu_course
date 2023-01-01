//SPDX-License-Identifier: MIT

pragma solidity >=0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract Devcoin is ERC20Capped {
    address public owner;
    error ownerError(address caller);
    modifier onlyOwner() {
        if(msg.sender != owner) {
            revert ownerError(msg.sender);
        }
        _;
    }
    constructor(uint cap) ERC20("DevCoin", "DEVCON") ERC20Capped(cap * (10 ** 18)) {
        owner = msg.sender;
    }

    function mintToken(uint _amount) external onlyOwner {
        _mint(msg.sender, _amount*10**18);
    }

    function burnToken(uint _amount) external onlyOwner {
        _burn(msg.sender, _amount*10**18);
    }

    function getMintedTokens() external view returns(uint) {
        return totalSupply() / (10**18);
    }

    function getTokenName() external view returns(string memory) {
        return name();
    }

    function getContractAddress() external view returns(address) {
        return address(this);
    }

    function getBalance() external view returns(uint) {
        return balanceOf(msg.sender) / (10**18);
    }
}