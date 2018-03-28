pragma solidity ^0.4.18;

contract CoinFlipper {

  enum GameState {noWager, wagerMade, wagerAccepted}
  GameState public currentState;
  uint256 public wager;
  address public player1;
  address public player2;
  address public lastWinner;
  uint public seedBlockNumber;

  modifier onlyState(GameState expectedState) { require(expectedState == currentState); _; }

  function CoinFlipper() public {
    currentState = GameState.noWager;
  }

  function makeWager() onlyState(GameState.noWager) payable public returns (bool) {
    wager = msg.value;
    player1 = msg.sender;
    currentState = GameState.wagerMade;
    return true;
  }

  function acceptWager() onlyState(GameState.wagerMade) payable public returns (bool) {
    require(msg.value == wager);
    player2 = msg.sender;
    seedBlockNumber = block.number;
    currentState = GameState.wagerAccepted;
    return true;
  }

  function resolveBet() onlyState(GameState.wagerAccepted) public returns (bool) {
    uint256 blockValue = uint256(block.blockhash(seedBlockNumber));
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 coinFlip = blockValue/FACTOR;

    address currentContractAddr = this;
    if(coinFlip == 0) {
      lastWinner = player1;
      player1.transfer(currentContractAddr.balance);
    } else {
      lastWinner = player2;
      player2.transfer(currentContractAddr.balance);
    }

    currentState = GameState.noWager;
    return true;

  }

  function lastWinner() view public returns (address) {
    return lastWinner;
  }


}
