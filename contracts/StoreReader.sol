//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "./StoreInterface.sol";
import "./ERC165.sol";
contract StoreReader {
  function getStoreValue(address store) external view returns (uint256) {
    if (ERC165(store).supportsInterface(0x75b24222)) {
      return StoreInterface(store).getValue();
    }
    revert("Does not support StoreInterface");
  }
}