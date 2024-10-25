//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/*
Feature	                     call	                             delegatecall
Context	Executes   in the called contract’s context	    Executes in the caller contract’s context
Storage	Uses       storage of the called contract	    Uses storage of the calling contract
msg.sender	       Remains the original caller	i.e     Remains the original caller i.e user 
                   caller contract address              address who initiate main contract tx
msg.value          whatever value caller contract pass  ether valuse user passes         
Use Cases	       External calls, transferring Ether	Proxy patterns, upgradable contracts
                    _addr.call{value: msg.value}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123))   _contract.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));
*/


//NOTE: contract address should be payable in call if sending ether along with function call
// since delegate call does not send ether so contract address payable not required

contract LogicContract{
    string public x;

    function setX(string memory _x) public {
        x = _x;
    }

}

contract ProxyContract{
    string public x;
    address public logic;
    constructor(address _logic){
        logic = _logic;
    }

    function setX(string memory _x) public{
        (bool success, ) = logic.delegatecall(abi.encodeWithSignature("setX(string)", _x));
    }
}