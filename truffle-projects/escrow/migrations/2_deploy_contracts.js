var Web3 = require("web3")
var web3 = new Web3()

var Escrow = artifacts.require("Escrow");


module.exports = function(deployer) {
    deployer.deploy(Escrow, "0xf17f52151EbEF6C7334FAD080c5704D77216b732", "0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef", {value: web3.toWei(5, "ether")});
};
