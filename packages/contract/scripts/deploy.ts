import { ethers } from "hardhat";

async function main() {
  const ChristmasNFT = await ethers.getContractFactory("ChristmasNFT");
  const christmasNFT = await ChristmasNFT.deploy();

  await christmasNFT.deployed();

  console.log("ChristmasNFT deployed to:", christmasNFT.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
