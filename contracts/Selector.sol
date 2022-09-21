// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./StoreInterface.sol";
contract Selector {
  // 0x20965255
    function getValueSelector() external pure returns (bytes4) {
        return StoreInterface.getValue.selector;
    }

    function setValueSelector() external pure returns (bytes4){
        return StoreInterface.setValue.selector;
    }
}