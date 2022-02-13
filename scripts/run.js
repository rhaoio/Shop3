const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners();
  // const tokenContractFactory = await hre.ethers.getContractFactory("Token");
  // const tokenContract = await tokenContractFactory.deploy(1000000);
  // await tokenContract.deployed();
  // console.log("Contract deployed to:", tokenContract.address);

  const inventoryContractFactory = await hre.ethers.getContractFactory(
    "Inventory"
  );
  const inventoryContract = await inventoryContractFactory.deploy();
  await inventoryContract.deployed();
  console.log("Contract deployed to:", inventoryContract.address);

  let txn2 = await inventoryContract.addProduct("Test Product 1", 10);

  console.log(txn2);

  let txn3 = await inventoryContract.getProductCount();

  //await txn3.wait();
  console.log(txn3);
  console.log(hre.ethers.BigNumber.from(txn3));

  let txn4 = await inventoryContract.getName(txn3 - 1);

  console.log(txn4);
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
