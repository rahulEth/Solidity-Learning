//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract AssemblyLoop{
    function assemblyLoop() external pure returns(uint256 z){
        assembly{
        for { let i :=0}  lt(i,5) { i := add(i,1)} {
           z :=  mul(i,2)
        }
        }
    }
        function yul_while_loop() public pure returns (uint256 z) {
        assembly {
            let i := 0
            for {} lt(i, 5) {} {
                i := add(i, 1)
                z := add(z, 1)
            }
        }
    }
}