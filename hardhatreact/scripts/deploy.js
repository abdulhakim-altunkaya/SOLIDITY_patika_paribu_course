const hre = require("hardhat");

async function main() {
  const Devcoin = await hre.ethers.getContractFactory("Devcoin");
  const devcoin = await Devcoin.deploy(1000000);

  await devcoin.deployed();

  console.log(`devcoin deployed to ${devcoin.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
