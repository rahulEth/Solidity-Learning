//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;
    contract Calculation {

        function uqdiv(uint224 x, uint112 y) internal pure returns (uint224 z) {
            z = x / uint224(y);
        }
        
        function uqdiv1(uint224 x, uint112 y) public pure returns (uint224 z){
            z = x / y;
        }
    }