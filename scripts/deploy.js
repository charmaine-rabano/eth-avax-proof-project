const hre = require("hardhat");

async function main() {
  // Get the smart contract
  const Degen = await hre.ethers.getContractFactory("DegenToken");

  // Deploy it
  const degen = await Degen.deploy();
  await degen.deployed();

  // Display the contract address
  console.log(`Degen token deployed to ${degen.address}`);

  degen.on("Redeem", (user, item) => {
    console.log(`Successfully redeemed for ${user}. Here is your ${item}!`);
  })
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
