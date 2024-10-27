// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./Foo.sol";

import {Person} from "./Foo.sol";

contract Import {
    Foo public foo = new Foo();
    // Test Foo.sol by getting it's name.
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}
