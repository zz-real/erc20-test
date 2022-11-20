// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  tokenFactory = await hre.ethers.getContractFactory("ERC20MSHKToken");
  tokenContract = await tokenFactory.deploy();

  console.log(` hardhat ERC20MSHKToken deployed to ${tokenContract.address}`);

  
  myNFTFactory = await hre.ethers.getContractFactory("MyNFT");
  myNFTContract = await myNFTFactory.deploy();

  console.log(` hardhat MyNFT deployed to ${myNFTContract.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
