var Web3 = require("web3")
var web3 = new Web3()

var CoinFlipper = artifacts.require("CoinFlipper");


module.exports = function(deployer) {
    deployer.deploy(CoinFlipper);
};
