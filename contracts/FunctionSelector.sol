//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract Contract {

    MyContract contract1 = new MyContract();

    function getSelector() public view returns (bytes4, bytes4) {
        return (contract1.function1.selector, contract1.getBalance.selector);
    }

    function callGetValue(uint _x) public view returns (uint) {

        bytes4 selector = contract1.getValue.selector;

        bytes memory data = abi.encodeWithSelector(selector, _x);
        (bool success, bytes memory returnedData) = address(contract1).staticcall(data);
        require(success);

        return abi.decode(returnedData, (uint256));
    }
}

contract MyContract {

    function getSelector() public pure returns(bytes4, bytes4){
        return (bytes4(keccak256(bytes("getBalance(address)"))), bytes4(keccak256(bytes("function1()"))));
    }

    function function1() public {}

    function getBalance(address _address) public view returns (uint256){}

    function getValue (uint _value) public pure returns (uint) {
        return _value;
    }

}