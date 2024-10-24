//SPDX-Lincese-Identifier: MIT
pragma solidity ^0.8.26;

contract Modifier{
    address public owner; 
    bool public locked;
    uint256 public number;
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "only owner is allowed");
        _;
    } 

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    modifier noReenterency(){
        require(!locked, "no reentrency");
        locked = true;
        _;
        locked = false;
    }
    /*
     _ : it is an  placeholder for the body of the function where this modifier is applied
         function code execute here, sandwitched bitween t2 locked stack change
    */
    function  increase() public onlyOwner, noReenterency{
        number +=1;
    }
   

}