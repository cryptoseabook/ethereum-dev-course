contract owned {

  address public owner;

  function owned() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if(msg.sender == owner) {
      _;
    }
  }

}

contract helloworld is owned {

  string public message;

  function setMessage(string _message) onlyOwner() {
    message = _message;
  }

}

contract mortal {

  address public owner;

  function mortal() {
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

contract helloworld is mortal {

  string public message;

  function setMessage(string _message) onlyOwner() {
    message = _message;
  }

}
