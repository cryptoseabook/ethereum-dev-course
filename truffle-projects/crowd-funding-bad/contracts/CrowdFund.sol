pragma solidity ^0.4.18;

contract CrowdFund {

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

    function payout() public {
        address contractAddr = this;
        if (contractAddr.balance >= goal && now > deadline) {
            beneficiary.transfer(contractAddr.balance);
        }
    }

    function refund() public {
        uint256 index;
        for(index = 0; index < funders.length; index++) {
            funders[index].contributor.transfer(funders[index].amount);
        }
    }

}
