//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract Payable{

    // Payable address can send Ether via transfer or send
    address payable public owner;

    // Payable constructor can receive Ether
    constructor() payable{
        owner = payable(msg.sender);
    }


    // Function to deposit Ether into this contract.
    // Call this function along with some Ether.
    // The balance of this contract will be automatically updated.
    function deposit() public payable{

    }

  // Function to withdraw all Ether from this contract.
    function withdraw() public {
        // get the amount of Ether stored in this contract
        uint256 amount = address(this).balance;

        // send all Ether to owner
        (bool success,) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    function withdrawl(address payable _to) public {
        uint256 amount = address(this).balance;

        (bool success, ) =_to.call{value: amount}("");
        require(success, "Failed to send ether");
    }
}
