const Cons = artifacts.require("Cons");

//Each contract block will require redeployment
//After you finish test block, just type "truffle test" in the console
contract("Cons", (accounts) => {
  it("constructor should set the message correctly", async () => {
    let instance = await Cons.deployed();
    let word = await instance.word();
    assert.equal(word, "pomelo")
  })
  //This will fail because I didnt create public owner variable
  it("owner must be accounts[0]", async () => {
    let instance = await Cons.deployed();
    let owner = await instance.owner();
    assert.equal(owner, accounts[0]);
  })
})

contract("Cons", (accounts) => {
  
})