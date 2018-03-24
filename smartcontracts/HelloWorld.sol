pragma solidity ^0.4.18;

contract HelloWorld {

    string public message;

    function HelloWorld() public  {
        message = "Hello World";
    }

    function displayMessage() view public returns (string) {
      return  message;
    }

    function setMessage(string aMessage) public {
        message = aMessage;
    }

  }
