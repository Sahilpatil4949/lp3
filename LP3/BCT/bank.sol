// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract bank {

    mapping(address => uint256) private balance;

    function deposit() public payable {
        require(msg.value > 0, "Amount should be greater than 0");
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Amount should be greater than 0");
        require(balance[msg.sender] >= amount, "Insufficient Balance");

        balance[msg.sender] -= amount* 1 ether;

        
        payable(msg.sender).transfer(amount * 1 ether);
    }

    function viewBal() public view returns(uint256) {
        return balance[msg.sender];
    }
}
