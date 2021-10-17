// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    mapping(address => uint256) accounts;

    constructor() {
        console.log("Geat!! is a smart contract");
    }

    function wave() public {
        console.log("%s has waved!", msg.sender);
        accounts[msg.sender] += 1;
    }

    function getTotalWaves() public view returns (uint256) {
        uint256 totalWaves = accounts[msg.sender];
        console.log("account: %s has %d waves", msg.sender, totalWaves);
        return totalWaves;
    }
}
