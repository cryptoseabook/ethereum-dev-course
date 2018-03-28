pragma solidity ^0.4.18;

contract Mortal {

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
    assert(owner != '0x0')
    message = _message;
  }

}
