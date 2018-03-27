pragma solidity ^0.4.18;

contract Escrow {

  address public buyer;
  address public seller;
  address public judge;

  function Escrow(address _seller, address _judge) payable public {
    buyer = msg.sender;
    seller = _seller;
    judge = _judge;
  }

  function payoutToSeller() public {
    if (msg.sender == buyer || msg.sender == judger) {
        address currentContractAddr = this;
        seller.transfer(currentContractAddr.balance); // in old solidity code, you will see xxx.send(ether), this is not safe.
    }
  }

  function refundToBuyer() public {
    if (msg.sender == buyer || msg.sender == judger) {
      address currentContractAddr = this;
      buyer.transfer(currentContractAddr.balance);
    }
  }

  function getBalance() public view returns(uint256) {
    address currentContractAddr = this;
    return currentContractAddr.balance;
  }
}
