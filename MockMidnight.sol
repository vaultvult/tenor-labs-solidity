// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import {Market} from "@midnight/interfaces/IMidnight.sol";

contract MockMidnight {
    mapping(bytes32 => mapping(address => uint128)) public debts;
    mapping(bytes32 => mapping(address => mapping(uint256 => uint128))) public collaterals;

    function setDebt(bytes32 marketId, address borrower, uint128 amount) external {
        debts[marketId][borrower] = amount;
    }

    function setCollateral(bytes32 marketId, address borrower, uint256 index, uint128 amount) external {
        collaterals[marketId][borrower][index] = amount;
    }

    function debt(bytes32 marketId, address borrower) external view returns (uint128) {
        return debts[marketId][borrower];
    }

    function collateral(bytes32 marketId, address borrower, uint256 index) external view returns (uint128) {
        return collaterals[marketId][borrower][index];
    }

    function withdrawCollateral(Market memory, uint256, uint256, address, address) external {}
    function supplyCollateral(Market memory, uint256, uint256, address) external {}
}
