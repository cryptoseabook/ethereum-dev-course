var solc = require("solc")

  var source = `contract Mortal {

    address public owner;

    function Mortal() {
      owner = msg.sender;
    }

    modifier onlyOwner() {
      if(msg.sender == owner) {
        _;
      }
    }

    function kill() onlyOwner() {
      selfdestruct(owner);
    }

  }

  contract HelloWorld is Mortal {

    string public message;

    function setMessage(string _message) payable onlyOwner() {
      message = _message;
    }

  }
  `
  var compiled = solc.compile(source)
  var bytecode = compiled.contracts[":HelloWorld"].bytecode
  var opcodes = compiled.contracts[":HelloWorld"].opcodes

  //making a contract and deploying it on a test net.
  compiled.contracts[":HelloWorld"].interface

  //save public interface of contract
  var abi = JSON.parse(compiled.contracts[":HelloWorld"].interface)

  var Web3 = require("web3")
  var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:7545"))

  //create var with contract
  var hwContract = web3.eth.contract(abi)

  //deploy contract
   var deployed = hwContract.new({
  from: web3.eth.accounts[0],
  data: compiled.contracts[":HelloWorld"].bytecode,
  gas: 4700000,
  gasPrice: 1,
  }, (error, contract) => {if (!error) console.log(contract)})

  //check transaction by hash
  web3.eth.getTransaction("0x52ef5d66d972c0b8b4c32696fac889b2d64d6d0b1e34dd6c7b18cc74a68116ed")

  hwContract.at(deployed.address)

  //use deployed contract
  deployed.displayMessage.call()
