pragma solidity ^0.4.18;

contract Owned {
  address public owner;

  function Owned() public {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if(msg.sender == owner) {
      _;
    }
  }
}

contract CrowdFund is Owned {

    address public beneficiary;
    uint256 public goal;
    uint256 public deadline;

    mapping(address => uint256) funders;

    event Contribution(address _from, uint256 _value);

    function CrowdFund(address _beneficiary, uint256 _goal, uint256 _duration) public {
        beneficiary = _beneficiary;
        goal = _goal;
        deadline = now + _duration;
    }

    function contribute() payable public {
        funders[msg.sender] += msg.value;
        Contribution(msg.sender, msg.value);
    }

    function payout() onlyOwner public {
        address contractAddr = this;
        if (contractAddr.balance >= goal) {
            beneficiary.transfer(contractAddr.balance);
        }
    }

    function refundWithdraw() public {
      uint256 amount = funders[msg.sender];
      if (now > deadline && this.balance < goal && amount > 0) {
          funders[msg.sender] = 0;
          msg.sender.transfer(amount);
      }
    }

    function getFunderContribution(address _addr) view public returns (uint) {
      return funders[_addr];
    }

}
