//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract A {
    string public name = "contract A";

    function get() public virtual view returns(string memory){
        return name;
    }
}

// Shadowing is disallowed in Solidity 0.6
// This will not compile
// contract B is A {
//     string public name = "Contract B";
// }


contract C is A{
    // This is the correct way to override inherited state variables.

    constructor(){
        name= "contract C";
    }
}


