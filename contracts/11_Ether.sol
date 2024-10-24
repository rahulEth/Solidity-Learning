//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Ether{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw() external {
        require(msg.sender == owner, "only owner allow to withdrawal the amount");
        payable(msg.sender).transfer(address(this).balance);
    }

    function getBalance() public view returns(uint256){
        return address(this).balance;
    }
}