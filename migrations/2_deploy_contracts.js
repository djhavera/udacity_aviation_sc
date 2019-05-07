// https://medium.com/@andresaaap/how-to-deploy-a-smart-contract-on-a-public-test-network-rinkeby-using-infura-truffle-8e19253870c4
// https://medium.com/@jjsee/5-min-to-deploy-ethereum-smart-contract-to-ropsten-testnet-via-infura-35d556a4c87
var SupplyChain = artifacts.require("../../build/contracts/coffeebase/SupplyChain.sol");
module.exports = function(deployer, network, accounts) {
    deployer.deploy(SupplyChain,{from: accounts[0]});
   };
