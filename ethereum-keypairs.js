var EthUtil = require("ethereumjs-util")
var Web3 = require("web3")

var web3 = new Web3();

var hexToBytes = function(hex) {
  if (hex.length != 64) {
    throw ("private key needs to be 64 characters long!!!");
  }

  for (var bytes = [], c = 0; c < hex.length; c+=2)
    bytes.push(parseInt(hex.substr(c, 2), 16));
  return bytes;
}

var privateKeyToPublicKey = function(privateKey) {
  let hexToBytesPK = hexToBytes(privateKey);
  return `0x${EthUtil.privateToPublic(hexToBytesPK).toString('hex')}`
}

var pubKeyToAddress = function(privateKey) {
  let hexToBytesPK = hexToBytes(privateKey);
  return `0x${EthUtil.pubToAddress(EthUtil.privateToPublic(hexToBytesPK)).toString('hex')}`
}

var privateKeyToAddress = function(privateKey) {
  try {
    let hexToBytesPK = hexToBytes(privateKey);
    return `0x${EthUtil.privateToAddress(hexToBytesPK).toString('hex')}`
  } catch (err) {
    console.error(err);
    return "Invalid Address!";
  }

}

var privateToAddressSha3 = function(seed) {
  var pk = web3.sha3(web3.sha3(web3.sha3(seed)))
  return `0x${EthUtil.privateToAddress(pk).toString('hex')}`
}

console.log(privateToAddressSha3(process.argv[2]))
