BCCToken.deployed().then(function(instance) {bccTokenInstance = instance});

var cb = web3.eth.coinbase; var acc1 = web3.eth.accounts[1]; var acc2 = web3.eth.accounts[2];

bccTokenInstance.balanceOf(cb);


bccTokenInstance.transfer(acc1, 1000, {from: cb});
bccTokenInstance.transfer(acc2, 2000, {from: cb});

bccTokenInstance.balanceOf(acc1);
bccTokenInstance.balanceOf(acc2);


BCCRoomBooking.deployed().then(function(instance) {roomInstance = instance});
var openRoomEvent = roomInstance.openRoomBookingEvent({}, {fromBlock: 0, toBlock: 'latest'});
openRoomEvent.watch(function(error, event) {console.log(error, event);});


var endPoint = "https://kovan.infura.io/H0MnmEaaittMM4B3XX2S"
var acc1 = "0x8aE18ed773c403aB1565B2C2e06D06093A1FCBAb"
var acc2 = "0xb4EB33302fE94155730922b2A84E38c134426308"

var Web3 = require("web3")
var web3 = new Web3(new Web3.providers.HttpProvider(endPoint))

var EthTx = require("ethereumjs-tx")
var pk1 = "3d446b534cc5c4b453dcef86a88d750ad730819e809bfed738c33fa01d275919"
var pk1x = new Buffer(pk1, 'hex')

var rawTx = {
	nonce: web3.toHex(web3.eth.getTransactionCount(acc1)),
	to: acc2,
	gasPrice: web3.toHex(20000000000),
	gasLimit: web3.toHex(21000),
	value: web3.toHex(web3.toWei(1, 'ether')),
	data: ""
}

//create new tx
var tx = new EthTx(rawTx)
//sign
tx.sign(pk1x)
//get signed transaction & set in a var
tx.serialize().toString('hex')
var sTx = tx.serialize().toString('hex')

//send raw transaction
web3.eth.sendRawTransaction(
'0x'+tx.serialize().toString('hex'), (error,data) => {
if(!error) {
console.log(data) }
})
