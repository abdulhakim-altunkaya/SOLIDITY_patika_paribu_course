const ConstructorContract = artifacts.require("ConstructorContract");

module.exports = function (deployer) {
  deployer.deploy(ConstructorContract, "pomelo");
};



