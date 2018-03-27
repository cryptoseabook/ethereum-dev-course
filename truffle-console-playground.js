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
var acc1 = "0xb4EB33302fE94155730922b2A84E38c134426308"
var acc2 = "0x8aE18ed773c403aB1565B2C2e06D06093A1FCBAb"

var Web3 = require("web3")
var web3 = new Web3(new Web3.providers.HttpProvider(endPoint))

var EthTx = require("ethereumjs-tx")
var pk1 = "014786d91ad6c417705ee5dba4fa8e7acf6d8098c74b78d8cf6e272b8c556d0e"
var pk1x = new Buffer(pk1, 'hex')

var rawTx = {
	nonce: web3.toHex(web3.eth.getTransactionCount(acc1)),
	to: acc2,
	gasPrice: web3.toHex(2000000000),
	gasLimit: web3.toHex(51000),
	value: web3.toHex(web3.toWei(0.5, 'ether')),
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

truffle migrate --compile-all --reset --network ganache
truffle console --network ganache

CoinFlipper.deployed().then(function(instance) {coinFlipper = instance});

var player1 = web3.eth.accounts[0]
var player2 = web3.eth.accounts[1]

coinFlipper.makeWager({from: player1, value: web3.toWei(1, "ether")})
coinFlipper.acceptWager({from: player2, value: web3.toWei(1, "ether")})
coinFlipper.resolveBet({from: player1})

var contributionEvent = crowdFund.Contribution({fromBlock: 0, toBlock: 'latest'});
contributionEvent.watch(function(error, result) {
  console.log(result.args._from, result.args._value);
});

const accountSid = 'AC98ac7c375710f16dbd65ed42111b9eac';
const authToken = '629c40c381d2dc99f8c0d88af9885c14';

// require the Twilio module and create a REST client
const client = require('twilio')(accountSid, authToken);

client.messages
  .create({
    to: '+610421489173',
    from: '+61437880733',
    body: '',
  })
  .then(message => console.log(message.sid));

contributionEvent.watch(function(error, result) { client.messages.create({to: "+61421489173", from: "+61437880733", body: `New Contribution from: ${result.args._from},  ${web3.fromWei(result.args._value, "ether")} ether`}).then(message => console.log(message.sid))});
