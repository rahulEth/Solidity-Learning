// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


interface StoreInterface{
    function getValue() external view returns (uint256);
    function setValue(uint256 v) external;
}