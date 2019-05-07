//https://classroom.udacity.com/nanodegrees/nd1309/parts/2e478a90-310b-4703-aa20-efec12eb258c/modules/f1d81730-f430-46fb-a490-0f260a65f997/lessons/a486c88b-a0d6-441a-b8c0-b7f62504d31e/concepts/6b419fc9-dda7-4bba-91c0-5d9792eaa1c3
//https://classroom.udacity.com/nanodegrees/nd1309/parts/2e478a90-310b-4703-aa20-efec12eb258c/modules/f1d81730-f430-46fb-a490-0f260a65f997/lessons/a486c88b-a0d6-441a-b8c0-b7f62504d31e/concepts/09e0373c-6243-4fc2-8807-065e10e9cec7
// https://medium.com/coinmonks/the-many-ways-to-deploy-your-smart-contract-to-rinkeby-network-38cadf7b20be
//https://medium.com/@andresaaap/how-to-deploy-a-smart-contract-on-a-public-test-network-rinkeby-using-infura-truffle-8e19253870c4
var HDWalletProvider = require("truffle-hdwallet-provider");
//David's ether account;
//0xe6Ac7E65D8cbcaD9A8E57332d32b18F53Cd4aE75
//var mnemonic = "cement weird sick mixture garment private punch state amount maid course attract";
// ganache account: 0x27d8d15cbc94527cadf5ec14b69519ae23288b95
var mnemonic = "spirit supply whale amount human item harsh scare congress discover talent hamster";
module.exports = {
  networks: {
   development: {
    host: "127.0.0.1",
    port: 8545,
    network_id: "*"
   },
   rinkeby: {
       provider: function() { 
        return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/c26d78deffa141228d004b015dbef4b7");
       },
       network_id: 4,
       gas: 4500000,
       gasPrice: 10000000000,
   }
  }
 };

