const Cons = artifacts.require("Cons");

module.exports = function (deployer) {
  deployer.deploy(Cons, "pomelo");
};



