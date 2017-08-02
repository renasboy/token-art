pragma solidity ^0.4.11;

contract TokenArt {
    bytes32 public name = 'Token Art';
    address public owner;
    uint256 public supply;

    mapping (address => uint256) balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function TokenArt() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier isEmpty() {
        require(supply == 0);
        _;
    }

    function initial_supply(uint256 _amount) isOwner isEmpty {
        balances[msg.sender] = _amount;
        supply = _amount;
    }
    
    function transfer(address _to, uint256 _value) {
        assert(balances[msg.sender] < _value);
        assert(balances[_to] + _value < balances[_to]);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
    }
}
