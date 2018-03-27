pragma solidity ^0.4.18;

contract SeabookCoin {
  // ERC20 State
  mapping (address => uint256) public balances;
  mapping (address => mapping (address => uint256)) public allowances;
  uint256 public totalSupply;

  // Human State
  string public name;
  uint8 public decimals;
  string public symbol;
  string public version;

  // ERC20 Events
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

  // Constructor
  function SeabookCoin(uint256 _initialAmount) {
    balances[msg.sender] = _initialAmount;
    totalSupply = _initialAmount;
    name = "SeabookCoin";
    decimals = 18;
    symbol = "SCC";
    version = "1.0";
  }

  // ERC20 Methods
  function balanceOf(address _address) constant returns (uint256 balance) {
    return balances[_address];
  }

  function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
    return allowances[_owner][_spender];
  }

  function transfer(address _to, uint256 _value) returns (bool success) {
    require(balances[msg.sender] > _value);
    require(balances[_to] + _value > balances[_to]);

    balances[msg.sender] -= _value;
    balances[_to] += _value;
    Transfer(msg.sender, _to, _value);
    return true;
  }

  function approve(address _spender, uint256 _value) returns (bool success) {
    allowances[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }

  function transferFrom(address _owner, address _to, uint256 _value) returns (bool success) {
    require(balances[_owner] > _value);
    require(balances[_to] + _value > balances[_to]);
    require(allowances[_owner][msg.sender] > _value);

    balances[_owner] -= _value;
    balances[_to] += _value;
    allowances[_owner][msg.sender] -= _value;
    Transfer(_owner, _to, _value);
    return true;
  }

}
