// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NSMQFundraiser {
    address public owner;
    uint public totalRaised;
    mapping(address => uint) public contributions;
    event PaymentMade(address indexed participant, uint amount);
    event FundWithdrawn(address indexed owner, uint amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Function for participants to contribute/pay after a contest
    function makePayment() public payable {
        require(msg.value > 0, "Must send ETH to contribute.");
        contributions[msg.sender] += msg.value;
        totalRaised += msg.value;
        emit PaymentMade(msg.sender, msg.value);
    }

    // View function to see total amount raised at any point in time
    function getTotalRaised() public view returns (uint) {
        return totalRaised;
    }

    // Function for the owner to withdraw the total raised amount
    function withdrawFunds() public onlyOwner {
        uint amount = address(this).balance;
        require(amount > 0, "No funds to withdraw.");
        payable(owner).transfer(amount);
        emit FundWithdrawn(owner, amount);
    }

    // View participant's contribution
    function getContribution(address participant) public view returns (uint) {
        return contributions[participant];
    }
}
