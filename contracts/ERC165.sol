//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-165.md
interface ERC165 {
  function supportsInterface(bytes4 interfaceId) external view returns (bool);
}