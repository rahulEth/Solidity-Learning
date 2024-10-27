//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
by default overflow /underflow check are enabled in soldidty 0.8.0.
but susing unchecked can disable it , it can imporve perfomrace and reduce gas feee
 */


contract UnchackedMath{
    function add(uint256 a, uint256 b) external pure returns(uint256){
        // 22291 gas
        // return x + y;

        // 22103 gas
        unchecked{
            return a + b;
        }
    }

       function sumOfCubes(uint256 x, uint256 y) external pure returns (uint256) {
        // Wrap complex math logic inside unchecked
        unchecked {
            uint256 x3 = x * x * x;
            uint256 y3 = y * y * y;

            return x3 + y3;
        }
    }
}
