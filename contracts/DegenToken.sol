// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
    Your task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. 
    The smart contract should have the following functionality:
    
        Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards.
        Transferring tokens: Players should be able to transfer their tokens to others.
        Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
        Checking token balance: Players should be able to check their token balance at any time.
        Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    constructor() ERC20("Degen", "DGN") {}

    event Redeem(address user, string item);

    function actual(uint amount) private view returns(uint) {
        return amount * 10**decimals();
    }

    // Minting new tokens
    function mintDGN(address to, uint amount) public onlyOwner {
        _mint(to, actual(amount));
    }

    // Transferring tokens
    function transferDGN(address to, uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Not enough balance to transfer.");
        transfer(to, actual(amount));
    }

    // Redeeming tokens
    function getStoreItems() external pure returns(string memory) {
        return "1: Random costume - 50 DGN  |  2: Special weapon - 200 DGN";
    }

    function redeemDGN(uint item) external {
        if (item == 1) {
            require(balanceOf(msg.sender) >= actual(50), "Not enough balance to redeem random costume.");
            transfer(owner(), actual(50));
            emit Redeem(msg.sender, "random costume");
        } else if (item == 2) {
            require(balanceOf(msg.sender) >= actual(200), "Not enough balance to redeem special weapon.");
            transfer(owner(), actual(200));
            emit Redeem(msg.sender, "special weapon");
        }
    }

    // Checking token balance
    function getDGNBalance() external view returns(uint) {
        return balanceOf(msg.sender) / 10**decimals();
    }

    // Burning tokens
    function burnDGN(uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Not enough balance to burn.");
        _burn(msg.sender, actual(amount));
    }
}
