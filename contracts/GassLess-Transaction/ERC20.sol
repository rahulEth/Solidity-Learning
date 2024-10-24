// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract ERC20Permit is ERC20 {
    using ECDSA for bytes32;

    // Mapping to track the nonces for each user to prevent replay attacks
    mapping(address => uint256) public nonces;

    // Domain separator for EIP-712
    bytes32 public DOMAIN_SEPARATOR;

    // EIP-2612 constant typehash
    bytes32 public constant PERMIT_TYPEHASH = keccak256(
        "Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)"
    );

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Calculate domain separator
        DOMAIN_SEPARATOR = keccak256(
            abi.encode(
                keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
                keccak256(bytes(name)),
                keccak256(bytes("1")), // Version
                block.chainid,
                address(this)
            )
        );
    }

    /**
     * @notice Implements EIP-2612 permit function for gasless approvals.
     * @param owner The address of the token owner.
     * @param spender The address which is allowed to spend the tokens.
     * @param value The amount of tokens to be spent.
     * @param deadline The deadline until the permit is valid.
     * @param v, r, s The ECDSA signature from the token owner.
     */
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external {
        require(block.timestamp <= deadline, "Permit: signature expired");

        // Construct the permit digest using EIP-712 encoding
        bytes32 digest = keccak256(
            abi.encodePacked(
                "\x19\x01",
                DOMAIN_SEPARATOR,
                keccak256(
                    abi.encode(
                        PERMIT_TYPEHASH,
                        owner,
                        spender,
                        value,
                        nonces[owner]++, // increment nonce after use
                        deadline
                    )
                )
            )
        );

        // Recover the signer from the signature
        address recoveredAddress = digest.recover(v, r, s);
        require(recoveredAddress == owner, "Permit: invalid signature");

        // Approve the spender to transfer tokens on behalf of owner
        _approve(owner, spender, value);
    }
}
