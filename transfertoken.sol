//SPDX-License-Identifier:GPL-3.0
pragma solidity >= 0.5.0 < 0.9.0;
contract superPAD {                             // smart contract coding
mapping(address => uint) public balances;
mapping(address => mapping(address => uint)) public allowance; // nested mapping
uint public totalSupply = 200000000;
uint public initialSupply = 15140000;
string public name = "superPAD";
string public symbol = "SPAD";
uint public decimals = 18;

event Transfer(address indexed from, address indexed to, uint value);
event Approval(address indexed owner, address indexed spender, uint value);
constructor() {
    balances[msg.sender] = totalSupply;
}
function balanceOf(address owner)public view returns(uint) {
    return balances[owner];
}

// transfering tokens

function transfer(address to, uint value)public returns(bool) {
    require(balanceOf(msg.sender) >= value, "balance too low");
    balances[msg.sender] -= value;
    emit Transfer(msg.sender, to, value);
    return true;
}

// delegated transfers

function transferFrom(address from, address to, uint value)public returns(bool) {
    require(balanceOf(from) >= value, "balance too low");
    require(allowance[from][msg.sender] >= value, "allowance too low");
    balances[to] += value;
    balances[from] -= value;
    emit Transfer(from, to, value);
    return true;
}

function approve(address spender, uint value) public returns(bool) {
    allowance[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
}

    
}
