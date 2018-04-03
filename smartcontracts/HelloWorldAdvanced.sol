pragma solidity ^0.4.18;

import "github.com/Arachnid/solidity-stringutils/src/strings.sol";

contract HelloWorldAdvanced {
  using strings for *;


  function helloworld(string _name) view public returns(string) {
    var helloworld = "helloworld ".toSlice();
    var name = _name.toSlice();
    var result = string(helloworld.concat(name));

    return result;
  }
}
