contract Owned {

  address public owner;

  function Owned() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if(msg.sender == owner) {
      _;
    }
  }

}

contract Helloworld is Owned {

  string public message;

  function setMessage(string _message) onlyOwner() {
    message = _message;
  }

}

contract Mortal {

  address public owner;

  function Mortal() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
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
