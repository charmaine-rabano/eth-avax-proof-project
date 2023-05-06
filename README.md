# Deploy ERC20 Token on Avalanche (ETH + AVAX Proof Intermediate Project)

This Solidity program is a smart contract that creates a new ERC20 token for Degen Gaming, with Hardhat configurations to be deployed to the Avalanche network.

This program was created as a project for the [Metacrafters ETH + AVAX Proof Intermediate course](https://academy.metacrafters.io/content/solidity-avax-intermediate).

## Description

The smart contract creates an ERC20 Token called Degen (DGN). The token is owned by the account that deployed the contract and only this owner can mint DGN tokens using `mintDGN()`. The contract allows users to view their DGN token balance using `getDGNBalance()`, transfer DGN tokens using `transferDGN()`, burn DGN tokens using `burnDGN()`, and redeem DGN tokens using `redeemDGN()`.

This contract is also configured to be able to run on the Avalanche Fuji test network and main network.

## Getting Started

### Executing program

To run the smart contract alone, you can use [Remix](https://remix.ethereum.org/), an online Solidity IDE.

To run entire application, create .env file for owner and user private keys and Snowtrace API key, then run the following in the project directory:

1. `npm install`
    - Installs dependencies
2. `npx hardhat run scripts/deploy.js --network fuji`
    - Deploys the contract on the Avalanche testnet using the deploy.js script
3. `npx hardhat verify <contract_address> --network fuji`
    - Enables verification of contract on [Avalanche Fuji test network](https://testnet.snowtrace.io/)

## Video Walkthrough

Here's a video of me explaining my solution: [Video walkthrough](https://drive.google.com/file/d/1Ac-ai26FSMeDvaIk2G2EC_BMb0ywlepx/view?usp=sharing)

## Author

Charmaine Eunice Rabano
