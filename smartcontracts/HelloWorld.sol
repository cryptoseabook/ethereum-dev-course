pragma solidity ^0.4.18;

import "./Owned.sol";

contract HelloWorld {

    string message;

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
