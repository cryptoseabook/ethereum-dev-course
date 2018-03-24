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
