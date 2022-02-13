const main = async () => {
  const [owner, randomPerson] = await hre.ethers.getSigners();
  const tokenContractFactory = await hre.ethers.getContractFactory("Token");
  const tokenContract = await tokenContractFactory.deploy(1000000);
  await tokenContract.deployed();
  console.log("Contract deployed to:", tokenContract.address);
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
