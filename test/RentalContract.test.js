const{expect} = require("chai");
const{ethers} = require("hardhat");

describe("RentalContract", function () {
    it("Should deploy the contract", async function () {
      const RentalContract = await ethers.getContractFactory("RentalContract");
      const rentalContract = await RentalContract.deploy();
      await rentalContract.deployed();
      expect(rentalContract.address).to.be.properAddress;
    });
  
    it("Should allow a property to be added", async function () {
      const RentalContract = await ethers.getContractFactory("RentalContract");
      const rentalContract = await RentalContract.deploy();
      await rentalContract.deployed();
  
      await rentalContract.addProperty("house", "123 Main St");
      const property = await rentalContract.properties(0);
      expect(property.propertyType).to.equal("house");
      expect(property.addressInfo).to.equal("123 Main St");
    });
  

  });
  