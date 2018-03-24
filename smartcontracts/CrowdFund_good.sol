pragma solidity ^0.4.18;

import "./Owned.sol";

contract CrowdFund is Owned {

    address public beneficiary;
    uint256 public goal;
    uint256 public deadline;

    mapping(address => uint256) funders;
/*  struct Funder {
        address contributor;
        uint256 amount;
    }
    Funder[] public funders;
*/
    function CrowdFund(address _beneficiary, uint256 _goal, uint256 _duration) public {
        beneficiary = _beneficiary;
        goal = _goal;
        deadline = now + _duration;
    }

    function contribute() payable public {
        funders[msg.sender] += msg.value;
    }

    function payout() onlyOwner public {
        address contractAddr = this;
        if (contractAddr.balance >= goal) {
            beneficiary.transfer(contractAddr.balance);
        }
    }

/*
    function refund() onlyOwner public {
        uint256 index;
        for(index = 0; index < funders.length; index++) {
            funders[index].contributor.transfer(funders[index].amount);
        }
    }
*/

  function refundWithdraw() public {
    uint256 amount = funders[msg.sender];
    if (now > deadline && this.balance < goal && amount > 0) {
        funders[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
  }

  function getFunderContribution(address _addr) view returns (uint) {
    return funders[_addr];
  }

}
