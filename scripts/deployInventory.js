const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners();
  const inventoryContractFactory = await hre.ethers.getContractFactory(
    "Inventory"
  );
  const inventoryContract = await inventoryContractFactory.deploy();
  await inventoryContract.deployed();
  console.log("Contract deployed to:", inventoryContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
