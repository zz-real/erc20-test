// describe("token test",()=>{})
const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("token test", function () {

  // 初始化
  beforeEach(async function () {
   tokenFactory = await hre.ethers.getContractFactory("ERC20MSHKToken");
   tokenContract = await tokenFactory.deploy();
  });

  
});
