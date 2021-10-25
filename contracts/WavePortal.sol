// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import 'hardhat/console.sol';

struct Wave {
    address waver;
    string message;
    uint256 timestamp;
}

contract WavePortal {
    uint256 totalWaves;
    event NewWave(address indexed from, uint256 timestamp, string message);

    Wave[] waves;

    constructor() {
        console.log('Geat!! is a smart contract');
    }

    function wave(string memory _message) public {
        totalWaves++;
        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log('account: %s has %d waves', msg.sender, totalWaves);
        return totalWaves;
    }
}
