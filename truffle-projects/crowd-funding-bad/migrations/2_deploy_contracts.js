var CrowdFund = artifacts.require("CrowdFund");

var Web3 = require("web3")
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))

var beneficiary = web3.eth.accounts[0];
var goal = web3.toWei(1000, 'ether');
var duration = 60 * 60;

module.exports = function(deployer) {
    deployer.deploy(CrowdFund, beneficiary, goal, duration);
};
