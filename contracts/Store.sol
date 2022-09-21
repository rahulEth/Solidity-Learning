// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./StoreInterface.sol";
import "./ERC165.sol";

contract Store is ERC165, StoreInterface {
  uint256 internal value;
  bytes4 internal constant STORE_INTERFACE_ID = 0x75b24222;
  function setValue(uint256 v) external {
    value = v;
  }
  function getValue() external view returns (uint256) {
    return value;
  }

  //0x01ffc9a7
  function supportsInterface(bytes4 interfaceId) external override pure returns (bool) {
    return interfaceId == 0x01ffc9a7 || interfaceId == 0x75b24222;
  }
}