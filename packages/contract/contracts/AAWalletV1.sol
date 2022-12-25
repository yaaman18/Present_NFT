// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@account-abstraction/contracts/core/BaseAccount.sol";
import "./interfaces/IAAWallet.sol";

contract AAWalletV1 is IAAWallet {
    function validateUserOp(
        UserOperation calldata userOp,
        bytes32 userOpHash,
        address aggregator,
        uint256 missingAccountFunds
    ) external override returns (uint256 deadline) {}
}
