pragma solidity ^0.4.18;

import "./Owned.sol";

contract CrowdFund is Owned {

    address public beneficiary;
    uint256 public goal;
    uint256 public deadline;

    struct Funder {
        address contributor;
        uint256 amount;
    }

    Funder[] public funders;


    function CrowdFund(address _beneficiary, uint256 _goal, uint256 _duration) public {
        beneficiary = _beneficiary;
        goal = _goal;
        deadline = now + _duration;
    }

    function contribute() payable public {
        funders.push(Funder(msg.sender, msg.value));
    }

    function payout() onlyOwner public {
        address contractAddr = this;
        if (contractAddr.balance >= goal && now > deadline) {
            beneficiary.transfer(contractAddr.balance);
        }
    }

    function refund() onlyOwner public {
        uint256 index;
        for(index = 0; index < funders.length; index++) {
            funders[index].contributor.transfer(funders[index].amount);
        }
    }

}
